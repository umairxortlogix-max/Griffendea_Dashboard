<?php

namespace App\Services;

use App\Models\Invoice;
use App\Models\BusinessDetail;
use App\Models\Contact;
use App\Models\InvoiceItem;
use Illuminate\Support\Facades\DB;
use App\Services\ContactServices;
use Carbon\Carbon;

class HandleInvoice
{


    protected $contactHandler;

    public function __construct(ContactServices $contactHandler)
    {
        $this->contactHandler = $contactHandler;
    }

    public function invoice(array $data)
    {


        // dd('is controlle coming ');     
        return DB::transaction(function () use ($data) {
            $contactExist = Contact::where('contact_id', $data['contactDetails']['id'])->exists();
            if(!$contactExist && !empty($data['contactDetails'])){
                $contactData = $data['contactDetails'];
                $contactData['location_id'] = $data['altId'];
                $contactData['firstName'] = $data['contactDetails']['name'];
                $contactData['phone'] = $data['contactDetails']['phoneNo'];
                $contactData['state'] = $data['contactDetails']['address']['state'];
                $contactData['city'] = $data['contactDetails']['address']['city'];
                $contactData['postalCode'] = $data['contactDetails']['address']['postalCode'];


 
                // $contactData['']

            //      'email' => $data[ 'email' ] ?? null,
            // 'phone' => $data[ 'phone' ] ?? null,
            // 'state' => $data[ 'state' ] ?? null,
            // 'country' => $data[ 'country' ] ?? null,
            // 'city' => $data[ 'city' ] ?? null,
            // 'source' => $data[ 'source' ] ?? null,
            // 'dnd' => $data[ 'dnd' ] ?? null,
            // 'type' => $data[ 'type' ] ?? null,
            // 'company' => $data[ 'companyName' ] ?? null,
            // 'assigned_to' => $data[ 'assignedTo' ] ?? null,
            // 'tags' => isset( $data[ 'tags' ] ) ? implode( ',', $data[ 'tags' ] ) : null,
            // 'custom_fields' => isset( $data[ 'customFields' ] ) ? json_encode( $data[ 'customFields' ] ) : null,
            // 'postal_code' => $data[ 'postalCode' ] ?? null,
            // 'date_added' => isset( $data[ 'dateAdded' ] ) ? Carbon::parse( $data[ 'dateAdded' ] )->format( 'Y-m-d H:i:s' ) : null,
            // 'date_of_birth' => isset( $data[ 'dateOfBirth' ] ) ? date( 'Y-m-d', strtotime( $data[ 'dateOfBirth' ] ) ) : null,

                $this->contactHandler->handle_contact($contactData);
            }

     


            $invoiceData = [
                'status'         => $data['status'] ?? 'draft',
                'live_mode'      => $data['liveMode'] ?? false,
                'name'           => $data['name'] ?? null,
                'invoice_number' => $data['invoiceNumber'] ?? null,
                'title'          => $data['title'] ?? null,
                'currency'       => $data['currency'] ?? 'USD',
                'contact_id'     => $data['contactDetails']['id'] ?? null,
                'issue_date'     => !empty($data['issueDate']) ? Carbon::parse($data['issueDate'])->format('Y-m-d') : null,
                'due_date'       => !empty($data['dueDate']) ? Carbon::parse($data['dueDate'])->format('Y-m-d') : null,
                'discount_type'  => $data['discount']['type'] ?? 'fixed',
                'discount_value' => $data['discount']['value'] ?? 0,
                'subtotal'       => $data['totalSummary']['subTotal'] ?? 0,
                'total'          => $data['total'] ?? 0,
                'amount_paid'    => $data['amountPaid'] ?? 0,
                'amount_due'     => $data['amountDue'] ?? 0,
                'notes'          => $data['notes'] ?? null,
                'location_id'    => $data['altId'] ?? null,
            ];

     
            $invoice = Invoice::updateOrCreate(
                ['invoice_number' => $invoiceData['invoice_number']],
                $invoiceData
            );

            // 🏢 Business Details
            if (!empty($data['businessDetails'])) {
                $invoice->businessDetail()->updateOrCreate(
                    ['invoice_id' => $invoice->id],
                    [
                        'name'          => $data['businessDetails']['name'] ?? null,
                        'address'       => $data['businessDetails']['address'] ?? null,
                        'phone_no'      => $data['businessDetails']['phoneNo'] ?? null,
                        'website'       => $data['businessDetails']['website'] ?? null,
                        'logo_url'      => $data['businessDetails']['logoUrl'] ?? null,
                        'custom_values' => isset($data['businessDetails']['customValues'])
                            ? json_encode($data['businessDetails']['customValues'])
                            : null,
                    ]
                );
            }

            // 📦 Invoice Items
            if (!empty($data['invoiceItems']) && is_array($data['invoiceItems'])) {
                $invoice->items()->delete(); // clear old items
                foreach ($data['invoiceItems'] as $item) {
                    $invoice->items()->create([
                        'product_id' => $item['productId'] ?? null,
                        'price_id'   => $item['priceId'] ?? null,
                        'currency'   => $item['currency'] ?? 'USD',
                        'name'       => $item['name'] ?? 'Unnamed Item',
                        'qty'        => $item['qty'] ?? 1,
                        'amount'     => $item['amount'] ?? 0,
                        'taxes'      => isset($item['taxes']) ? json_encode($item['taxes']) : null,
                    ]);
                }
            }

            return response()->json([
                'status'  => 'success',
                'message' => 'Invoice synced successfully',
                'invoice' => $invoice->load(['businessDetail', 'items']),
            ], 200);
        });
    }
}
