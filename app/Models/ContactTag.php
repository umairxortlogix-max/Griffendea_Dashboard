<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContactTag extends Model
{
    use HasFactory;

    protected $table = 'contact_tags';

    protected $fillable = [
        'contact_id',
        'tag',
    ];

    public function contact()
    {
        return $this->belongsTo(Contact::class);
    }
}
