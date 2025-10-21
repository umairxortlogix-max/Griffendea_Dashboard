<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Appointment extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'appointments';

    // Mass assignable fields
    protected $fillable = [
        'appointment_id',
        'location_id',
        'calendar_id',
        'address',
        'title',
        'group_id',
        'appointment_status',
        'users',
        'notes',
        'source',
        'start_time',
        'end_time',
        'date_added',
        'date_updated',
        'company_id',
        'contact_id',
        'assigned_user_id',
        'user_id',
    ];

    // Casts
    protected $casts = [
        'start_time' => 'datetime',
        'end_time' => 'datetime',
        'date_added' => 'datetime',
        'date_updated' => 'datetime',
    ];

    // Relationships example (if needed)
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
