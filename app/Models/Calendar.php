<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Calendar extends Model
{
    use HasFactory;

    // Table name (optional if same as plural of model)
    protected $table = 'calendars';

    // Primary key (Laravel assumes `id`, so this is optional)
    protected $primaryKey = 'id';

    // Fillable columns for mass assignment
    protected $fillable = [
        'calendar_id',
        'calendar_name',
        'location_id',
    ];

    // If you want auto timestamps (created_at, updated_at) -> leave this as true
    public $timestamps = true;
}
