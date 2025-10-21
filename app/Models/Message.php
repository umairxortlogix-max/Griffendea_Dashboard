<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    use HasFactory;

    protected $table = 'messages';

    protected $fillable = [
        // Common
        'type',                 // InboundMessage / OutboundMessage
        'message_type',         // SMS / Email / CALL
        'user_id',
        'location_id',
        'contact_id',
        'conversation_id',
        'conversation_provider_id',
        'chat_widget_id',
        'message_id',
        'ghl_call_id',
        'direction',
        'status',
        'body',
        'content_type',
        'attachments',

        // Call specific
        'call_status',
        'call_duration',
        'call_recording_url',

        // Email specific
        'email_message_id',
        'thread_id',
        'subject',
        'from_email',
        'to_email',

        // Extra
        'assigned_to',
        'delete_in_ghl',
        'company_id',

        // Dates
        'date_added',
        'date_updated',
    ];

    protected $casts = [
        'attachments' => 'array',
        'to_email' => 'array',
        'delete_in_ghl' => 'boolean',
        'date_added' => 'datetime',
        'date_updated' => 'datetime',
    ];


    public function response(){
        return $this->hasOne(Response::class, 'contact_id', 'contact_id');
    }
}
