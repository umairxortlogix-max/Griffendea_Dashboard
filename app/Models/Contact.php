<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    use HasFactory;

    // Table name (if it's not the plural of the model)
    protected $table = 'contacts';

    // Primary key
    protected $primaryKey = 'id';

    // If your PK is auto-increment & bigint → keep incrementing true
    public $incrementing = true;

    // PK type
    protected $keyType = 'int';

    // Mass-assignable fields
    protected $fillable = [
        'contact_id',
        'location_id',
        'name',
        'email',
        'phone',
        'state',
        'country',
        'city',
        'source',
        'type',
        'company',
        'assigned_to',
        'tags',
        'custom_fields',
        'date_added',
        'date_updated',
        'date_of_birth',
        'dnd',
        'company_id',
        'postal_code',
    ];

    // If you want Laravel to manage created_at / updated_at automatically
    public $timestamps = true;

    // Cast fields (helpful for JSON, datetime, etc.)
    protected $casts = [
        'tags'          => 'array',    // if you plan to store JSON in text
        'custom_fields' => 'array',    // same here
        'date_added'    => 'datetime',
        'date_updated'  => 'datetime',
        'date_of_birth' => 'date',
    ];
}
