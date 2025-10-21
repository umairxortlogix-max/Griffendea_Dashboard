<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StageChangeLog extends Model
{
    use HasFactory;

    // protected $primaryKey = 'stage_change_id'; // custom primary key

    protected $fillable = [
        'contact_id',
        'opportunity_id',
        'pipeline_stage_id',
        'pipeline_id',
        'start_date',
        'end_date',
    ];

    // Relationships
    public function contact()
    {
        return $this->belongsTo(Contact::class);
    }

    public function opportunity()
    {
        return $this->belongsTo(Opportunity::class);
    }

    public function pipelineStage()
    {
        return $this->belongsTo(PipelineStage::class, 'pipeline_stage_id');
    }

    public function pipeline()
    {
        return $this->belongsTo(Pipeline::class);
    }
}
