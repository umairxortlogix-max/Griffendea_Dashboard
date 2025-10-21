<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Opportunity extends Model
{
    use HasFactory;

    protected $fillable = [
        'opportunity_id',
        'location_id',
        'assigned_to',
        'contact_id',
        'monetary_value',
        'name',
        'pipeline_id',
        'pipeline_stage_id',
        'source',
        'last_status_change_at',
        'last_stage_change_at',
        'last_action_date',
        'status',
        'date_added',
        'company_id',
        'user_id',
        'created_at',
        'updated_at'
    ];

    protected $casts = [
        'monetary_value' => 'decimal:2',
        'date_added' => 'datetime',
    ];

    public function contact()
    {
        return $this->belongsTo(Contact::class, 'contact_id', 'contact_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    public function stage()
    {
        return $this->hasMany(PipelineStage::class, 'pipeline_stage_id', 'pipeline_stage_id');
    }
    public function pipline()
    {
        return $this->hasMany(Pipeline::class, 'pipeline_id', 'pipeline_id');
    }
}
