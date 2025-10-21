<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LocationDetail extends Model
{
    use HasFactory;

    protected $table = 'location_details';

    protected $fillable = [
        'location_id',
        'company_id',
        'name',
        'domain',
        'address',
        'city',
        'state',
        'postal_code',
        'country',
        'website',
        'timezone',
        'logo_url',
        'first_name',
        'last_name',
        'email',
        'phone',
        'business_logo_url',
        'user_id',
        'business',
        'social',
        'settings',
        'reseller',
    ];

    protected $casts = [
        'business' => 'array',
        'social'   => 'array',
        'settings' => 'array',
        'reseller' => 'array',
    ];

    /**
     * Relationship: Each location belongs to a user.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
