<?php

namespace App\Http\Controllers\Admin;

use App\Helpers\formatMonetaryValue;
use App\Http\Controllers\Controller;
use App\Models\Contact;
use App\Models\GhlUser;
use App\Models\Message;
use App\Models\Opportunity;
use App\Models\Pipeline;
use App\Models\PipelineStage;
use App\Models\Setting;
use App\Models\StageChangeLog;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\DataTables;
use App\Models\Appointment;
use App\Models\Invoice;

use function Laravel\Prompts\table;
use function PHPUnit\Framework\isEmpty;

class DashboardController extends Controller
{

    public function index()
    {
        return view('admin.dashboard');
    }
    public function opportunities()
    {
        $locationId = Auth::user()->location_id;


        $users = GhlUser::select(
            'ghl_user_id',
            DB::raw("CONCAT(first_name, ' ', last_name) as name")
        )->where('location_id', $locationId)->get();

        $totalPipelines = Pipeline::select('pipeline_id', 'name')->where('location_id', $locationId)->get();
        $PipelinesIds = Pipeline::select('id', 'name')->where('location_id', $locationId)->get();
        $openTotal = Opportunity::where('status', 'open')->where('location_id', $locationId)->count();
        $closedTotal = Opportunity::where('status', 'close')->where('location_id', $locationId)->count();
        $wonTotal = Opportunity::where('status', 'won')->where('location_id', $locationId)->count();
        $monthlyOpportunities = Opportunity::selectRaw('MONTH(date_added) as month, COUNT(*) as total')
            ->groupBy('month')
            ->where('location_id', $locationId)
            ->pluck('total', 'month');

        $data = [];
        for ($i = 1; $i <= 12; $i++) {
            $data[] = $monthlyOpportunities[$i] ?? 0;
        }
        $pipelines = DB::table('pipelines as p')
            ->join('pipeline_stages as ps', 'ps.pipeline_id', '=', 'p.id')
            ->leftJoin('opportunities as o', function ($join) use ($locationId) {
                $join->on('o.pipeline_stage_id', '=', 'ps.pipeline_stage_id')
                    ->where('o.location_id', '=', $locationId); // filter by location
            })
            ->select(
                'p.id as pipeline_id',
                'p.name as pipeline_name',
                DB::raw('COUNT(DISTINCT ps.pipeline_stage_id) as total_stages'),
                DB::raw('COALESCE(SUM(CAST(o.monetary_value AS DECIMAL(12,2))), 0) as total_monetary_value')
            )
            ->groupBy('p.id', 'p.name')
            ->get();
        // dd($PipelinesIds);

        return view('admin.opportunities', [
            'users' => $users,
            'opportunitiesData' => $data,
            'opportunitiesTotal' => array_sum($data),
            'openOpportunities' => $openTotal,
            'closedOpportunities' => $closedTotal,
            'wonOpportunities' => $wonTotal,
            'totalPiplines' => $totalPipelines,
            'PipelinesIds' => $PipelinesIds,
            'pipelines' => $pipelines
        ]);
    }
    public function getPipelineStages(Request $request)
    {
        $pipelineId = $request->pipeline_id;

        if (!$pipelineId) {
            return response()->json([
                'stages' => [],
                'count' => 0
            ]);
        }

        // Fetch stages for the selected pipeline
        $stages = PipelineStage::where('pipeline_id', $pipelineId)
            ->select('id', 'name')
            ->orderBy('position', 'asc')
            ->get();

        // Count stages
        $count = $stages->count();
        // dd($stages, $count);
        return response()->json([
            'stages' => $stages,
            'count' => $count
        ]);
    }
    public function pipelineTostage(Request $request)
    {
        $pipelineId = $request->pipelineId;
        $stages = PipelineStage::where('pipeline_id', $pipelineId)
            ->orderBy('position', 'asc')->count()
            ->get();

        return response()->json($stages);
    }
    public function piplinesData(Request $request)
    {
        $locationId = Auth::user()->location_id;
        $monthlyOpportunities = \App\Models\Opportunity::selectRaw('MONTH(date_added) as month, COUNT(*) as total')
            ->groupBy('month')
            ->where('location_id', $locationId)
            ->pluck('total', 'month')
            ->toArray();
        $data = [];
        for ($i = 1; $i <= 12; $i++) {
            $data[] = $monthlyOpportunities[$i] ?? 0;
        }
        return response()->json($data);
    }

    public function singlePiplineStageConversion(Request $request)
    {

        $pipeline = Pipeline::where('id', $request->pipelineId)->first();
        if (!$pipeline) {
            return response()->json(['error' => 'Pipeline not found'], 404);
        }

        $pipeline_id = $pipeline->pipeline_id;
        $stages = PipelineStage::where('pipeline_id', $pipeline->id)
            ->orderBy('position', 'asc')
            ->get();
        $stages = PipelineStage::where('pipeline_id', $pipeline->id)
            ->orderBy('position', 'asc')
            ->get();

        $stageDurations = [];

        foreach ($stages as $stage) {
            $logs = StageChangeLog::where('pipeline_stage_id', $stage->pipeline_stage_id)
                ->whereNotNull('start_date')
                ->select(
                    DB::raw('TIMESTAMPDIFF(SECOND, start_date, COALESCE(end_date, NOW())) as duration')
                )
                ->get();

            if ($logs->count() > 0) {
                $averageSeconds = $logs->avg('duration');

                $stageDurations[] = [
                    'stage_name' => $stage->name,
                    'avg_duration_human' => gmdate('H:i:s', round($averageSeconds))
                ];
            } else {
                $stageDurations[] = [
                    'stage_name' => $stage->name,
                    'avg_duration_human' => '00:00:00'
                ];
            }
        }
        return response()->json($stageDurations);
    }
    public function pipelineStageDistribution(Request $request)
    {
        $pipeline_id = $request->pipeline_id;
        $ghl_user_id = $request->userId;

        $won = Opportunity::where('pipeline_id', $pipeline_id)
            ->when(!empty($ghl_user_id), function ($q) use ($ghl_user_id) {
                $q->where('assigned_to', $ghl_user_id);
            })
            ->where('status', 'won')
            ->count();

        $close = Opportunity::where('pipeline_id', $pipeline_id)
            ->when(!empty($ghl_user_id), function ($q) use ($ghl_user_id) {
                $q->where('assigned_to', $ghl_user_id);
            })
            ->where('status', 'close')
            ->count();

        $open = Opportunity::where('pipeline_id', $pipeline_id)
            ->when(!empty($ghl_user_id), function ($q) use ($ghl_user_id) {
                $q->where('assigned_to', $ghl_user_id);
            })
            ->where('status', 'open')
            ->count();

        return response()->json([
            'open' => $open,
            'won' => $won,
            'close' => $close,
        ]);
    }
    public function opportunitiesStatusPieChart()
    {
        $locationId = Auth::user()->location_id;
        $open = Opportunity::where('status', 'open')->where('location_id', $locationId)->count();
        $won = Opportunity::where('status', 'won')->where('location_id', $locationId)->count();
        $close = Opportunity::where('status', 'close')->where('location_id', $locationId)->count();

        return response()->json([
            'open' => $open,
            'won' => $won,
            'close' => $close,
        ]);
    }

    function updateAllCharts(Request $request)
    {
        $ghl_user_id = $request->userId;
        $locationId = Auth::user()->location_id;


        // $pipelines = DB::table('pipelines as p')
        //     ->join('pipeline_stages as ps', 'ps.pipeline_id', '=', 'p.id')
        //     ->leftJoin('opportunities as o', 'o.pipeline_stage_id', '=', 'ps.pipeline_stage_id')
        //     ->select(
        //         'p.id as pipeline_id',
        //         'p.name as pipeline_name',
        //         DB::raw('COUNT(DISTINCT ps.pipeline_stage_id) as total_stages'),
        //         DB::raw('COALESCE(SUM(CAST(o.monetary_value AS DECIMAL(12,2))), 0) as total_monetary_value')
        //     )
        //     ->when(!empty($ghl_user_id), function ($q) use ($ghl_user_id) {
        //         $q->where('o.assigned_to', $ghl_user_id);
        //     })
        //     ->groupBy('p.id', 'p.name')
        //     ->get();

        $pipelines = DB::table('pipelines as p')
            ->join('pipeline_stages as ps', 'ps.pipeline_id', '=', 'p.id')
            ->leftJoin('opportunities as o', function ($join) use ($locationId) {
                $join->on('o.pipeline_stage_id', '=', 'ps.pipeline_stage_id')
                    ->where('o.location_id', '=', $locationId);
            })
            ->select(
                'p.id as pipeline_id',
                'p.name as pipeline_name',
                DB::raw('COUNT(DISTINCT ps.pipeline_stage_id) as total_stages'),
                DB::raw('COALESCE(SUM(CAST(o.monetary_value AS DECIMAL(12,2))), 0) as total_monetary_value')
            )
            ->when(!empty($ghl_user_id), function ($q) use ($ghl_user_id, $locationId) {
                $q->where('o.location_id', $locationId)->where('o.assigned_to', $ghl_user_id);
            })
            ->groupBy('p.id', 'p.name')
            ->get();


        $monthlyOpportunities = Opportunity::selectRaw('MONTH(date_added) as month, COUNT(*) as total')
            ->when(!empty($ghl_user_id), function ($q) use ($ghl_user_id) {
                $q->where('assigned_to', $ghl_user_id);
            })
            ->groupBy('month')
            ->where('location_id', $locationId)
            ->pluck('total', 'month')
            ->toArray();

        $data = [];
        for ($i = 1; $i <= 12; $i++) {
            $data[] = $monthlyOpportunities[$i] ?? 0;
        }


        $openTotal = Opportunity::when(!empty($ghl_user_id), function ($q) use ($ghl_user_id) {
            $q->where('assigned_to', $ghl_user_id);
        })
            ->where('status', 'open')
            ->where('location_id', $locationId)
            ->count();

        $closedTotal = Opportunity::when(!empty($ghl_user_id), function ($q) use ($ghl_user_id) {
            $q->where('assigned_to', $ghl_user_id);
        })
            ->where('status', 'close')
            ->where('location_id', $locationId)
            ->count();

        $wonTotal = Opportunity::when(!empty($ghl_user_id), function ($q) use ($ghl_user_id) {
            $q->where('assigned_to', $ghl_user_id);
        })
            ->where('status', 'won')
            ->where('location_id', $locationId)
            ->count();

        if (!empty($ghl_user_id)) {
            $pipelineIds = Opportunity::where('assigned_to', $ghl_user_id)->where('location_id', $locationId)
                ->distinct()
                ->pluck('pipeline_id');

            $pipelines = Pipeline::whereIn('id', $pipelineIds)->get();
        } else {
            $pipelines = Pipeline::where('location_id', $locationId)->get();
        }

        $results = [];

        foreach ($pipelines as $pipeline) {
            $stages = PipelineStage::where('pipeline_id', $pipeline->id)->get();
            $allDurations = [];

            foreach ($stages as $stage) {
                $logs = StageChangeLog::where('pipeline_stage_id', $stage->pipeline_stage_id)
                    ->whereNotNull('start_date')
                    ->when(!empty($ghl_user_id), function ($q) use ($ghl_user_id) {
                        $q->where('assigned_to', $ghl_user_id); // filter logs by user
                    })
                    ->select(
                        DB::raw('TIMESTAMPDIFF(SECOND, start_date, COALESCE(end_date, NOW())) as duration')
                    )
                    ->get();

                if ($logs->count() > 0) {
                    $allDurations[] = $logs->avg('duration');
                }
            }

            $pipelineAverageSeconds = !empty($allDurations)
                ? array_sum($allDurations) / count($allDurations)
                : 0;

            $results[] = [
                'pipeline_name' => $pipeline->name,
                'avg_pipeline_time_human' => gmdate('H:i:s', round($pipelineAverageSeconds)),
                'avg_pipeline_time_days' => round($pipelineAverageSeconds / 86400, 2) // for chart plotting
            ];
        }

        // $cardsData = DB::table('pipelines as p')
        //     ->join('pipeline_stages as ps', 'ps.pipeline_id', '=', 'p.id')
        //     ->leftJoin('opportunities as o', 'o.pipeline_stage_id', '=', 'ps.pipeline_stage_id')
        //     ->select(
        //         'p.id as pipeline_id',
        //         'p.name as pipeline_name',
        //         DB::raw('COUNT(DISTINCT ps.pipeline_stage_id) as total_stages'),
        //         DB::raw('COALESCE(SUM(CAST(o.monetary_value AS DECIMAL(12,2))), 0) as total_monetary_value')
        //     )
        //     ->when(!empty($ghl_user_id), function ($query) use ($ghl_user_id) {
        //         $query->where('o.assigned_to', $ghl_user_id);
        //     })
        //     ->groupBy('p.id', 'p.name')
        //     ->get();

        // $cardsData = DB::table('pipelines as p')
        //     ->join('pipeline_stages as ps', 'ps.pipeline_id', '=', 'p.id')
        //     ->leftJoin('opportunities as o', 'o.pipeline_stage_id', '=', 'ps.pipeline_stage_id')
        //     ->where('o.location_id', $locationId)
        //     ->select(
        //         'p.id as pipeline_id',
        //         'p.name as pipeline_name',
        //         DB::raw('COUNT(DISTINCT ps.pipeline_stage_id) as total_stages'),
        //         DB::raw('COALESCE(SUM(CAST(o.monetary_value AS DECIMAL(12,2))), 0) as total_monetary_value')
        //     )
        //     ->when(!empty($ghl_user_id), function ($query) use ($ghl_user_id) {
        //         $query->where('o.assigned_to', $ghl_user_id);
        //     })
        //     ->when(!empty($locationId), function ($query) use ($locationId) {
        //         $query->where('o.location_id', $locationId);
        //     })
        //     ->groupBy('p.id', 'p.name')
        //     ->get();


        $cardsData = DB::table('pipelines as p')
            ->join('pipeline_stages as ps', 'ps.pipeline_id', '=', 'p.id')
            ->leftJoin('opportunities as o', function ($join) use ($locationId) {
                $join->on('o.pipeline_stage_id', '=', 'ps.pipeline_stage_id')
                    ->where('o.location_id', '=', $locationId);
            })
            ->select(
                'p.id as pipeline_id',
                'p.name as pipeline_name',
                DB::raw('COUNT(DISTINCT ps.pipeline_stage_id) as total_stages'),
                DB::raw('COALESCE(SUM(CAST(o.monetary_value AS DECIMAL(12,2))), 0) as total_monetary_value')
            )
            ->when(!empty($ghl_user_id), function ($query) use ($ghl_user_id) {
                $query->where('o.assigned_to', $ghl_user_id);
            })
            ->groupBy('p.id', 'p.name')
            ->get();


        // dd($cardsData);


        return response()->json([
            'pipelines' => $cardsData,
            'monthlyOpportunites' => $data,


            'openTotal' => $openTotal,
            'closedTotal' => $closedTotal,
            'wonTotal' => $wonTotal,

            //pipline velocity 
            'results' => $results


        ]);
    }

    public function pipelineVelocity(Request $request)
    {
        // $ghl_user_id = $request->userId;
        // $pipelineIds = Opportunity::where('assigned_to', $ghl_user_id)->select('pipeline_id')->get();
        $locationId = Auth::user()->location_id;
        $pipelines = Pipeline::where('location_id', $locationId)->get();

        $results = [];

        foreach ($pipelines as $pipeline) {
            $stages = PipelineStage::where('pipeline_id', $pipeline->id)->get();

            $allDurations = [];

            foreach ($stages as $stage) {
                $logs = StageChangeLog::where('pipeline_stage_id', $stage->pipeline_stage_id)
                    ->whereNotNull('start_date')
                    ->select(
                        DB::raw('TIMESTAMPDIFF(SECOND, start_date, COALESCE(end_date, NOW())) as duration')
                    )
                    ->get();

                if ($logs->count() > 0) {
                    $allDurations[] = $logs->avg('duration');
                }
            }

            $pipelineAverageSeconds = !empty($allDurations)
                ? array_sum($allDurations) / count($allDurations)
                : 0;

            $results[] = [
                'pipeline_name' => $pipeline->name,
                'avg_pipeline_time_human' => gmdate('H:i:s', round($pipelineAverageSeconds))
            ];
        }
        return response()->json($results);
    }

    public function contacts(Request $request)
    {
        $locationId = Auth::user()->location_id;
        // dd($locationId);
        $users = GhlUser::where('location_id', $locationId)->select('ghl_user_id', 'first_name', 'last_name')->get();
        // dd($users);
        $ghlUserId = $request->get('ghl_user_id');
        $startDate = $request->get('start_date');
        $endDate = $request->get('end_date');
        $country = $request->get('country');
        // Contacts query with location filter
        $query = Contact::query();
        if ($locationId) {
            $query->where('location_id', $locationId);
        }
        if ($ghlUserId) {
            $query->where('assigned_to', (string) $ghlUserId);
        }
        if ($startDate && $endDate) {
            $query->whereBetween('date_added', [
                Carbon::parse($startDate)->startOfDay(),
                Carbon::parse($endDate)->endOfDay()
            ]);
        }
        if ($country) {
            $query->whereRaw("UPPER(TRIM(country)) = ?", [strtoupper(trim($country))]);
        }
        $allContacts = $query->get();
        $contactIds = $allContacts->pluck('id')->filter()->all();
        // Countries for map
        $countryCounts = $allContacts->pluck('country')
            ->map(fn($c) => $c ? strtoupper(trim($c)) : 'Unknown')
            ->countBy()
            ->sortDesc();
        $totalContacts = $allContacts->count();
        // Leads
        $leads = $allContacts->where('type', 'lead')->count();
        // Messages (Calls) query
        $messagesQuery = Message::query()->where('message_type', 'CALL')
            ->leftJoin('contacts', 'messages.contact_id', '=', 'contacts.id');
        if ($locationId) {
            $messagesQuery->where('contacts.location_id', $locationId);
        }
        if ($ghlUserId) {
            $messagesQuery->where('contacts.assigned_to', $ghlUserId);
        }
        if ($country) {
            $messagesQuery->whereRaw("UPPER(TRIM(contacts.country)) = ?", [strtoupper(trim($country))]);
        }
        if ($startDate && $endDate) {
            $messagesQuery->whereBetween('messages.created_at', [
                Carbon::parse($startDate)->startOfDay(),
                Carbon::parse($endDate)->endOfDay()
            ]);
        }
        $totalCalls = $messagesQuery->count();
        // Appointments query
        $appointmentsQuery = Appointment::query()
            ->leftJoin('contacts', 'appointments.contact_id', '=', 'contacts.id');
        if ($locationId) {
            $appointmentsQuery->where('contacts.location_id', $locationId);
        }
        if ($contactIds) {
            $appointmentsQuery->whereIn('appointments.contact_id', $contactIds);
        }
        if ($startDate && $endDate) {
            $appointmentsQuery->whereBetween('appointments.created_at', [
                Carbon::parse($startDate)->startOfDay(),
                Carbon::parse($endDate)->endOfDay()
            ]);
        }
        $totalMeet = $appointmentsQuery->count();
        // Tags
        $contactTags = $allContacts->flatMap(function ($c) {
            if (is_string($c->tags) && trim($c->tags) !== '') {
                return collect(explode(',', $c->tags))->map(fn($t) => trim($t));
            }
            if (is_array($c->tags)) {
                return collect($c->tags)->map(fn($t) => trim($t));
            }
            return collect([]);
        })->filter();
        $totalTags = $contactTags->count();
        $topTags = $contactTags->countBy()->sortDesc()->take(3);
        // Emails (unique)
        $totalEmails = $allContacts->pluck('email')->filter()->unique()->count();
        // Conversion %
        $callsPercent = $leads > 0 ? ($totalCalls / $leads) * 100 : 0;
        $meetPercent = $leads > 0 ? ($totalMeet / $leads) * 100 : 0;
        // Previous week (with location filter)
        $previousCalls = Message::where('message_type', 'CALL')
            ->leftJoin('contacts', 'messages.contact_id', '=', 'contacts.id')
            ->where('contacts.location_id', $locationId)
            ->whereBetween('messages.created_at', [now()->subWeek(), now()])
            ->count();
        $previousMeet = Appointment::leftJoin('contacts', 'appointments.contact_id', '=', 'contacts.id')
            ->where('contacts.location_id', $locationId)
            ->whereBetween('appointments.created_at', [now()->subWeek(), now()])
            ->count();
        $callChange = $previousCalls > 0 ? (($totalCalls - $previousCalls) / $previousCalls) * 100 : 0;
        $meetChange = $previousMeet > 0 ? (($totalMeet - $previousMeet) / $previousMeet) * 100 : 0;
        // Sales chart
        $salesData = $allContacts
            ->groupBy(fn($c) => $c->date_added
                ? Carbon::parse($c->date_added)->format('Y-m-d')
                : ($c->created_at?->format('Y-m-d') ?? 'Unknown'))
            ->map->count()
            ->sortKeys();
        $totalSales = $salesData->sum();
        $totalUsers = $users->count();
        // For JS (tags, country)
        $contactsForJs = $allContacts->map(function ($c) {
            $tags = is_string($c->tags)
                ? collect(explode(',', $c->tags))->map(fn($t) => trim($t))->filter()->all()
                : (is_array($c->tags) ? collect($c->tags)->map(fn($t) => trim($t))->filter()->all() : []);
            return [
                'id' => $c->id,
                'type' => $c->type,
                'tags' => $tags,
                'country' => $c->country,
            ];
        });
        $allTags = \App\Models\Tag::pluck('tag_name')->unique()->values();
        return view('admin.contacts', compact(
            'countryCounts',
            'totalContacts',
            'totalSales',
            'leads',
            'salesData',
            'totalUsers',
            'users',
            'totalTags',
            'totalCalls',
            'totalMeet',
            'callsPercent',
            'meetPercent',
            'callChange',
            'meetChange',
            'totalEmails',
            'allTags',
            'contactsForJs',
            'ghlUserId',
            'startDate',
            'endDate',
            'topTags',
            'country'
        ));
    }
    public function appointments()
    {
        $locationId = Auth::user()->location_id;
        $users = GhlUser::select(
            'ghl_user_id',
            DB::raw("CONCAT(first_name, ' ', last_name) as name")
        )->where('location_id', $locationId)->get();
        $totalAppointments = Appointment::where('location_id', $locationId)->count();
        $newAppointments = Appointment::where('appointment_status', 'new')->where('location_id', $locationId)->count();
        $confirmedAppointments = Appointment::where('appointment_status', 'confirmed')->where('location_id', $locationId)->count();
        $cancelledAppointments = Appointment::where('appointment_status', 'cancelled')->where('location_id', $locationId)->count();
        $showedAppointments = Appointment::where('appointment_status', 'showed')->where('location_id', $locationId)->count();
        $noShowAppointments = Appointment::where('appointment_status', 'no-show')->where('location_id', $locationId)->count();
        $invalidAppointments = Appointment::where('appointment_status', 'invalid')->where('location_id', $locationId)->count();

        $months = [
            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'May',
            'Jun',
            'Jul',
            'Aug',
            'Sep',
            'Oct',
            'Nov',
            'Dec'
        ];

        $appointmentsPerMonth = Appointment::selectRaw('YEAR(created_at) as year, MONTH(created_at) as month, COUNT(*) as total')
            ->where('location_id', $locationId)
            ->groupBy('year', 'month')
            ->get()
            ->mapWithKeys(fn($row) => ["{$row->year}-{$row->month}" => $row->total])
            ->toArray();

        $appointmentsData = [];
        foreach (range(1, 12) as $m) {
            $appointmentsData[] = $appointmentsPerMonth[$m] ?? 0;
        }

        $currentMonthKey = now()->year . '-' . now()->month;
        $previousMonthKey = now()->subMonth()->year . '-' . now()->subMonth()->month;

        $currentMonthCount = $appointmentsPerMonth[$currentMonthKey] ?? 0;
        $previousMonthCount = $appointmentsPerMonth[$previousMonthKey] ?? 0;

        if ($previousMonthCount > 0) {
            $growthPercentage = round((($currentMonthCount - $previousMonthCount) / $previousMonthCount) * 100, 2);
        } elseif ($currentMonthCount > 0) {
            $growthPercentage = 100;
        } else {
            $growthPercentage = 0;
        }

        return view('admin.appointments', compact(
            'totalAppointments',
            'newAppointments',
            'confirmedAppointments',
            'cancelledAppointments',
            'showedAppointments',
            'noShowAppointments',
            'invalidAppointments',
            'months',
            'appointmentsData',
            'appointmentsPerMonth',
            'growthPercentage',
            'users'
        ));
    }

    public function appointmentsData(Request $request)
    {
        $locationId = Auth::user()->location_id;
        $status = $request->get('status');
        $start_date = $request->get('start_date');
        $end_date = $request->get('end_date');
        $userId = $request->get('userId');

        $query = Appointment::select('title', 'address', 'location_id', 'start_time');

        if (!empty($userId)) {
            $query->where('assigned_user_id', $userId);
        }
        if (!empty($locationId)) {
            $query->where('location_id', $locationId);
        }


        if ($status === 'total' && !empty($start_date) && !empty($end_date)) {
            $query->whereBetween('created_at', [
                \Carbon\Carbon::parse($start_date)->startOfDay(),
                \Carbon\Carbon::parse($end_date)->endOfDay()
            ]);
        } elseif ($status === 'total') {
        } elseif (!empty($start_date) && !empty($end_date)) {
            $query->where('appointment_status', $status)
                ->whereBetween('created_at', [
                    \Carbon\Carbon::parse($start_date)->startOfDay(),
                    \Carbon\Carbon::parse($end_date)->endOfDay()
                ]);
        } else {
            $query->where('appointment_status', $status);
        }

        $appointments = $query->limit(20)->get();

        $locationIds = $appointments->pluck('location_id')->unique()->toArray();

        $calendars = DB::table('calendars')
            ->whereIn('location_id', $locationIds)
            ->pluck('calendar_name', 'location_id');

        foreach ($appointments as $appointment) {
            $appointment->calendar_name = $calendars[$appointment->location_id] ?? null;
            unset($appointment->location_id);
        }



        return response()->json($appointments);
    }

    public function appointmentChartUpdate(Request $request)
    {
        $locationId = Auth::user()->location_id;
        $start = $request->get('start_date');
        $end = $request->get('end_date');
        $ghl_user_id = $request->get('userId');


        $query = Appointment::query();
        if ($start && $end) {
            $query->whereBetween('start_time', [$start . ' 00:00:00', $end . ' 23:59:59']);
        }

        if (!empty($ghl_user_id)) {
            $query->where('assigned_user_id', $ghl_user_id);
        }
        $new = (clone $query)->where('appointment_status', 'new')->where('location_id', $locationId)->count();
        $confirmed = (clone $query)->where('appointment_status', 'confirmed')->where('location_id', $locationId)->count();
        $cancelled = (clone $query)->where('appointment_status', 'cancelled')->where('location_id', $locationId)->count();
        $showed = (clone $query)->where('appointment_status', 'showed')->where('location_id', $locationId)->count();
        $noShow = (clone $query)->where('appointment_status', 'no-show')->where('location_id', $locationId)->count();
        $invalid = (clone $query)->where('appointment_status', 'invalid')->where('location_id', $locationId)->count();

        return response()->json([
            'new' => $new,
            'confirmed' => $confirmed,
            'cancelled' => $cancelled,
            'showed' => $showed,
            'no_show' => $noShow,
            'invalid' => $invalid,
        ]);
    }

    public function userAppointmentsChart()
    {

        $locationId = Auth::user()->location_id;
        // $appointmentsPerUser = DB::table('appointments')
        //     ->join('ghl_users', 'appointments.assigned_user_id', '=', 'ghl_users.ghl_user_id')
        //     ->selectRaw("CONCAT(ghl_users.first_name, ' ', ghl_users.last_name) as user, COUNT(appointments.id) as total")
        //     ->groupBy('appointments.assigned_user_id', 'ghl_users.first_name', 'ghl_users.last_name')
        //     ->get();
        $appointmentsPerUser = DB::table('appointments')
            ->join('ghl_users', 'appointments.assigned_user_id', '=', 'ghl_users.ghl_user_id')
            ->selectRaw("CONCAT(ghl_users.first_name, ' ', ghl_users.last_name) as user, COUNT(appointments.id) as total")
            ->where('appointments.location_id', $locationId)
            ->groupBy('appointments.assigned_user_id', 'ghl_users.first_name', 'ghl_users.last_name')
            ->get();


        return response()->json([
            'users' => $appointmentsPerUser->pluck('user'),
            'totals' => $appointmentsPerUser->pluck('total'),
        ]);
    }

    public function appointmentsByYear(Request $request)
    {
        $locationId = Auth::user()->location_id;
        $userId = $request->userId;
        $year = $request->get('year', now()->year);

        $appointmentsPerMonth = Appointment::selectRaw('MONTH(start_time) as month, COUNT(*) as total')
            ->where('location_id', $locationId)
            ->whereYear('start_time', $year)
            ->when(!empty($userId), function ($query) use ($userId) {
                $query->where('assigned_user_id', $userId);
            })
            ->groupBy('month')
            ->pluck('total', 'month')
            ->toArray();

        $months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        $data = [];

        foreach (range(1, 12) as $m) {
            $data[] = $appointmentsPerMonth[$m] ?? 0;
        }

        return response()->json([
            'months' => $months,
            'data' => $data
        ]);
    }
    public function updateAllAppointmentCharts(Request $request)
    {
        $locationId = Auth::user()->location_id;
        $start_date = $request->start_date ? \Carbon\Carbon::parse($request->start_date)->startOfDay() : null;
        $end_date = $request->end_date ? \Carbon\Carbon::parse($request->end_date)->endOfDay() : null;
        $year = $request->get('year', now()->year);

        $userId = $request->userId;

        // -------------------------
        // Helper closure for user filter
        // -------------------------
        $userFilter = function ($query) use ($userId) {
            if (!empty($userId)) {
                $query->where('assigned_user_id', $userId);
            }
        };

        $locationIdFilter = function ($query) use ($locationId) {
            if (!empty($locationId)) {
                $query->where('location_id', $locationId);
            }
        };


        // -------------------------
        // Cards Data
        // -------------------------
        $totalAppointments = Appointment::when($start_date && $end_date, fn($q) => $q->whereBetween('created_at', [$start_date, $end_date]))
            ->where($userFilter)
            ->where($locationIdFilter)
            ->count();

        $newAppointments = Appointment::where('appointment_status', 'new')
            ->when($start_date && $end_date, fn($q) => $q->whereBetween('created_at', [$start_date, $end_date]))
            ->where($userFilter)
            ->where($locationIdFilter)
            ->count();

        $confirmedAppointments = Appointment::where('appointment_status', 'confirmed')
            ->when($start_date && $end_date, fn($q) => $q->whereBetween('created_at', [$start_date, $end_date]))
            ->where($userFilter)
            ->where($locationIdFilter)
            ->count();

        $cancelledAppointments = Appointment::where('appointment_status', 'cancelled')
            ->when($start_date && $end_date, fn($q) => $q->whereBetween('created_at', [$start_date, $end_date]))
            ->where($userFilter)
            ->where($locationIdFilter)
            ->count();

        $showedAppointments = Appointment::where('appointment_status', 'showed')
            ->when($start_date && $end_date, fn($q) => $q->whereBetween('created_at', [$start_date, $end_date]))
            ->where($userFilter)
            ->where($locationIdFilter)
            ->count();

        $noShowAppointments = Appointment::where('appointment_status', 'no-show')
            ->when($start_date && $end_date, fn($q) => $q->whereBetween('created_at', [$start_date, $end_date]))
            ->where($userFilter)
            ->where($locationIdFilter)
            ->count();

        $invalidAppointments = Appointment::where('appointment_status', 'invalid')
            ->when($start_date && $end_date, fn($q) => $q->whereBetween('created_at', [$start_date, $end_date]))
            ->where($userFilter)
            ->where($locationIdFilter)
            ->count();

        // -------------------------
        // Line Graph Data (per user)
        // -------------------------
        // $appointmentsPerUser = DB::table('appointments')
        //     ->join('ghl_users', 'appointments.assigned_user_id', '=', 'ghl_users.ghl_user_id')
        //     ->selectRaw("CONCAT(ghl_users.first_name, ' ', ghl_users.last_name) as user, COUNT(appointments.id) as total")
        //     ->when($start_date && $end_date, function ($query) use ($start_date, $end_date) {
        //         $query->whereBetween('appointments.created_at', [$start_date, $end_date]);
        //     })
        //     ->when(!empty($userId), function ($query) use ($userId) {
        //         $query->where('appointments.assigned_user_id', $userId);
        //     })
        //     ->groupBy('appointments.assigned_user_id', 'ghl_users.first_name', 'ghl_users.last_name')
        //     ->get();
        $appointmentsPerUser = DB::table('appointments')
            ->join('ghl_users', 'appointments.assigned_user_id', '=', 'ghl_users.ghl_user_id')
            ->selectRaw("CONCAT(ghl_users.first_name, ' ', ghl_users.last_name) as user, COUNT(appointments.id) as total")
            ->when($start_date && $end_date, function ($query) use ($start_date, $end_date) {
                $query->whereBetween('appointments.created_at', [$start_date, $end_date]);
            })
            ->when(!empty($userId), function ($query) use ($userId) {
                $query->where('appointments.assigned_user_id', $userId);
            })
            ->when(!empty($locationId), function ($query) use ($locationId) {
                $query->where('appointments.location_id', $locationId); // filter by location
            })
            ->groupBy('appointments.assigned_user_id', 'ghl_users.first_name', 'ghl_users.last_name')
            ->get();



        // -------------------------
        // Monthly Appointments Data
        // -------------------------

        $query = Appointment::selectRaw('YEAR(start_time) as year, MONTH(start_time) as month, COUNT(*) as total');
        if ($start_date && $end_date) {
            $query->whereBetween('start_time', [$start_date, $end_date]);
        } else {
            $query->whereYear('start_time', $year);
        }

        if (!empty($userId)) {
            $query->where('assigned_user_id', $userId);
        }
        if (!empty($locationId)) {
            $query->where('location_id', $locationId);
        }
        $appointmentsPerMonth = $query->groupBy('year', 'month')
            ->orderBy('year')
            ->orderBy('month')
            ->get()
            ->mapWithKeys(fn($row) => ["{$row->year}-{$row->month}" => $row->total])
            ->toArray();

        // -----------------------------
        // Prepare chart labels + values
        // -----------------------------
        $appointmentsData = [];
        $labels = [];

        if ($start_date && $end_date) {
            $current = $start_date->copy()->startOfMonth();
            while ($current->lte($end_date)) {
                $key = $current->year . '-' . $current->month;
                $appointmentsData[] = $appointmentsPerMonth[$key] ?? 0;
                $labels[] = $current->format('M Y');
                $current->addMonth();
            }
        } else {
            $months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
            foreach (range(1, 12) as $m) {
                $key = $year . '-' . $m;
                $appointmentsData[] = $appointmentsPerMonth[$key] ?? 0;
                $labels[] = $months[$m - 1] . ' ' . $year;
            }
        }



        return response()->json([
            // Card data
            'totalAppointments' => $totalAppointments,
            'newAppointments' => $newAppointments,
            'confirmedAppointments' => $confirmedAppointments,
            'cancelledAppointments' => $cancelledAppointments,
            'showedAppointments' => $showedAppointments,
            'noShowAppointments' => $noShowAppointments,
            'invalidAppointments' => $invalidAppointments,

            // Line chart
            'users' => $appointmentsPerUser->pluck('user'),
            'totals' => $appointmentsPerUser->pluck('total'),


            // Monthly chart
            'labels' => $labels,
            'data' => $appointmentsData,
        ]);
    }




    public function invoices()
    {
        $locationId = Auth::user()->location_id;
        $users = GhlUser::select(
            'ghl_user_id',
            DB::raw("CONCAT(first_name, ' ', last_name) as name")
        )->where('location_id', $locationId)->get();
        $totalInvoices = Invoice::where('location_id', $locationId)->count();
        $draftInvoices = Invoice::where('status', 'draft')->where('location_id', $locationId)->count();
        $sentInvoices = Invoice::where('status', 'sent')->where('location_id', $locationId)->count();
        $paidInvoices = Invoice::where('status', 'paid')->where('location_id', $locationId)->count();
        $overdueInvoices = Invoice::where('status', 'overdue')->where('location_id', $locationId)->count();
        $cancelledInvoices = Invoice::where('status', 'cancelled')->where('location_id', $locationId)->count();

        return view('admin.invoices', compact(
            'users',
            'totalInvoices',
            'draftInvoices',
            'sentInvoices',
            'paidInvoices',
            'overdueInvoices',
            'cancelledInvoices'

        ));
    }

    public function invoicesData(Request $request)
    {

        $status = $request->get('status');
        $start_date = $request->get('start_date');
        $end_date = $request->get('end_date');
        $ghl_user_id = $request->get('userId');

        $locationId = Auth::user()->location_id;
        // dd($locationId);
        $query = Invoice::select(
            'name',
            'invoice_number',
            'title',
            'issue_date',
            'due_date',
            'discount_value',
            'subtotal',
            'total',
            'amount_paid',
            'amount_due',
            'status'
        );

        if (!empty($ghl_user_id)) {
            $invoice_contacts = Contact::where('assigned_to', $ghl_user_id)->where('location_id', $locationId)
                ->pluck('contact_id');

            $query->whereIn('contact_id', $invoice_contacts);
        }

        if ($status === 'total' && !empty($start_date) && !empty($end_date)) {
            $query->where('location_id', $locationId)->whereBetween('issue_date', [
                \Carbon\Carbon::parse($start_date)->startOfDay(),
                \Carbon\Carbon::parse($end_date)->endOfDay()
            ]);
        } elseif ($status == 'total') {
            $query->where('location_id', $locationId);
        } elseif (!empty($start_date) && !empty($end_date)) {
            $query->where('status', $status)->where('location_id', $locationId)
                ->whereBetween('issue_date', [
                    \Carbon\Carbon::parse($start_date)->startOfDay(),
                    \Carbon\Carbon::parse($end_date)->endOfDay()
                ]);
        } else {
            // dd('controle here');
            $query->where('status', $status)->where('location_id', $locationId);
        }
        $invoices = $query->limit(20)->get();
        // dd($invoices);

        return response()->json($invoices);
    }



    public function invoicesByYear(Request $request)
    {
        $ghl_user_id = $request->get('userId');
        $year = $request->get('year', now()->year);
        $locationId = Auth::user()->location_id;

        $invoicePerMonth = Invoice::selectRaw('MONTH(issue_date) as month, COUNT(*) as total')
            ->whereYear('issue_date', $year)
            ->where('location_id', $locationId);

        if (!empty($ghl_user_id)) {
            $invoice_contacts = Contact::where('assigned_to', $ghl_user_id)
                ->pluck('contact_id');

            $invoicePerMonth->whereIn('contact_id', $invoice_contacts);
        }

        $invoicePerMonth = $invoicePerMonth
            ->groupBy('month')
            ->pluck('total', 'month')
            ->toArray();

        $months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        $data = [];

        foreach (range(1, 12) as $m) {
            $data[] = $invoicePerMonth[$m] ?? 0;
        }

        return response()->json([
            'months' => $months,
            'data' => $data
            // 'data' => [0, 70, 90, 1, 34, 35, 6, 0, 0, 0, 0, 0]
        ]);
    }

    public function monthlyInvoiceAmount(Request $request)
    {

        // status = draft ;
        // status = sent ;
        // status = paid ;
        // status = overdue ;
        // status = cancelled ;

        // $invoicePerMonth = Invoice::selectRaw('YEAR(created_at) as year, MONTH(created_at) as month, SUM(total) as total_amount')
        //     ->groupBy('year', 'month')
        //     ->orderBy('year')
        //     ->orderBy('month')
        //     ->get()
        //     ->map(function ($row) {
        //         $months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        //         return [
        //             'month'        => $months[$row->month - 1] . ' ' . $row->year,
        //             'total_amount' => $row->total_amount,
        //         ];
        //     });

        // return response()->json([
        //     'months'       => $invoicePerMonth->pluck('month'),
        //     'amounts'      => $invoicePerMonth->pluck('total_amount'),
        // ]);
        // $startDate = $request->start_date;
        // $endDate = $request->end_date;
        // $ghl_user_id = $request->userId;
        //    $invoice_contacts = !empty($ghl_user_id)
        //     ? Contact::where('assigned_to', $ghl_user_id)->pluck('contact_id')
        //     : null;












        // PREVIOUS CODE 
        // $locationId = Auth::user()->location_id;
        // $invoicePerMonth = Invoice::selectRaw('
        // YEAR(issue_date) as year, 
        // MONTH(issue_date) as month, 
        // status, 
        // SUM(total) as total_amount
        //   ')
        //     ->groupBy('year', 'month', 'status')
        //     ->orderBy('year')
        //     ->orderBy('month')
        //     ->get()
        //     ->groupBy(function ($row) {
        //         return $row->year . '-' . str_pad($row->month, 2, '0', STR_PAD_LEFT);
        //     })
        //     ->map(function ($rows, $key) {
        //         $months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        //         $first  = $rows->first();

        //         return [
        //             'month' => $months[$first->month - 1] . ' ' . $first->year,
        //             'statuses' => $rows->mapWithKeys(function ($row) {
        //                 return [
        //                     $row->status => $row->total_amount,
        //                 ];
        //             })
        //         ];
        //     });



        // UPDATED LOCATION ID 
        $locationId = Auth::user()->location_id;

        $invoicePerMonth = Invoice::selectRaw('
        YEAR(issue_date) as year, 
        MONTH(issue_date) as month, 
        status, 
        SUM(total) as total_amount
    ')
            ->where('location_id', $locationId) // 👈 filter by location
            ->groupBy('year', 'month', 'status')
            ->orderBy('year')
            ->orderBy('month')
            ->get()
            ->groupBy(function ($row) {
                return $row->year . '-' . str_pad($row->month, 2, '0', STR_PAD_LEFT);
            })
            ->map(function ($rows, $key) {
                $months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                $first = $rows->first();

                return [
                    'month' => $months[$first->month - 1] . ' ' . $first->year,
                    'statuses' => $rows->mapWithKeys(function ($row) {
                        return [
                            $row->status => $row->total_amount,
                        ];
                    }),
                ];
            });


        return response()->json($invoicePerMonth->values());
    }


    public function updateAllInvoicesCharts(Request $request)
    {

        $start_date = $request->start_date ? \Carbon\Carbon::parse($request->start_date)->startOfDay() : null;
        $end_date = $request->end_date ? \Carbon\Carbon::parse($request->end_date)->endOfDay() : null;
        $year = $request->get('year', now()->year);
        $ghl_user_id = $request->userId;
        $locationId = Auth::user()->location_id;

        // find contacts assigned to this ghl_user_id
        $invoice_contacts = !empty($ghl_user_id)
            ? Contact::where('assigned_to', $ghl_user_id)->pluck('contact_id')
            : null;

        // helper for invoice query with filters
        $baseInvoiceQuery = function () use ($start_date, $end_date, $invoice_contacts) {
            return Invoice::when(
                $start_date && $end_date,
                fn($q) => $q->whereBetween('issue_date', [$start_date, $end_date])
            )
                ->when($invoice_contacts, fn($q) => $q->whereIn('contact_id', $invoice_contacts));
        };

        // counts
        $totalInvoices = $baseInvoiceQuery()->where('location_id', $locationId)->count();
        $draftInvoices = $baseInvoiceQuery()->where('status', 'draft')->where('location_id', $locationId)->count();
        $sentInvoices = $baseInvoiceQuery()->where('status', 'sent')->where('location_id', $locationId)->count();
        $paidInvoices = $baseInvoiceQuery()->where('status', 'paid')->where('location_id', $locationId)->count();
        $overdueInvoices = $baseInvoiceQuery()->where('status', 'overdue')->where('location_id', $locationId)->count();
        $cancelledInvoices = $baseInvoiceQuery()->where('status', 'cancelled')->where('location_id', $locationId)->count();

        // per user (based on contact)
        // $invoicePerUser = $baseInvoiceQuery()
        //     ->selectRaw('contact_id, COUNT(*) as total')
        //     ->groupBy('contact_id')
        //     ->get()
        //     ->map(function ($row) {
        //         return [
        //             'user'  => optional($row->contact)->name ?? 'Unknown',
        //             'total' => $row->total,
        //         ];
        //     });


        //         $startDate   = $request->start_date;
        // $endDate     = $request->end_date;
        // $ghl_user_id = $request->userId;


        // $invoiceQuery = Invoice::selectRaw('
        //         YEAR(issue_date) as year, 
        //         MONTH(issue_date) as month, 
        //         status, 
        //         SUM(total) as total_amount
        //     ');

        // // ✅ Apply filters dynamically
        // if (!empty($invoice_contacts)) {
        //     $invoiceQuery->whereIn('contact_id', $invoice_contacts);
        // }

        // if (!empty($start_date) && !empty($end_date)) {
        //     $invoiceQuery->whereBetween('issue_date', [
        //         \Carbon\Carbon::parse($start_date)->startOfDay(),
        //         \Carbon\Carbon::parse($end_date)->endOfDay()
        //     ]);
        // }

        // $invoicePerMonth = $invoiceQuery
        //     ->groupBy('year', 'month', 'status')
        //     ->orderBy('year')
        //     ->orderBy('month')
        //     ->get()
        //     ->groupBy(function ($row) {
        //         return $row->year . '-' . str_pad($row->month, 2, '0', STR_PAD_LEFT);
        //     })
        //     ->map(function ($rows, $key) {
        //         $months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        //                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        //         $first = $rows->first();

        //         return [
        //             'month' => $months[$first->month - 1] . ' ' . $first->year,
        //             'statuses' => $rows->mapWithKeys(function ($row) {
        //                 return [
        //                     $row->status => $row->total_amount,
        //                 ];
        //             })
        //         ];
        //     });
        // dd($invoicePerMonth->values());
        // return response()->json();




        $invoicePerMonth = Invoice::selectRaw('
        YEAR(issue_date) as year, 
        MONTH(issue_date) as month, 
        status, 
        SUM(total) as total_amount
        ')
            ->when(!empty($ghl_user_id), function ($q) use ($invoice_contacts) {
                return $q->whereIn('contact_id', $invoice_contacts);
            })
            ->when(!empty($start_date) && !empty($end_date), function ($q) use ($start_date, $end_date) {
                return $q->whereBetween('issue_date', [$start_date, $end_date]);
            })
            ->groupBy('year', 'month', 'status')
            ->where('location_id', $locationId)
            ->orderBy('year')
            ->orderBy('month')
            ->get() // returns Collection
            ->groupBy(function ($row) {
                return $row->year . '-' . str_pad($row->month, 2, '0', STR_PAD_LEFT);
            })
            ->map(function ($rows, $key) {
                $months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                $first = $rows->first();

                return [
                    'month' => $months[$first->month - 1] . ' ' . $first->year,
                    'statuses' => $rows->mapWithKeys(function ($row) {
                        return [$row->status => $row->total_amount];
                    })
                ];
            });





        // per month
        $query = $baseInvoiceQuery()
            ->selectRaw('YEAR(issue_date) as year, MONTH(issue_date) as month, COUNT(*) as total')->where('location_id', $locationId);

        if ($start_date && $end_date) {
            $query->whereBetween('issue_date', [$start_date, $end_date])->where('location_id', $locationId);
        } else {
            $query->whereYear('issue_date', $year)->where('location_id', $locationId);
        }

        $invoice_per_month = $query->groupBy('year', 'month')->where('location_id', $locationId)
            ->orderBy('year')
            ->orderBy('month')
            ->get()
            ->mapWithKeys(fn($row) => ["{$row->year}-{$row->month}" => $row->total])
            ->toArray();

        $invoiceData = [];
        $labels = [];

        if ($start_date && $end_date) {
            $current = $start_date->copy()->startOfMonth();
            while ($current->lte($end_date)) {
                $key = $current->year . '-' . $current->month;
                $invoiceData[] = $invoice_per_month[$key] ?? 0;
                $labels[] = $current->format('M Y');
                $current->addMonth();
            }
        } else {
            $months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
            foreach (range(1, 12) as $m) {
                $key = $year . '-' . $m;
                $invoiceData[] = $invoice_per_month[$key] ?? 0;
                $labels[] = $months[$m - 1] . ' ' . $year;
            }
        }


        // dd($invoicePerMonth);

        return response()->json([
            'totalInvoices' => $totalInvoices,
            'draftInvoices' => $draftInvoices,
            'sentInvoices' => $sentInvoices,
            'paidInvoices' => $paidInvoices,
            'overdueInvoices' => $overdueInvoices,
            'cancelledInvoices' => $cancelledInvoices,



            // 'invoiceLineChart' => $invoicePerMonth->values(),
            'invoiceLineChart' => $invoicePerMonth,

            // 'users'  => $invoicePerUser->pluck('user'),
            // 'totals' => $invoicePerUser->pluck('total'),

            'labels' => $labels,
            'data' => $invoiceData,
        ]);
    }


    public function invoiceChartUpdate(Request $request)
    {
        $start = $request->get('start_date');
        $end = $request->get('end_date');
        $ghl_user_id = $request->get('userId');
        $locationId = Auth::user()->location_id;

        $invoice_contacts = !empty($ghl_user_id)
            ? Contact::where('assigned_to', $ghl_user_id)->pluck('contact_id')
            : null;


        if (!empty($ghl_user_id) && (empty($invoice_contacts) || $invoice_contacts->isEmpty())) {
            return;
        }

        $query = Invoice::query();

        if ($start && $end) {
            $query->where('location_id', $locationId)->whereBetween('issue_date', [$start . ' 00:00:00', $end . ' 23:59:59']);
        }

        if (!empty($invoice_contacts) && $invoice_contacts->isNotEmpty()) {
            $query->where('location_id', $locationId)->whereIn('contact_id', $invoice_contacts);
        }

        $draftInvoices = (clone $query)->where('status', 'draft')->where('location_id', $locationId)->count();
        $sentInvoices = (clone $query)->where('status', 'sent')->where('location_id', $locationId)->count();
        $paidInvoices = (clone $query)->where('status', 'paid')->where('location_id', $locationId)->count();
        $overdueInvoices = (clone $query)->where('status', 'overdue')->where('location_id', $locationId)->count();
        $cancelledInvoices = (clone $query)->where('status', 'cancelled')->where('location_id', $locationId)->count();


        //         dd(

        //                $draftInvoices ,
        //     $sentInvoices ,
        //    $paidInvoices  ,
        // $overdueInvoices  ,
        // $cancelledInvoices
        //         );
        return response()->json([
            'draftInvoices' => $draftInvoices,
            'sentInvoices' => $sentInvoices,
            'paidInvoices' => $paidInvoices,
            'overdueInvoices' => $overdueInvoices,
            'cancelledInvoices' => $cancelledInvoices
        ]);
    }







    public function getDashboardData(Request $request)
    {
        $data = $this->fetchDashboardData($request);
        return response()->json($data);
    }
    public function getSalesRecordData(Request $request)
    {
        $dateRange = $request->get('customDateRange', '');
        [$startDate, $endDate] = $this->parseDateRange($dateRange);

        $authUser = auth()->user();

        $user = User::find($authUser->id);
        $assignedUserIds = $this->getFilteredUserIds($user, $request->input('location_user'));

        $query = GhlUser::whereIn('user_id', $assignedUserIds)
            ->select(['id', 'first_name', 'last_name'])
            ->withCount([
                'contacts' => fn($q) => $q->whereBetween('contacts.date_added', [$startDate, $endDate]),
                'wonOpportunities' => fn($q) => $q->whereBetween('opportunities.date_added', [$startDate, $endDate]),
            ])
            ->withSum(['wonOpportunities' => fn($q) => $q->whereBetween('opportunities.date_added', [$startDate, $endDate])], 'monetary_value')
            ->orderByDesc('won_opportunities_sum_monetary_value');
        return DataTables::of($query)
            ->addColumn('name', fn($user) => $user->first_name . ' ' . $user->last_name)
            ->addColumn('sale', fn($user) => '$' . formatMonetaryValue($user->won_opportunities_sum_monetary_value, 2))
            ->addColumn('won', fn($user) => $user->won_opportunities_count)
            ->addColumn('ratio', function ($user) {
                $contacts = $user->contacts_count;
                $won = $user->won_opportunities_count;
                return $contacts > 0 ? round(($won / $contacts) * 100, 2) . '%' : '0%';
            })
            ->rawColumns(['name', 'sale', 'won', 'ratio'])
            ->make(true);
    }

    private function fetchDashboardData(Request $request)
    {
        $dateRange = $request->get('customDateRange', '');
        [$startDate, $endDate] = $this->parseDateRange($dateRange);

        $authUser = auth()->user();
        $user = User::find($authUser->id);
        $userLocationId = $user->location_id;
        $assignedUserIds = $this->getFilteredUserIds($user, $request->input('location_user'));

        $stats = $this->getDashboardStats($userLocationId, $assignedUserIds, $startDate, $endDate);
        return [
            'stats' => $stats,
            'chartData' => $this->getChartData($userLocationId, $assignedUserIds, $startDate, $endDate),
            'topUsers' => $this->getTopUsers($assignedUserIds, $user->role),
            'dateRange' => $dateRange,
        ];
    }

    private function parseDateRange($dateRange)
    {
        if (!empty($dateRange)) {
            try {
                $dates = explode(' - ', $dateRange);
                if (count($dates) === 2) {
                    $startDate = Carbon::createFromFormat('m/d/Y', trim($dates[0]))->startOfDay();
                    $endDate = Carbon::createFromFormat('m/d/Y', trim($dates[1]))->endOfDay();
                    return [$startDate, $endDate];
                }
            } catch (\Exception $e) {
                \Log::error('Invalid date range: ' . $e->getMessage());
            }
        }
        return [Carbon::now()->startOfMonth(), Carbon::now()->endOfMonth()];
    }

    private function getFilteredUserIds($user, $locationUserId)
    {
        if ($locationUserId) {
            $validAgent = User::where('id', $locationUserId)->exists();
            if ($validAgent)
                return collect([$locationUserId]);
        }
        return $this->getAssignedUserIds($user);
    }

    private function getAssignedUserIds($user)
    {
        if ($user->role === 2) {
            return User::where('assigned_to', $user->id)->pluck('id');
        } elseif ($user->role === 3) {
            return collect([$user->id]);
        }
        return collect();
    }

    private function getDashboardStats($userLocationId, $assignedUserIds, $startDate, $endDate)
    {
        $assignedGhlUserIds = GhlUser::whereIn('user_id', $assignedUserIds)->pluck('ghl_user_id');

        $stats = [
            'totalWonValueRaw' => 0,
            'outboundCallCount' => 0,
            'totalCallTalkTime' => 0,
            'conversionRatio' => 0,
            'totalGoal' => 0,
            'totalpoliciesGoal' => 0,
            'wonOpportunities' => 0,
            'progressPercent' => 0,
            'progressPercentPolicies' => 0,
        ];

        if ($assignedGhlUserIds->isNotEmpty()) {
            $settings = Setting::whereIn('key', ['policies', 'premium'])->pluck('value', 'key')->toArray();
            $policyValue = floatval($settings['policies'] ?? 0);
            $premiumValue = floatval($settings['premium'] ?? 0);

            $userCount = $assignedGhlUserIds->count();
            $now = Carbon::now();
            $start = Carbon::parse($startDate)->startOfDay();
            $end = Carbon::parse($endDate)->endOfDay();

            $isFullMonth = $start->isSameDay($now->startOfMonth()) && $end->isSameDay($now->endOfMonth());

            if ($isFullMonth) {
                $stats['totalpoliciesGoal'] = round($userCount * $policyValue);
                $stats['totalGoal'] = round($userCount * $premiumValue);
            } else {
                $daysInRange = $start->diffInDays($end) + 1;
                $daysInMonth = $now->daysInMonth;
                $stats['totalpoliciesGoal'] = round(($userCount * $policyValue / $daysInMonth) * $daysInRange, 2);
                $stats['totalGoal'] = round(($userCount * $premiumValue / $daysInMonth) * $daysInRange, 2);
            }

            $stats['totalWonValueRaw'] = Opportunity::where('status', 'won')
                ->whereIn('assigned_to', $assignedGhlUserIds)
                ->whereBetween('date_added', [$startDate, $endDate])
                ->sum('monetary_value');

            $stats['wonOpportunities'] = Opportunity::where('status', 'won')
                ->whereIn('assigned_to', $assignedGhlUserIds)
                ->whereBetween('date_added', [$startDate, $endDate])
                ->count();

            $stats['outboundCallCount'] = Message::where('type', 'OutboundMessage')
                ->where('message_type', 'CALL')
                ->whereIn('assigned_to', $assignedGhlUserIds)
                ->whereBetween('date_added', [$startDate, $endDate])
                ->count();

            $stats['totalCallTalkTime'] = Message::where('type', 'OutboundMessage')
                ->where('message_type', 'CALL')
                ->whereIn('assigned_to', $assignedGhlUserIds)
                ->whereBetween('date_added', [$startDate, $endDate])
                ->sum('call_duration');

            $totalContacts = Contact::whereIn('assigned_to', $assignedGhlUserIds)
                ->whereBetween('date_added', [$startDate, $endDate])
                ->count();

            $stats['conversionRatio'] = $totalContacts > 0
                ? round(($stats['wonOpportunities'] / $totalContacts) * 100, 2)
                : 0;

            $stats['progressPercent'] = $stats['totalGoal'] > 0
                ? min(($stats['totalWonValueRaw'] / $stats['totalGoal']) * 100, 100)
                : 0;

            $stats['progressPercentPolicies'] = $stats['totalpoliciesGoal'] > 0
                ? min(($stats['wonOpportunities'] / $stats['totalpoliciesGoal']) * 100, 100)
                : 0;
        }

        return $stats;
    }

    private function getChartData($userLocationId, $assignedUserIds, $startDate, $endDate)
    {
        $assignedGhlUserIds = GhlUser::whereIn('user_id', $assignedUserIds)->pluck('ghl_user_id');

        return [
            'email_count' => Contact::whereIn('assigned_to', $assignedGhlUserIds)
                ->whereNotNull('email')
                ->whereBetween('date_added', [$startDate, $endDate])
                ->count(),
            'won_opportunity_count' => Opportunity::whereIn('assigned_to', $assignedGhlUserIds)
                ->where('status', 'won')
                ->whereBetween('date_added', [$startDate, $endDate])
                ->count(),
            'call_count' => Message::whereIn('assigned_to', $assignedGhlUserIds)
                ->whereBetween('date_added', [$startDate, $endDate])
                ->count(),
        ];
    }

    private function getTopUsers($assignedUserIds, $userRole)
    {
        $limit = $userRole === 3 ? 1 : 3;
        $monthStart = now()->startOfMonth();
        $monthEnd = now()->endOfMonth();

        return GhlUser::select(['first_name', 'last_name', 'profile_photo'])
            ->withSum(['wonOpportunities' => fn($q) => $q->whereBetween('opportunities.date_added', [$monthStart, $monthEnd])], 'monetary_value')
            // ->whereIn('user_id', $assignedUserIds)
            ->orderByDesc('won_opportunities_sum_monetary_value')
            ->take($limit)
            ->get();
    }

    private function getDataTableResponse(Request $request)
    {
        $dateRange = $request->get('customDateRange', '');
        [$startDate, $endDate] = $this->parseDateRange($dateRange);

        $authUser = auth()->user();
        $user = User::find($authUser->id);
        $assignedUserIds = $this->getFilteredUserIds($user, $request->input('location_user'));

        $query = GhlUser::select(['id', 'first_name', 'last_name', 'email', 'role', 'ghl_user_id'])
            ->withCount([
                'contacts' => fn($q) => $q->whereBetween('contacts.date_added', [$startDate, $endDate]),
                'opportunities' => fn($q) => $q->whereBetween('opportunities.date_added', [$startDate, $endDate]),
                'OutboundMessage' => fn($q) => $q->whereBetween('messages.date_added', [$startDate, $endDate]),
                'inboundMessage' => fn($q) => $q->whereBetween('messages.date_added', [$startDate, $endDate]),
                'smsMessage' => fn($q) => $q->whereBetween('messages.date_added', [$startDate, $endDate]),
                'wonOpportunities' => fn($q) => $q->where('status', 'won')->whereBetween('opportunities.date_added', [$startDate, $endDate]),
            ])
            ->withSum(['wonOpportunities' => fn($q) => $q->where('status', 'won')->whereBetween('opportunities.date_added', [$startDate, $endDate])], 'monetary_value')
            ->addSelect([
                'note_count' => function ($q) use ($startDate, $endDate) {
                    $q
                        ->selectRaw('count(*)')
                        ->from('notes')
                        ->join('contacts', 'contacts.contact_id', '=', 'notes.contact_id')
                        ->whereColumn('contacts.assigned_to', 'ghl_users.ghl_user_id')
                        ->whereBetween('notes.date_added', [$startDate, $endDate]);
                },
            ])
            ->whereIn('user_id', $assignedUserIds)
            ->orderByDesc('won_opportunities_sum_monetary_value');
        return DataTables::of($query)
            ->addColumn('full_name', fn($user) => $user->first_name . ' ' . $user->last_name)
            ->addColumn('contacts_count', fn($user) => $user->contacts_count)
            ->addColumn('opportunities_count', fn($user) => $user->opportunities_count)
            ->addColumn('outbound_message_count', fn($user) => $user->outbound_message_count)
            ->addColumn('inbound_message_count', fn($user) => $user->inbound_message_count)
            ->addColumn('total_won_opportunities', fn($user) => $user->won_opportunities_count)
            ->addColumn('total_won_value', fn($user) => '$' . formatMonetaryValue($user->won_opportunities_sum_monetary_value))
            ->addColumn('sms_message_count', fn($user) => $user->sms_message_count)
            ->addColumn('note_count', fn($user) => $user->note_count)
            ->make(true);
    }
}
