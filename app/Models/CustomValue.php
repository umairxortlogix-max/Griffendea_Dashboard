<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomValue extends Model
{
    use HasFactory;

    protected $table = 'custom_values';

    protected $fillable = [
        'location_id',
        'cv_id',
        'cv_name',
        'cv_value',
        'cv_key',
        'dataType',
    ];
}
