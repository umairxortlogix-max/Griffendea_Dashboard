<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Services\ContactServices;
use App\Services\NoteServices;
use App\Services\OpportunityServices;
use App\Services\InboundCallServices;
use App\Services\OutBoundCallServices;
use App\Services\AppointmentServices;
use App\Services\HandleInvoice;
class WebhookController extends Controller {
    protected $contactServices;
    protected $opportunityServices;
    protected $appointmentServices;
    protected $inboundCallServices;
    protected $outboundCallServices;
    protected $noteServices;
    protected $handleInvoice;

    public function __construct(
        ContactServices $contactServices,
        OpportunityServices $opportunityServices,
        AppointmentServices $appointmentServices,
        // NoteServices $noteServices,
        InboundCallServices $inboundCallServices,
        // OutBoundCallServices $outboundCallServices
        HandleInvoice $handleInvoice,
    ) {
        $this->contactServices = $contactServices;
        $this->opportunityServices = $opportunityServices;
        $this->appointmentServices = $appointmentServices;
        // $this->noteServices = $noteServices;
        $this->inboundCallServices = $inboundCallServices;
        $this->handleInvoice = $handleInvoice;
    }


    public function handleInvoice(Request $request){
        $data = $request->all();
        return $this->handleInvoice->invoice($data);
    }

    public function handleInboundOutbound( Request $request ) {
        $data = $request->all();
        return $this->inboundCallServices->messages( $data );

    }

    public function handleContact(Request $request) {
        $data = $request->all(); 
       return $this->contactServices->handle_contact( $data );
    }

    public function handleOpportunity(Request $request) {

        $data = $request->all();
            Log::info('data',$data);
        return $this->opportunityServices->handle_Opportunity( $data );
    }

    public function handleAppointment(Request $request) {
        $data = $request->all(); 
     return   $this->appointmentServices->handle_appointment( $data );
    }

    // public function handleInboundCall( array $data ) {
    //     //dd( $data );
    //     $this->inboundCallServices->handel_Inboundcall( $data );
    // }

    // public function handleNote( $data ) {
    //     $this->noteServices->handle_note( $data );
    // }

  public function handle_webhook(Request $request)
{
    // 🧠 Extract full webhook payload
    $data = $request->all();
    $type = $data['type'] ?? null;

    // 📝 Log incoming webhook for debugging
    Log::info('📩 Incoming Webhook', ['type' => $type, 'data' => $data]);

    try {
        switch ($type) {
            /* -------------------------
             | CONTACT RELATED EVENTS
             -------------------------- */
            case 'ContactCreate':
            case 'ContactUpdate':
            case 'ContactDelete':
            case 'ContactTagUpdate':
            case 'ContactDndUpdate':
                $this->handleContact($request);
                break;

            /* -------------------------
             | OPPORTUNITY RELATED EVENTS
             -------------------------- */
            case 'OpportunityCreate':
            case 'OpportunityUpdate':
            case 'OpportunityDelete':
            case 'OpportunityAssignedToUpdate':
            case 'OpportunityMonetaryValueUpdate':
            case 'OpportunityStageUpdate':
            case 'OpportunityStatusUpdate':
                $this->handleOpportunity($request);
                break;

            /* -------------------------
             | APPOINTMENT RELATED EVENTS
             -------------------------- */
            case 'AppointmentCreate':
            case 'AppointmentUpdate':
            case 'AppointmentDelete':
                $this->handleAppointment($request);
                break;

            /* -------------------------
             | MESSAGE RELATED EVENTS
             -------------------------- */
            case 'OutboundMessage':
            case 'InboundMessage':
                $this->handleInboundOutbound($request);
                break;

            /* -------------------------
             | INVOICE RELATED EVENTS
             -------------------------- */
            case 'InvoiceCreate':
            case 'InvoiceUpdate':
            case 'InvoiceDelete':
                $this->handleInvoice($request);
                break;

            /* -------------------------
             | NOTE RELATED EVENTS
             -------------------------- */
            case 'NoteCreate':
            case 'NoteDelete':
            case 'NoteUpdate':
                // Uncomment if you restore NoteServices
                // $this->handleNote($request);
                Log::info('🗒 Note event received (currently disabled).');
                break;

            /* -------------------------
             | UNHANDLED EVENTS
             -------------------------- */
            default:
                Log::warning("⚠️ Unhandled webhook type received: {$type}");
                break;
        }

        return response()->json([
            'status' => 'success',
            'message' => 'Webhook processed successfully.',
            'type' => $type,
        ], 200);

    } catch (\Exception $e) {
        Log::error('❌ Webhook handling failed', [
            'type' => $type,
            'error' => $e->getMessage(),
            'trace' => $e->getTraceAsString(),
        ]);

        return response()->json([
            'status' => 'error',
            'message' => 'Webhook handling failed.',
            'error' => $e->getMessage(),
        ], 500);
    }
}

}
