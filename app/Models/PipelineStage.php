<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PipelineStage extends Model
{
    use HasFactory;

    protected $table = 'pipeline_stages';

    protected $fillable = [
        'location_id',
        'position',
        'name',
        'pipeline_id',
        'pipeline_stage_id',
    ];
    public function pipeline()
    {
        return $this->belongsTo(Pipeline::class, 'pipeline_id');
    }
        public function opportunities()
    {
        return $this->hasMany(\App\Models\Opportunity::class, 'pipeline_stage_id', 'id');
    }
   public function stageLogs()
{
    return $this->hasMany(StageLog::class, 'pipeline_stage_id', 'id')
                ->with('opportunity', 'pipelineStage');
}
}
