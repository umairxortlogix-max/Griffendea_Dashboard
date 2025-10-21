<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Response extends Model
{

    protected $table = 'responses';
    protected $fillable = [
        'contact_id',
        'assigned_user_id',
        'date_created',
        'first_response',
    ];
    public function message()
    {
        return $this->belongsTo(Message::class, 'contact_id', 'contact_id');
    }
}