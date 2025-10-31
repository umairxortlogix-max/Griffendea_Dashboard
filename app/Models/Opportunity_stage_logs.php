<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Opportunity_stage_logs extends Model
{
    use HasFactory;

    protected $table = 'opportunity_stage_logs';
    protected $fillable = [
        'opportunity_id',
        'pipeline_id',
        'stage_id',
        'location_id',
        'logged_date',
        'opportunity_count',
        'source',
    ];
      
    protected $dates = ['logged_date'];
    public function opportunity()
    {
        return $this->belongsTo(Opportunity::class, 'opportunity_id', 'opportunity_id');
    }
    public function pipeline()
    {
        return $this->belongsTo(Pipeline::class, 'pipeline_id');
    }
    public function stage()
    {
        return $this->belongsTo(PipelineStage::class, 'stage_id');
    }
}
