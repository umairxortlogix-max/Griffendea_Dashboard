<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomField extends Model
{
    use HasFactory;

    protected $table = 'custom_fields';

    protected $fillable = [
        'location_id',
        'cf_id',
        'cf_name',
        'cf_value',
        'cf_key',
        'dataType',
    ];
}
