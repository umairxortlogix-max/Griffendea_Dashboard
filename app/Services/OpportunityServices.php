<?php
namespace App\Services;
use App\Models\Opportunity;
use App\Models\GhlAuth;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use App\Models\StageChangeLog;




class OpportunityServices{
    public function handle_Opportunity(array $data){
    $type = $data['type'];
    $location_id = $data['locationId'] ?? $data['location_id'];
    $opportunity = Opportunity::where('opportunity_id', $data['id'])
        ->where('location_id', $location_id)
        ->first();
    $user_id = login_id($location_id) ;

    if ($type === 'OpportunityDelete') {
        if ($opportunity){
            $opportunity->delete();
            Log::info("Opportunity with GHL Opportunity ID: {$data['id']} deleted successfully and type is {$type}.");
        } else {
            Log::info("Opportunity with GHL Opportunity ID: {$data['id']} not found and type is {$type}.");
        }
        return 'done';
    }


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
    // if ($opportunity) {
    //     $pervious_stage_id = $opportunity->pipeline_stage_id;
  
    //     foreach ($opportunityData as $key => $value) {
    //         Log::info("Opportunity with GHL Opportunity key : {$opportunity->$key} updated successfully and type is {$value} .");
    //         $opportunity->$key = $value;
    //     }
    //     $opportunity->save();


    //     $new_stage_id = $opportunity->pipeline_stage_id;
    //     if ($pervious_stage_id != $new_stage_id) {

    //     StageChangeLog::where('pipeline_stage_id', $pervious_stage_id)
    //         ->whereNull('end_date')
    //         ->update(['end_date' => now()]);

    //     $stage_change_log = new StageChangeLog();
    //     $stage_change_log->contact_id = $opportunity->contact_id;
    //     $stage_change_log->opportunity_id = $opportunity->id;
    //     $stage_change_log->pipeline_stage_id = $opportunity->pipeline_stage_id;
    //     $stage_change_log->pipeline_id = $opportunity->pipeline_id;
    //     $stage_change_log->start_date = $opportunity->date_added;
    //     $stage_change_log->end_date = null;
    //     $stage_change_log->save();
    //     }  
    //     dd($stage_change_log);

    //     Log::info("Opportunity with GHL Opportunity ID: {$data['id']} updated successfully and type is {$type} .");
    // } else {

    //     $opportunity = new Opportunity();
    //     foreach ($opportunityData as $key => $value) {
    //         $opportunity->$key = $value;
    //     }
    //     $opportunity->save();
    //     $stage_change_log = new StageChangeLog();
    //     $stage_change_log->contact_id = $opportunity->contact_id;
    //     $stage_change_log->opportunity_id = $opportunity->id;
    //     $stage_change_log->pipeline_stage_id = $opportunity->pipeline_stage_id;
    //     $stage_change_log->pipeline_id = $opportunity->pipeline_id;
    //     $stage_change_log->start_date = $opportunity->date_added;
    //     $stage_change_log->end_date = null;
    //     $stage_change_log->save();


    //     dd($stage_change_log);

    //     Log::info("Opportunity with GHL Opportunity ID: {$data['id']} created successfully and type is {$type}.");
    // }


    if ($opportunity) {
    $previous_stage_id = $opportunity->pipeline_stage_id;
    foreach ($opportunityData as $key => $value) {
        Log::info("Opportunity with GHL Opportunity key : {$opportunity->$key} updated successfully and type is {$value} .");
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
        $stage_change_log->pipeline_stage_id = $opportunity->pipeline_stage_id;
        $stage_change_log->pipeline_id = $opportunity->pipeline_id;
        $stage_change_log->start_date = now(); 
        $stage_change_log->end_date = null;
        $stage_change_log->save();
        Log::info("Stage log created for Opportunity {$opportunity->id}, moved from {$previous_stage_id} to {$new_stage_id}");
    }

    Log::info("Opportunity with GHL Opportunity ID: {$data['id']} updated successfully and type is {$type} .");
} else {
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
    $stage_change_log->start_date = $opportunity->date_added ?? now(); // keep original date if provided
    $stage_change_log->end_date = null;
    $stage_change_log->save();
    Log::info("Opportunity with GHL Opportunity ID: {$data['id']} created successfully and type is {$type}.");
}



    return $opportunity;
}
}
