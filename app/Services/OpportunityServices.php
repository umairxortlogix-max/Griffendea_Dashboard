<?php
namespace App\Services;
use App\Models\Opportunity;
use App\Models\GhlAuth;
use App\Models\Opportunity_stage_logs;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use App\Models\StageChangeLog;

class OpportunityServices {
    public function handle_Opportunity(array $data) {
        $type = $data['type'];
        $location_id = $data['locationId'] ?? $data['location_id'];
        $opportunity = Opportunity::where('opportunity_id', $data['id'])
            ->where('location_id', $location_id)
            ->first();
        $user_id = login_id($location_id);

        // Handle Opportunity Delete
        if ($type === 'OpportunityDelete') {
            if ($opportunity) {
                $opportunity->delete();
                Log::info("Opportunity with GHL Opportunity ID: {$data['id']} deleted successfully and type is {$type}.");
            } else {
                Log::info("Opportunity with GHL Opportunity ID: {$data['id']} not found and type is {$type}.");
            }
            return 'done';
        }

        // Prepare data
        $dateAdded = isset($data['dateAdded']) ? $data['dateAdded'] : null;
        $dateAdded = !is_null($dateAdded) ? Carbon::parse($dateAdded)->format('Y-m-d H:i:s') : null;

        $opportunityData = [
            'user_id' => $user_id,
            'opportunity_id' => $data['id'],
            'location_id' => $location_id,
            'assigned_to' => $data['assignedTo'] ?? null,
            'contact_id' => $data['contactId'] ?? null,
            'monetary_value' => $data['monetaryValue'] ?? null,
            'name' => $data['name'] ?? null,
            'pipeline_id' => $data['pipelineId'] ?? null,
            'pipeline_stage_id' => $data['pipelineStageId'] ?? null,
            'source' => $data['source'] ?? null,
            'status' => $data['status'] ?? null,
            'date_added' => $dateAdded,
        ];

        DB::beginTransaction();
        try {
            // Update existing opportunity
            if ($opportunity) {
                $previous_stage_id = $opportunity->pipeline_stage_id;

                foreach ($opportunityData as $key => $value) {
                    $opportunity->$key = $value;
                }
                $opportunity->save();

                $new_stage_id = $opportunity->pipeline_stage_id;

                if ($previous_stage_id != $new_stage_id) {
                    StageChangeLog::where('opportunity_id', $opportunity->id)
                        ->where('pipeline_stage_id', $previous_stage_id)
                        ->whereNull('end_date')
                        ->update(['end_date' => now()]);

                    $stage_change_log = new StageChangeLog();
                    $stage_change_log->contact_id = $opportunity->contact_id;
                    $stage_change_log->opportunity_id = $opportunity->id;
                    $stage_change_log->pipeline_stage_id = $new_stage_id;
                    $stage_change_log->pipeline_id = $opportunity->pipeline_id;
                    $stage_change_log->start_date = now();
                    $stage_change_log->end_date = null;
                    $stage_change_log->save();

                    Log::info("Stage log created for Opportunity {$opportunity->id}, moved from {$previous_stage_id} to {$new_stage_id}");
                }

                Log::info("Opportunity with GHL Opportunity ID: {$data['id']} updated successfully and type is {$type}.");
            } else {
                // Create new opportunity
                $opportunity = new Opportunity();
                foreach ($opportunityData as $key => $value) {
                    $opportunity->$key = $value;
                }
                $opportunity->save();

                $stage_change_log = new StageChangeLog();
                $stage_change_log->contact_id = $opportunity->contact_id;
                $stage_change_log->opportunity_id = $opportunity->id;
                $stage_change_log->pipeline_stage_id = $opportunity->pipeline_stage_id;
                $stage_change_log->pipeline_id = $opportunity->pipeline_id;
                $stage_change_log->start_date = $opportunity->date_added ?? now();
                $stage_change_log->end_date = null;
                $stage_change_log->save();

                Log::info("Opportunity with GHL Opportunity ID: {$data['id']} created successfully and type is {$type}.");
            }

           
             $loggedDate = Carbon::now()->toDateString();
            // Find existing log for same opportunity & same date
            $existingLog = Opportunity_stage_logs::where('opportunity_id', $data['id'])
                ->whereDate('logged_date', $loggedDate)
                ->first();
            if ($existingLog) {
                // ✅ Same opportunity & same date → update count
                $existingLog->increment('opportunity_count');
                 Log::info("Daily log updated for Opportunity {$data['id']} on {$loggedDate}");
            } else {
                // ✅ New day or no previous log → create new record
                Opportunity_stage_logs::create([
                    'opportunity_id' => $data['id'],
                    'pipeline_id' => $data['pipelineId'] ?? null,
                    'stage_id' => $data['pipelineStageId'] ?? null,
                    'location_id' => $location_id,
                    'logged_date' => $loggedDate,
                    'opportunity_count' => 1,
                    'source' => 'webhook',
                ]);
            }
            // ✅ New Logic: Log daily opportunity record
            // $loggedDate = Carbon::now()->format('Y-m-d');
            // $existingLog = Opportunity_stage_logs::where('opportunity_id', $data['id'])
            //     ->where('logged_date', $loggedDate)
            //     ->first();

            // if ($existingLog) {
            //     // Update existing daily record count
            //     $existingLog->opportunity_count = $existingLog->opportunity_count + 1;
            //     $existingLog->save();
            //       Log::info("Daily log updated for Opportunity {$data['id']} on {$loggedDate}");
            // } else {
            //     // Create new daily log entry
            //     Opportunity_stage_logs::create([
            //         'opportunity_id' => $data['id'],
            //         'pipeline_id' => $data['pipelineId'] ?? null,
            //         'stage_id' => $data['pipelineStageId'] ?? null,
            //         'location_id' => $location_id,
            //         'logged_date' => $loggedDate,
            //         'opportunity_count' => 1,
            //         'source' => 'webhook',
            //     ]);
            // Log::info("Daily log created for Opportunity {$data['id']} on {$loggedDate}");
            // }

            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error("Error handling opportunity: {$e->getMessage()}");
        }

            return $opportunity;
        }
    }