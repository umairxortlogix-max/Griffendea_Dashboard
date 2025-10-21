<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContactCustomField extends Model
{
    use HasFactory;

    protected $fillable = [
        'location_id',
        'value',
        'custom_field_id',
        'contact_id',
    ];

    // Relation with Contact
    public function contact()
    {
        return $this->belongsTo(Contact::class, 'contact_id', 'contact_id');
    }
}
