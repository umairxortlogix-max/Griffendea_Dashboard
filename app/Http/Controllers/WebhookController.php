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

    public function handle_webhook( Request $request ) {
        //dd( '40440' );
        $data = $request->all();
        $type = $data[ 'type' ] ?? null;
         Log::info('data',$data);
        if ( in_array( $type, [
            'ContactCreate', 'ContactUpdate', 'ContactDelete',
            'ContactTagUpdate', 'ContactDndUpdate'
        ] ) ) {
            $this->handleContact( $data );
        } elseif ( in_array( $type, [
            'OpportunityCreate', 'OpportunityUpdate', 'OpportunityDelete',
            'OpportunityAssignedToUpdate', 'OpportunityMonetaryValueUpdate',
            'OpportunityStageUpdate', 'OpportunityStatusUpdate'
        ] ) ) {
            $this->handleOpportunity( $data );
        } elseif ( in_array( $type, [
            'AppointmentCreate', 'AppointmentUpdate', 'AppointmentDelete'
        ] ) ) {
            $this->handleAppointment( $data );
        } elseif ( in_array( $type, [ 'OutboundMessage', 'InboundMessage' ] ) ) {
            $this->handleInboundCall( $data );
        } elseif ( in_array( $type, [ 'NoteCreate', 'NoteDelete', 'NoteUpdate' ] ) ) {
            $this->handleNote( $data );
        } else {
            Log::info( "Webhook type not handled: {$type}" );
        }

        return response()->json( [
            'status' => 'success',
            'type' => $type
        ] );
    }
}
