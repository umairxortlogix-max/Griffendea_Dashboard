<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class GhlUser extends Model
{


    use HasFactory;
    protected $guarded = [];

    public function contacts()
    {
        return $this->hasMany(Contact::class, 'assigned_to', 'ghl_user_id');
    }

    public function opportunities()
    {
        return $this->hasMany(Opportunity::class, 'assigned_to', 'ghl_user_id');
    }

    public function wonOpportunities()
    {
        return $this->hasMany(Opportunity::class, 'assigned_to', 'ghl_user_id')->where('status', 'won');
    }
    public function OutboundMessage()
    {
        return $this->hasMany(Message::class,'assigned_to', 'ghl_user_id')->where('type' , 'OutboundMessage');
    }
    public function inboundMessage(){
     return $this->hasMany(Message::class, 'assigned_to', 'ghl_user_id')->where('type' , 'InboundMessage');
    }
       public function smsMessage(){
     return $this->hasMany(Message::class, 'assigned_to', 'ghl_user_id')->where('message_type' , 'SMS');
    }
    public function notes()
{
    return $this->hasManyThrough(
        Note::class,
        Contact::class,
        'assigned_to', // Foreign key on contacts table
        'contact_id',  // Foreign key on notes table
        'ghl_user_id', // Local key on ghl_users table
        'contact_id'   // Local key on contacts table
    );
}


 // protected $table = 'your_table_name';

    protected $fillable = [
        'company_id',
        'first_name',
        'last_name',
        'email',
        'password',
        'phone',
        'type',
        'role',
        'ghl_user_id',
        'location_id',
        'permissions',
        'scopes',
        'scopes_assigned_to_only',
        'user_id',
        'profile_photo',
    ];

    protected $casts = [
        // 'location_id'              => 'array',
        'permissions'              => 'array',
        'scopes'                   => 'array',
        'scopes_assigned_to_only'  => 'array',
    ];

    /**
     * Each GhlUser belongs to a User (foreign key user_id).
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

}
