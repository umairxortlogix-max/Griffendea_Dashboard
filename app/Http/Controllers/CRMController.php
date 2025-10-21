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

    //     public function synLocationData()
//     {

    //         $token = GhlAuth::where('user_id', Auth::id())->first();
//         if (!$token) {
//             return response()->json([
//                 'status' => false,
//                 'message' => 'Token not found.'
//             ], 404);
//         }


    //         $locationId = $token->location_id;
//         $userId = Auth::id();

    //         // $calendars = CRM::crmV2($userId, 'calendars', 'get', '', [], false, $locationId, $token);
//         // // dd( $calendars );
//         // if ($calendars->calendars != null) {

    //         //     foreach ($calendars->calendars as $calendar) {

    //         //         // $updateData = [

    //         //         //         'teamMembers'=> [
//         //         //             [
//         //         //                 'userId'   =>'Wzy4XwV9doHDav21V9Ks', // team member ID                 // boolean

    //         //         //             ]
//         //         //         ],
//         //         //         'name'           => "John Deo's PerasdfsonazxzZXZXZXZXl Calendar",
//         //         //         'locationConfigurations'=> [
//         //         //             [
//         //         //                 'kind'     => 'custom',
//         //         //                 'location' => $calendar->locationId // location ID again
//         //         //             ]
//         //         //         ],

    //         //         // ];

    //         //         // $calendarId = $calendar->id;
//         //         // // dd( $calendarId );

    //         //         // $response =      CRM::crmV2( $userId, "calendars/$calendarId", 'put', json_encode( $updateData ), [], false, $locationId, $token );

    //         //         // dd( $response );
//         //         Calendar::updateOrCreate(
//         //             ['calendar_id' => $calendar->id],
//         //             [
//         //                 'calendar_name' => $calendar->name ?? null,
//         //                 'location_id' => $calendar->locationId ?? null,

    //         //             ]
//         //         );
//         //     }
//         // }

    //         // $locationData = CRM::crmV2($userId, "locations/{$locationId}", 'get', '', [], false, $locationId, $token);

    //         // if (!isset($locationData->location)) {
//         //     return response()->json([
//         //         'status' => false,
//         //         'message' => 'Location data not found.'
//         //     ], 404);
//         // }

    //         // $location = $locationData->location;

    //         // LocationDetail::updateOrCreate(
//         //     ['location_id' => $location->id],
//         //     [
//         //         'company_id' => $location->companyId ?? null,
//         //         'name' => $location->name ?? null,
//         //         'address' => $location->address ?? null,
//         //         'city' => $location->city ?? null,
//         //         'state' => $location->state ?? null,
//         //         'country' => $location->country ?? null,
//         //         'postal_code' => $location->postalCode ?? null,
//         //         'website' => $location->website ?? null,
//         //         'timezone' => $location->timezone ?? null,
//         //         'first_name' => $location->firstName ?? null,
//         //         'last_name' => $location->lastName ?? null,
//         //         'email' => $location->email ?? null,
//         //         'phone' => $location->phone ?? null,
//         //         'logo_url' => $location->logoUrl ?? null,
//         //         'domain' => $location->domain ?? null,
//         //         'business' => isset($location->business) ? json_encode($location->business) : null,
//         //         'business_logo_url' => $location->business->logoUrl ?? null,
//         //         'social' => isset($location->social) ? json_encode($location->social) : null,
//         //         'settings' => isset($location->settings) ? json_encode($location->settings) : null,
//         //         'user_id' => Auth::id(),
//         //     ]
//         // );

    //         // // Sync Users
//         // $ghlUsers = CRM::crmV2($userId, 'users', 'get', '', [], false, $locationId, $token);
//         // $userSynced = false;

    //         // if (!empty($ghlUsers->users)) {
//         //     foreach ($ghlUsers->users as $user) {
//         //         ghlUser($user);
//         //     }
//         //     $userSynced = true;
//         // }

    //         // $data = CRM::crmV2(
//         //     $userId,
//         //     'custom-fields',
//         //     'get',
//         //     '',
//         //     [],
//         //     false,
//         //     $locationId,
//         //     $token
//         // );
//         // $data = json_decode(json_encode($data), true);

    //         // if (!empty($data['error'])) {
//         //     return response()->json([
//         //         'status'  => 'error',
//         //         'message' => $data['message'] ?? 'Failed to fetch custom fields',
//         //         'code'    => $data['error']
//         //     ], 400);
//         // }
//         // if (!empty($data['customFields'])) {
//         //     foreach ($data['customFields'] as $field) {
//         //         CustomField::updateOrCreate(
//         //             [
//         //                 'cf_id' => $field['id'],
//         //             ],
//         //             [
//         //                 'location_id' => $locationId,
//         //                 'cf_name'     => $field['name'] ?? null,
//         //                 'cf_key'      => $field['fieldKey'] ?? null,
//         //                 'dataType'    => $field['dataType'] ?? null,
//         //                 'cf_value'    => $field['value'] ?? null,
//         //             ]
//         //         );
//         //     }
//         // }

    //         // $data = CRM::crmV2(
//         //     $userId,
//         //     'custom-values',
//         //     'get',
//         //     '',
//         //     [],
//         //     false,
//         //     $locationId,
//         //     $token
//         // );
//         // $data = json_decode(json_encode($data), true);

    //         // if (!empty($data['error'])) {
//         //     return response()->json([
//         //         'status'  => 'error',
//         //         'message' => $data['message'] ?? 'Failed to fetch custom values',
//         //         'code'    => $data['error']
//         //     ], 400);
//         // }

    //         // if (!empty($data['customValues'])) {
//         //     foreach ($data['customValues'] as $value) {
//         //         CustomValue::updateOrCreate(
//         //             [
//         //                 'cv_id' => $value['id'],
//         //             ],
//         //             [
//         //                 'location_id' => $locationId,
//         //                 'cv_name'     => $value['name'] ?? null,
//         //                 'cv_key'      => $value['fieldKey'] ?? null,
//         //                 'dataType'    => $value['dataType'] ?? null,
//         //                 'cv_value'    => $value['value'] ?? null,
//         //             ]
//         //         );
//         //     }
//         // }

    //     $opertunitiesData = CRM::crmV2($userId, 'opportunities/search', 'get', '', [], false, $locationId, $token);
//     // dd( $opertunitiesData );
//     if (empty($opertunitiesData['opportunities'])) {
//             return response()->json(['message' => 'No opportunities found'], 200);
//         }

    //         DB::beginTransaction();
//         try {
//             foreach ($opertunitiesData['opportunities'] as $item) {

    //                 // === Map API fields to your table columns ===
//                 $data = [
//                     'id' => $item['id'],
//                     'location_id' => $item['locationId'] ?? null,
//                     'assigned_to' => $item['assignedTo'] ?? null,
//                     'contact_id' => $item['contactId'] ?? null,
//                     'monetary_value' => $item['monetaryValue'] ?? 0,
//                     'name' => $item['name'] ?? null,
//                     'pipeline_id' => $item['pipelineId'] ?? null,
//                     'pipeline_stage_id' => $item['pipelineStageId'] ?? null,
//                     'source' => $item['source'] ?? null,
//                     'status' => $item['status'] ?? 'open',
//                     'last_status_change_at' => isset($item['lastStatusChangeAt']) ? \Carbon\Carbon::parse($item['lastStatusChangeAt']) : null,
//                     'last_stage_change_at' => isset($item['lastStageChangeAt']) ? \Carbon\Carbon::parse($item['lastStageChangeAt']) : null,
//                     'last_action_date' => isset($item['lastActionDate']) ? \Carbon\Carbon::parse($item['lastActionDate']) : null,
//                     'created_at' => isset($item['createdAt']) ? \Carbon\Carbon::parse($item['createdAt']) : now(),
//                     'updated_at' => isset($item['updatedAt']) ? \Carbon\Carbon::parse($item['updatedAt']) : now(),
//                     'user_id' => $userId,
//                 ];

    //                 // === Insert or Update ===
//                 Opportunity::updateOrCreate(['id' => $item['id']], $data);
//             }


    //         $pipelinesData = CRM::crmV2($userId, 'opportunities/pipelines', 'get', '', [], false, $locationId, $token);

    //         if (!empty($pipelinesData->pipelines)) {
//             foreach ($pipelinesData->pipelines as $apiPipeline) {
//                 $pipeline = Pipeline::updateOrCreate(
//                     [
//                         'pipeline_id' => $apiPipeline->id,
//                         'location_id' => $locationId,
//                     ],
//                     [
//                         'name' => $apiPipeline->name,
//                     ]
//                 );

    //                 foreach ($apiPipeline->stages as $stage) {
//                     PipelineStage::updateOrCreate(
//                         [
//                             'pipeline_id' => $pipeline->id,
//                             'location_id' => $locationId,
//                             'pipeline_stage_id' => $stage->id,
//                         ],
//                         [
//                             'name' => $stage->name,
//                             'position' => $stage->position,
//                         ]
//                     );
//                 }
//             }
//         }

    //         return response()->json([
//             'status' => true,
//             // 'message' => $userSynced ? 'Data synced successfully.' : 'Location and pipelines synced, but no users found.',
//              'message' => $pipelinesData ? 'Data synced successfully.' : 'Location and pipelines synced, but no users found.',
//         ]);
//     }
// }

    public function synLocationData()
    {
        $token = GhlAuth::where('user_id', Auth::id())->first();

        if (!$token) {
            return response()->json([
                'status' => false,
                'message' => 'Token not found.'
            ], 404);
        }

        $locationId = $token->location_id;
        $userId = Auth::id();

        try {
            // ===== Fetch Opportunities =====
            $opportunitiesData = CRM::crmV2($userId, 'opportunities/search', 'get', '', [], false, $locationId, $token);
            //  dd( vars: $opportunitiesData );
            // Convert object to array (safe check)
            $opportunitiesData = json_decode(json_encode($opportunitiesData), true);

            if (empty($opportunitiesData['opportunities'])) {
                return response()->json([
                    'status' => false,
                    'message' => 'No opportunities found.'
                ], 200);
            }

            DB::beginTransaction();

            foreach ($opportunitiesData['opportunities'] as $item) {
                $data = [
                    'id' => $item['id'],
                    'location_id' => $item['locationId'] ?? null,
                     'opportunity_id' => $item['id'] ?? null,
                    'assigned_to' => $item['assignedTo'] ?? null,
                    'contact_id' => $item['contactId'] ?? null,
                    'monetary_value' => $item['monetaryValue'] ?? 0,
                    'name' => $item['name'] ?? null,
                    'pipeline_id' => $item['pipelineId'] ?? null,
                    'pipeline_stage_id' => $item['pipelineStageId'] ?? null,
                    'source' => $item['source'] ?? null,
                    'status' => $item['status'] ?? 'open',
                    'last_status_change_at' => isset($item['lastStatusChangeAt']) ? Carbon::parse($item['lastStatusChangeAt']) : null,
                    'last_stage_change_at' => isset($item['lastStageChangeAt']) ? Carbon::parse($item['lastStageChangeAt']) : null,
                    'last_action_date' => isset($item['lastActionDate']) ? Carbon::parse($item['lastActionDate']) : null,
                    'created_at' => isset($item['createdAt']) ? Carbon::parse($item['createdAt']) : now(),
                    'updated_at' => isset($item['updatedAt']) ? Carbon::parse($item['updatedAt']) : now(),
                    'user_id' => $userId,
                ];

                Opportunity::updateOrCreate(['id' => $item['id']], $data);
            }

            // ===== Fetch Pipelines =====
            $pipelinesData = CRM::crmV2($userId, 'opportunities/pipelines', 'get', '', [], false, $locationId, $token);
            $pipelinesData = json_decode(json_encode($pipelinesData), true);

            if (!empty($pipelinesData['pipelines'])) {
                foreach ($pipelinesData['pipelines'] as $apiPipeline) {
                    $pipeline = Pipeline::updateOrCreate(
                        [
                            'pipeline_id' => $apiPipeline['id'],
                            'location_id' => $locationId,
                        ],
                        [
                            'name' => $apiPipeline['name'] ?? null,
                        ]
                    );

                    if (!empty($apiPipeline['stages'])) {
                        foreach ($apiPipeline['stages'] as $stage) {
                            PipelineStage::updateOrCreate(
                                [
                                    'pipeline_id' => $pipeline->id,
                                    'location_id' => $locationId,
                                    'pipeline_stage_id' => $stage['id'],
                                ],
                                [
                                    'name' => $stage['name'] ?? null,
                                    'position' => $stage['position'] ?? 0,
                                ]
                            );
                        }
                    }
                }
            }

            DB::commit();

            return response()->json([
                'status' => true,
                'message' => 'Data synced successfully.'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'status' => false,
                'message' => 'Error syncing data: ' . $e->getMessage(),
            ], 500);
        }
    }

}
