<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * Mass assignable attributes.
     *
     * Using $fillable is more secure than $guarded = []
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'ghl_api_key',
        'role',
        'status',
        'image',
        'added_by',
        'location_id',
        'assigned_to',
        'company_id',
    ];

    /**
     * Attributes that should be hidden when serializing.
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Casts for specific attributes.
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    /*
     |---------------------------------
     | Relationships
     |---------------------------------
     */

    // A User may belong to a UserTransaction
    // public function userTransaction()
    // {
    //     return $this->belongsTo(UserTransaction::class, 'user_transaction_id');
    // }

    // A User can have many contacts (via location_id)
    public function contacts()
    {
        return $this->hasMany(Contact::class, 'location_id', 'location_id');
    }

    // A User can have many messages
    public function messages()
    {
        return $this->hasMany(Message::class, 'user_id', 'id');
    }
}
