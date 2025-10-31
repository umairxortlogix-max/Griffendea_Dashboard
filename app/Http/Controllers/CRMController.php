<?php

namespace App\Http\Controllers;

use App\Models\Opportunity;
use Illuminate\Http\Request;
use App\Models\GhlAuth;
use App\Models\Pipeline;
use App\Models\PipelineStage;
use App\Models\LocationDetail;
use App\Helpers\CRM;
use App\Models\CustomField;
use App\Models\CustomValue;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use App\Models\Calendar;
use App\Models\Contact;

use Illuminate\Support\Facades\Http;
use App\Models\GhlUser;

class CRMController extends Controller
{
    public function crmCallback(Request $request)
    {
        $code = $request->code ?? null;
        if ($code) {
            $user_id = null;
            if (Auth::check()) {
                $user = loginUser();
                //auth user
                // if ( $user->role == company_role() ) {

                // }
                $user_id = $user->id;
            }
            $code = CRM::crm_token($code, '');
            $code = json_decode($code);
            $user_type = $code->userType ?? null;
            $main = route('admin.setting.index');
            //change with any desired
            if ($user_type) {
                $token = $user->ghlauth ?? null;

                list($connected, $con) = CRM::go_and_get_token($code, '', $user_id, $token);
                if ($connected) {
                    return redirect($main)->with('success', 'Connected Successfully');
                }
                return redirect($main)->with('error', json_encode($code));
            }
            return response()->json(['message' => 'Not allowed to connect']);
        }
    }

    public function fetchLocations(Request $request)
    {
        //this code is only useable if need to store locations in database or connect with already saved locations in database using agency token
        $user = loginUser();
        $token1 = $user->ghlauth ?? null;
        $token = $token1[0];
        $status = false;
        $message = 'Connect to  Agency First';
        $type = '';
        $detail = '';
        $load_more = false;
        if ($token) {

            $type = $token->user_type;

            $query = '';
            $limit = 100;
            if ($request->has('page')) {
                if ($request->page < 2) {
                    $request->page = 0;
                }
                $query .= 'skip=' . ($limit * $request->page) . '&';
            }
            $query = 'locations/search?' . $query . 'limit=' . $limit . '&companyId=' . $token->company_id;

            if ($type !== CRM::$lang_com) {
                return response()->json(['status' => $status, 'message' => $message, 'type' => $type, 'detail' => $detail, 'loadMore' => $load_more]);
            } else {
                $detail = CRM::agencyV2($user->id, $query, 'get', '', [], false, $token);
            }

            if ($detail && property_exists($detail, 'locations')) {
                $detail = $detail->locations;
                $load_more = count($detail) > $limit - 1;
                $ids = collect($detail)->pluck('id')->toArray();
                $locs_already = [];
                // Locations::whereIn( 'location_id', $ids )->pluck( 'location_id' )->toArray();
                foreach ($detail as $det) {
                    Log::info(['crm' => $det]);
                    $locationId = CRM::connectLocation($user->id, $det->id, $token);
                    if (!empty($locationId) && isset($locationId->location_id)) {
                        $ghl = GhlAuth::where('location_id', $locationId->location_id)->first();
                        if ($ghl) {
                            $ghl->name = $det->name;
                            $ghl->save();
                            Log::info('Updated GhlAuth record', [
                                'location_id' => $locationId->location_id,
                                'name' => $det->name,
                            ]);
                        }
                    }
                    if (!in_array($det->id, $locs_already)) {
                        //saveLocs( $det, $user->id );
                    }
                }
                $status = true;
            }
        }
        return response()->json(['status' => $status, 'message' => $message, 'type' => $type, 'detail' => $detail, 'loadMore' => $load_more]);
    }

  

    // public function synLocationData()
    // {
    //     $token = GhlAuth::where('user_id', Auth::id())->first();
    
    //     if (!$token) {
    //         return response()->json([
    //             'status' => false,
    //             'message' => 'Token not found.'
    //         ], 404);
    //     }
    
    //     $locationId = $token->location_id;
    //     $userId = Auth::id();
    
    //     try {
    //         // ===== Fetch Opportunities =====
    //         $opportunitiesData = CRM::crmV2($userId, 'opportunities/search', 'get', '', [], false, $locationId, $token);
    //         $opportunitiesData = json_decode(json_encode($opportunitiesData), true);
    
    //         if (empty($opportunitiesData['opportunities'])) {
    //             return response()->json([
    //                 'status' => false,
    //                 'message' => 'No opportunities found.'
    //             ], 200);
    //         }
    
    //         $totalOpps = 0; // <-- Initialize counter
    //         $opportunities = $opportunitiesData['opportunities'];
    
    //         DB::beginTransaction();
    
    //         foreach ($opportunities as $item) {
    //             $record = [
    //                 'id' => $item['id'], // keep primary key
    //                 'location_id' => $item['locationId'] ?? null,
    //                 'opportunity_id' => $item['id'] ?? null,
    //                 'assigned_to' => $item['assignedTo'] ?? null,
    //                 'contact_id' => $item['contactId'] ?? null,
    //                 'monetary_value' => $item['monetaryValue'] ?? 0,
    //                 'name' => $item['name'] ?? null,
    //                 'pipeline_id' => $item['pipelineId'] ?? null,
    //                 'pipeline_stage_id' => $item['pipelineStageId'] ?? null,
    //                 'source' => $item['source'] ?? null,
    //                 'status' => $item['status'] ?? 'open',
    //                 'last_status_change_at' => isset($item['lastStatusChangeAt']) ? Carbon::parse($item['lastStatusChangeAt']) : null,
    //                 'last_stage_change_at' => isset($item['lastStageChangeAt']) ? Carbon::parse($item['lastStageChangeAt']) : null,
    //                 'last_action_date' => isset($item['lastActionDate']) ? Carbon::parse($item['lastActionDate']) : null,
    //                 'created_at' => isset($item['createdAt']) ? Carbon::parse($item['createdAt']) : now(),
    //                 'updated_at' => isset($item['updatedAt']) ? Carbon::parse($item['updatedAt']) : now(),
    //                 'user_id' => $userId,
    //             ];
    
    //             // First try updating by primary key 'id', if not exist, try 'opportunity_id'
    //             $opportunity = Opportunity::where('id', $item['id'])
    //                 ->orWhere('opportunity_id', $item['id'])
    //                 ->first();
    
    //             if ($opportunity) {
    //                 $opportunity->update($record);
    //             } else {
    //                 Opportunity::create($record);
    //             }
    
    //             $totalOpps++;
    //         }
    
    //         // ===== Fetch Pipelines =====
    //         $pipelinesData = CRM::crmV2($userId, 'opportunities/pipelines', 'get', '', [], false, $locationId, $token);
    //         $pipelinesData = json_decode(json_encode($pipelinesData), true);
    
    //         if (!empty($pipelinesData['pipelines'])) {
    //             foreach ($pipelinesData['pipelines'] as $apiPipeline) {
    //                 $pipeline = Pipeline::updateOrCreate(
    //                     [
    //                         'pipeline_id' => $apiPipeline['id'],
    //                         'location_id' => $locationId,
    //                     ],
    //                     [
    //                         'name' => $apiPipeline['name'] ?? null,
    //                     ]
    //                 );
    
    //                 if (!empty($apiPipeline['stages'])) {
    //                     foreach ($apiPipeline['stages'] as $stage) {
    //                         PipelineStage::updateOrCreate(
    //                             [
    //                                 'pipeline_id' => $pipeline->id,
    //                                 'location_id' => $locationId,
    //                                 'pipeline_stage_id' => $stage['id'],
    //                             ],
    //                             [
    //                                 'name' => $stage['name'] ?? null,
    //                                 'position' => $stage['position'] ?? 0,
    //                             ]
    //                         );
    //                     }
    //                 }
    //             }
    //         }
    
    //         DB::commit();
    
    //         return response()->json([
    //             'status' => true,
    //             'message' => 'Data synced successfully.',
    //             'total_opportunities' => $totalOpps, // Optional: send back count
    //         ], 200);
    //     } catch (\Exception $e) {
    //         DB::rollBack();
    //         Log::error('Error syncing opportunities: '.$e->getMessage(), ['trace' => $e->getTraceAsString()]);
    //         return response()->json([
    //             'status' => false,
    //             'message' => 'Error syncing data: ' . $e->getMessage(),
    //         ], 500);
    //     }
    // }
    

   public function synLocationData()
    {
        $limit = 100;
        $page = 1;
        $allContacts = [];

        $token = GhlAuth::where('user_id', Auth::id())->first();
        if (!$token) {
            \Log::error('GHL Sync: Token not found for user ' . Auth::id());
            return response()->json([
                'status' => false,
                'message' => 'Token not found.'
            ], 404);
        }

        $locationId = $token->location_id;
        $userId = Auth::id();

        \Log::info("Starting contact sync for user {$userId}, location {$locationId}");

        // ✅ Fetch All Contacts (Paginated)
        do {
            $query = "contacts?limit={$limit}&page={$page}";
            $response = CRM::crmV2($userId, $query, 'get', '', [], false, $locationId, $token);

            if (!empty($response->contacts)) {
                $count = count($response->contacts);
                \Log::info("Fetched page {$page} with {$count} contacts.");
                $allContacts = array_merge($allContacts, $response->contacts);
            } else {
                $count = 0;
                \Log::warning("No contacts found on page {$page}.");
            }

            $page++;
        } while ($count === $limit);

        \Log::info('Total contacts fetched: ' . count($allContacts));

        // ✅ Save or update contacts in DB
        if (!empty($allContacts)) {
            foreach ($allContacts as $contact) {
                if (!is_object($contact))
                    continue;

                try {
                    Contact::updateOrCreate(
                        ['email' => $contact->email ?? 'no-email-' . $contact->id],
                        [
                            'user_id' => $userId,
                            'location_id' => $locationId,
                            'contact_id' => $contact->id ?? null,
                            'name' => trim(($contact->firstName ?? '') . ' ' . ($contact->lastName ?? '')),
                            'phone' => $contact->phone ?? null,
                            'state' => $contact->state ?? null,
                            'country' => $contact->country ?? null,
                            'city' => $contact->city ?? null,
                            'source' => $contact->source ?? null,
                            'type' => $contact->type ?? null,
                            'company' => $contact->companyName ?? null,
                            'assigned_to' => $contact->assignedTo ?? null,
                            'tags' => !empty($contact->tags) ? json_encode($contact->tags) : null,
                            'custom_fields' => !empty($contact->customFields) ? json_encode($contact->customFields) : null,
                            'date_added' => $contact->dateAdded ?? null,
                            'date_updated' => $contact->dateUpdated ?? null,
                            'date_of_birth' => $contact->dateOfBirth ?? null,
                            'dnd' => $contact->dnd ?? null,
                            'company_id' => $contact->companyId ?? null,
                            'postal_code' => $contact->postalCode ?? null,
                        ]
                    );
                } catch (\Exception $e) {
                    \Log::error("Error saving contact {$contact->id}: " . $e->getMessage());
                }
            }
        }

        // ✅ Sync Calendars
        $calendars = CRM::crmV2($userId, 'calendars', 'get', '', [], false, $locationId, $token);
        if (!empty($calendars->calendars)) {
            foreach ($calendars->calendars as $calendar) {
                Calendar::updateOrCreate(
                    ['calendar_id' => $calendar->id],
                    [
                        'calendar_name' => $calendar->name ?? null,
                        'location_id' => $calendar->locationId ?? null,
                    ]
                );
            }
        }

        // ✅ Sync Location Details
        $locationData = CRM::crmV2($userId, "locations/{$locationId}", 'get', '', [], false, $locationId, $token);

        if (empty($locationData->location)) {
            \Log::error("No location data found for {$locationId}");
            return response()->json(['status' => false, 'message' => 'Location data not found.'], 404);
        }

        $location = $locationData->location;

        LocationDetail::updateOrCreate(
            ['location_id' => $location->id],
            [
                'company_id' => $location->companyId ?? null,
                'name' => $location->name ?? null,
                'address' => $location->address ?? null,
                'city' => $location->city ?? null,
                'state' => $location->state ?? null,
                'country' => $location->country ?? null,
                'postal_code' => $location->postalCode ?? null,
                'website' => $location->website ?? null,
                'timezone' => $location->timezone ?? null,
                'first_name' => $location->firstName ?? null,
                'last_name' => $location->lastName ?? null,
                'email' => $location->email ?? null,
                'phone' => $location->phone ?? null,
                'logo_url' => $location->logoUrl ?? null,
                'domain' => $location->domain ?? null,
                'business' => isset($location->business) ? json_encode($location->business) : null,
                'business_logo_url' => $location->business->logoUrl ?? null,
                'social' => isset($location->social) ? json_encode($location->social) : null,
                'settings' => isset($location->settings) ? json_encode($location->settings) : null,
                'user_id' => $userId,
            ]
        );

        // ✅ Sync Users
        $ghlUsers = CRM::crmV2($userId, 'users', 'get', '', [], false, $locationId, $token);
        $userSynced = false;
        if (!empty($ghlUsers->users)) {
            foreach ($ghlUsers->users as $user) {
                ghlUser($user);
            }
            $userSynced = true;
        }

        // ✅ Sync Custom Fields
        $customFields = CRM::crmV2($userId, 'custom-fields', 'get', '', [], false, $locationId, $token);
        if (!empty($customFields->customFields)) {
            foreach ($customFields->customFields as $field) {
                CustomField::updateOrCreate(
                    ['cf_id' => $field->id],
                    [
                        'location_id' => $locationId,
                        'cf_name' => $field->name ?? null,
                        'cf_key' => $field->fieldKey ?? null,
                        'dataType' => $field->dataType ?? null,
                        'cf_value' => $field->value ?? null,
                    ]
                );
            }
        }

        // ✅ Sync Custom Values
        $customValues = CRM::crmV2($userId, 'custom-values', 'get', '', [], false, $locationId, $token);
        if (!empty($customValues->customValues)) {
            foreach ($customValues->customValues as $value) {
                CustomValue::updateOrCreate(
                    ['cv_id' => $value->id],
                    [
                        'location_id' => $locationId,
                        'cv_name' => $value->name ?? null,
                        'cv_key' => $value->fieldKey ?? null,
                        'dataType' => $value->dataType ?? null,
                        'cv_value' => $value->value ?? null,
                    ]
                );
            }
        }

        // ✅ Sync Pipelines
        $pipelinesData = CRM::crmV2($userId, 'opportunities/pipelines', 'get', '', [], false, $locationId, $token);
        if (!empty($pipelinesData->pipelines)) {
            foreach ($pipelinesData->pipelines as $apiPipeline) {
                $pipeline = Pipeline::updateOrCreate(
                    ['pipeline_id' => $apiPipeline->id, 'location_id' => $locationId],
                    ['name' => $apiPipeline->name]
                );

                if (!empty($apiPipeline->stages)) {
                    foreach ($apiPipeline->stages as $stage) {
                        PipelineStage::updateOrCreate(
                            [
                                'pipeline_id' => $pipeline->id,
                                'location_id' => $locationId,
                                'pipeline_stage_id' => $stage->id,
                            ],
                            [
                                'name' => $stage->name,
                                'position' => $stage->position,
                            ]
                        );
                    }
                }
            }
        }

        \Log::info("GHL Sync completed successfully for user {$userId}");

        return response()->json([
            'status' => true,
            'message' => $userSynced ? 'Data synced successfully.' : 'Location and pipelines synced, but no users found.',
        ]);
    }

    
     public function saveFromJson(Request $request)
    {
        set_time_limit(0);
        ini_set('max_execution_time', 0);
        ini_set('memory_limit', '512M');
    
        $chunk = $request->input('chunk');
        $chunkData = json_decode($chunk, true);
    
        if (!$chunkData || !is_array($chunkData)) {
            Log::warning("⚠️ Empty or invalid chunk received.");
            return response()->json(['status' => false, 'message' => 'Invalid or empty chunk data']);
        }
    
        $count = 0;
    
        foreach ($chunkData as $leadData) {
            try {
                $opportunityData = [
                    'opportunity_id' => $leadData['id'] ?? null,
                    'location_id' => $leadData['locationId'] ?? null,
                    'assigned_to' => $leadData['assignedTo'] ?? null,
                    'contact_id' => $leadData['contactId'] ?? null,
                    'monetary_value' => $leadData['monetaryValue'] ?? 0,
                    'name' => $leadData['name'] ?? null,
                    'pipeline_id' => $leadData['pipelineId'] ?? null,
                    'pipeline_stage_id' => $leadData['pipelineStageId'] ?? null,
                    'source' => $leadData['source'] ?? null,
                    'status' => $leadData['status'] ?? 'open',
                    'last_status_change_at' => !empty($leadData['lastStatusChangeAt']) ? Carbon::parse($leadData['lastStatusChangeAt']) : null,
                    'last_stage_change_at' => !empty($leadData['lastStageChangeAt']) ? Carbon::parse($leadData['lastStageChangeAt']) : null,
                    'last_action_date' => !empty($leadData['lastActionDate']) ? Carbon::parse($leadData['lastActionDate']) : null,
                    'date_added' => !empty($leadData['createdAt']) ? Carbon::parse($leadData['createdAt']) : null,
                    'company_id' => 2,
                    'user_id' => Auth::id(),
                    'created_at' => !empty($leadData['createdAt']) ? Carbon::parse($leadData['createdAt']) : now(),
                    'updated_at' => !empty($leadData['updatedAt']) ? Carbon::parse($leadData['updatedAt']) : now(),
                ];
    
                Opportunity::updateOrCreate(
                    ['opportunity_id' => $leadData['id']],
                    $opportunityData
                );
    
                $count++;
                Log::info("✅ Opportunity synced successfully", ['id' => $leadData['id'] ?? 'N/A']);
            } catch (\Exception $e) {
                Log::error("❌ Failed to save opportunity", [
                    'id' => $leadData['id'] ?? null,
                    'error' => $e->getMessage(),
                ]);
            }
        }
    
        return response()->json([
            'status' => true,
            'message' => "Imported {$count} opportunities successfully",
        ]);
    }



    public function getPipelineConversionStats()
    {
        try {
            // 🧠 Step 1 — Get total opportunities per pipeline & stage
            $stats = DB::table('opportunities')
                ->join('pipelines', 'opportunities.pipeline_id', '=', 'pipelines.pipeline_id')
                ->join('pipeline_stages', 'opportunities.pipeline_stage_id', '=', 'pipeline_stages.pipeline_stage_id')
                ->select(
                    'opportunities.pipeline_id',
                    'pipelines.name as pipeline_name',
                    'opportunities.pipeline_stage_id',
                    'pipeline_stages.name as stage_name',
                    DB::raw('COUNT(opportunities.id) as total_opportunities')
                )
                ->groupBy(
                    'opportunities.pipeline_id',
                    'opportunities.pipeline_stage_id',
                    'pipelines.name',
                    'pipeline_stages.name'
                )
                ->orderBy('opportunities.pipeline_id')
                ->orderBy('pipeline_stages.position') // 👈 ensure stages are ordered correctly
                ->get();
    
            if ($stats->isEmpty()) {
                return response()->json([
                    'status' => false,
                    'message' => 'No opportunity data found'
                ]);
            }
    
            // 🧩 Step 2 — Group data by pipeline
            $conversionRates = [];
            $pipelines = $stats->groupBy('pipeline_id');
    
            foreach ($pipelines as $pipelineId => $stages) {
                $stages = $stages->values(); // reset indexes
    
                for ($i = 0; $i < count($stages) - 1; $i++) {
                    $currentStage = $stages[$i];
                    $nextStage = $stages[$i + 1];
    
                    $rate = 0;
                    if ($currentStage->total_opportunities > 0) {
                        $rate = ($nextStage->total_opportunities / $currentStage->total_opportunities) * 100;
                    }
    
                    $conversionRates[] = [
                        'pipeline_id' => $pipelineId,
                        'pipeline_name' => $currentStage->pipeline_name,
                        'from_stage_id' => $currentStage->pipeline_stage_id,
                        'from_stage_name' => $currentStage->stage_name,
                        'to_stage_id' => $nextStage->pipeline_stage_id,
                        'to_stage_name' => $nextStage->stage_name,
                        'from_stage_opportunities' => $currentStage->total_opportunities,
                        'to_stage_opportunities' => $nextStage->total_opportunities,
                        'conversion_rate' => round($rate, 2)
                    ];
                }
            }
    
            // ✅ Step 3 — Return JSON response
            return response()->json([
                'status' => true,
                'total_stats' => $stats,
                'conversion_rates' => $conversionRates
            ]);
    
        } catch (\Exception $e) {
            Log::error('Error calculating conversion stats', ['error' => $e->getMessage()]);
            return response()->json([
                'status' => false,
                'message' => 'Error calculating conversion stats',
                'error' => $e->getMessage()
            ], 500);
        }
    }




}
