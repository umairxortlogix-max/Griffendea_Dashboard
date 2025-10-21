<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BusinessDetail extends Model
{
    use HasFactory;

    protected $fillable = [
        'invoice_id',
        'name',
        'address',
        'phone_no',
        'website',
        'logo_url',
        'custom_values',
    ];

    protected $casts = [
        'custom_values' => 'array',
    ];

    /**
     * A business detail belongs to an invoice
     */
    public function invoice()
    {
        return $this->belongsTo(Invoice::class);
    }
}
