<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InvoiceItem extends Model
{
    use HasFactory;

    protected $fillable = [
        'invoice_id',
        'product_id',
        'price_id',
        'currency',
        'name',
        'qty',
        'amount',
        'taxes',
    ];

    protected $casts = [
        'taxes' => 'array',
    ];

    /**
     * An invoice item belongs to an invoice
     */
    public function invoice()
    {
        return $this->belongsTo(Invoice::class);
    }
}
