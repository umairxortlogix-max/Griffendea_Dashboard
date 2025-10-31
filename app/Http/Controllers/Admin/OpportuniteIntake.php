<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\GhlUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OpportuniteIntake extends Controller
{
    public function index()
    {
        $users = GhlUser::select('id', 'first_name', 'last_name')->get();
        return view('admin.opportunitieIntaka', compact('users'));
    }

//     public function getLeadIntakeStats(Request $request)
//     {
//       // dd('here');
//         $assignedUser = $request->get('user'); // user id (optional)
//         $fromDate = $request->get('from');     // e.g. 2025-10-01
//         $toDate = $request->get('to');         // e.g. 2025-10-29

//         // ✅ Validate filters
//         if (!$fromDate || !$toDate) {
//             return response()->json(['error' => 'Missing date range'], 400);
//         }

//         // ✅ Query for "Lead Intake" pipeline
//         $query = DB::table('pipelines as p')
//             ->join('pipeline_stages as s', 's.pipeline_id', '=', 'p.id')
//             ->join('stage_change_logs as sl', function ($join) {
//                 $join->on('sl.pipeline_stage_id', '=', 's.pipeline_stage_id')
//                     ->whereColumn('sl.pipeline_id', 'p.pipeline_id');
//             })
//             ->join('opportunities as o', 'o.id', '=', 'sl.opportunity_id')
//             ->leftJoin('ghl_users as u', 'u.id', '=', 'o.assigned_to')
//             ->where('p.name', '1. Lead Intake')
//             ->when($assignedUser && $assignedUser !== 'all', function ($query, $assignedUser) {
//                 $query->where('o.assigned_to', $assignedUser);
//             })
//             ->whereBetween('sl.start_date', [$fromDate, $toDate])
//             ->select(
//                 's.name as stage_name',
//                 's.pipeline_stage_id',
//                 'sl.opportunity_id',
//                 'sl.start_date',
//                 'sl.end_date',
//                 'o.name as opportunity_name',
//                 DB::raw("CONCAT(u.first_name, ' ', u.last_name) as assigned_user")
//             )
//             ->get();

//         // ✅ Group by stage for counts
//         $movements = $query->groupBy('stage_name')->map(function ($group) {
//             return [
//                 'stage' => $group->first()->stage_name,
//                 'count' => $group->count(),
//             ];
//         })->values();

//         // ✅ Helper for safe stage count
//         $getCount = function ($stage) use ($movements) {
//             $stageObj = $movements->firstWhere('stage', $stage);
//             return $stageObj['count'] ?? 0;
//         };

//         // ✅ Summary for frontend (charts)
//         $summary = [
//             'newLead_to_didNotRespond' => $getCount("Didn’t Respond") ?: $getCount("Didn't Respond"),
//             'newLead_to_responded' => $getCount("Lead Responded"),
//             'responded_to_qualified' => $getCount("Qualified"),
//             'responded_to_lowPriority' => $getCount("Low Priority"),
//             'responded_to_disqualified' => $getCount("Disqualified"),
//         ];

//         // ✅ Return JSON
// // dd($summary, $movements, $assignedUser, $fromDate, $toDate);
                
//               return response()->json([
//             'summary' => $summary,
//             'movements' => $movements,
//             'total' => $movements->sum('count'),
//             'filters' => [
//                 'user' => $assignedUser,
//                 'from' => $fromDate,
//                 'to' => $toDate,
//             ],
//         ]);
//     }

    public function getLeadIntakeStats(Request $request)
    {
        $assignedUser = $request->get('user');
        $fromDate = $request->get('from');
        $toDate = $request->get('to');

        if (!$fromDate || !$toDate) {
            return response()->json(['error' => 'Missing date range'], 400);
        }

        $query = DB::table('pipelines as p')
            ->join('pipeline_stages as s', 's.pipeline_id', '=', 'p.id')
            ->join('stage_change_logs as sl', function ($join) {
                $join->on('sl.pipeline_stage_id', '=', 's.pipeline_stage_id')
                    ->whereColumn('sl.pipeline_id', 'p.pipeline_id');
            })
            ->join('opportunities as o', 'o.id', '=', 'sl.opportunity_id')
            ->leftJoin('ghl_users as u', 'u.id', '=', 'o.assigned_to')
            ->where('p.name', '1. Lead Intake')
            ->when($assignedUser && $assignedUser !== 'all', function ($query, $assignedUser) {
                $query->where('o.assigned_to', $assignedUser);
            })
            ->whereBetween('sl.start_date', [$fromDate, $toDate])
            ->select(
                's.name as stage_name',
                's.pipeline_stage_id',
                'sl.opportunity_id',
                'sl.start_date',
                'sl.end_date',
                'o.name as opportunity_name',
                DB::raw("CONCAT(u.first_name, ' ', u.last_name) as assigned_user")
            )
            ->get();

        // ✅ Group by stage
        $movements = $query->groupBy('stage_name')->map(function ($group) {
            return [
                'stage' => $group->first()->stage_name,
                'count' => $group->count(),
            ];
        })->values();

        $totalCount = $movements->sum('count');

        $movements = $movements->map(function ($item) use ($totalCount) {
            $item['percentage'] = $totalCount > 0 ? round(($item['count'] / $totalCount) * 100, 2) : 0;
            return $item;
        });

        $getCount = function ($stage) use ($movements) {
            $stageObj = $movements->firstWhere('stage', $stage);
            return $stageObj['count'] ?? 0;
        };

        // ✅ Stage summary
        $summary = [
            'newLead_total' => $getCount("New Lead"),
            'newLead_to_didNotRespond' => $getCount("Didn’t Respond") ?: $getCount("Didn't Respond"),
            'newLead_to_responded' => $getCount("Lead Responded"),
            'responded_to_qualified' => $getCount("Qualified"),
            'responded_to_lowPriority' => $getCount("Low Priority"),
            'responded_to_disqualified' => $getCount("Disqualified"),
        ];

        return response()->json([
            'summary' => $summary,
            'movements' => $movements,
            'total' => $totalCount,
            'filters' => [
                'user' => $assignedUser,
                'from' => $fromDate,
                'to' => $toDate,
            ],
        ]);
    }  

}
