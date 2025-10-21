<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    use HasFactory;

    protected $fillable = [
        'status',
        'live_mode',
        'name',
        'invoice_number',
        'location_id',
        'title',
        'currency',
        'contact_id',
        'issue_date',
        'due_date',
        'discount_type',
        'discount_value',
        'subtotal',
        'total',
        'amount_paid',
        'amount_due',
        'notes',
    ];

    /**
     * One invoice has one business detail
     */
    public function businessDetail()
    {
        return $this->hasOne(BusinessDetail::class);
    }

    /**
     * One invoice has many items
     */
    public function items()
    {
        return $this->hasMany(InvoiceItem::class);
    }


    public function contact()
{
    return $this->belongsTo(Contact::class, 'contact_id', 'contact_id');
}

}
