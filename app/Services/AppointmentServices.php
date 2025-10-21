<?php
namespace App\Services;
use App\Models\Appointment;
use Carbon\Carbon;
use DB;
use Illuminate\Support\Facades\Log;
use App\Models\GhlAuth;

class AppointmentServices {
    public function handle_appointment( array $data ) {

        $type = $data[ 'type' ];
        $location_id = $data[ 'locationId' ] ?? $data[ 'location_id' ];
        $appointment = Appointment::where( 'appointment_id', $data[ 'appointment' ][ 'id' ] )
        ->where( 'location_id', $location_id )
        ->first();

        $user_id = login_id($location_id) ;
   

        if ( $type === 'AppointmentDelete' ) {
            if ( $appointment ) {
                $appointment->delete();
                Log::info( "Appointment with GHL Appointment ID: {$data['appointment']['id']} deleted successfully and type is {$type}." );
            } else {
                Log::info( "Appointment with GHL Appointment ID: {$data['appointment']['id']} not found and type is {$type}." );
            }
            return 'done';
        }

        $data = isset( $data[ 'appointment' ] ) ? $data[ 'appointment' ] : $data;

        $dateUpdated = isset( $data[ 'dateUpdated' ] ) ? $data[ 'dateUpdated' ] : null;
        $dateAdded = isset( $data[ 'dateAdded' ] ) ? $data[ 'dateAdded' ] : null;
        $dateAdded = !is_null( $dateAdded ) ? Carbon::parse( $dateAdded )->format( 'Y-m-d H:i:s' ) : null;
        $startTime = isset( $data[ 'startTime' ] ) ? $data[ 'startTime' ] : null;
        $startTime = !is_null( $startTime ) ? Carbon::parse( $startTime )->format( 'Y-m-d H:i:s' ) : null;
        $endTime = isset( $data[ 'endTime' ] ) ? $data[ 'endTime' ] : null;
        $endTime = !is_null( $endTime ) ? Carbon::parse( $endTime )->format( 'Y-m-d H:i:s' ) : null;

        $appointmentData = [
            'user_id' => $user_id,
            'appointment_id' => $data[ 'id' ],
            'location_id' => $location_id,
            'address' => $data[ 'address' ] ?? null,
            'title' => $data[ 'title' ] ?? null,
            'calendar_id' => $data[ 'calendarId' ] ?? null,
            'contact_id' => $data[ 'contactId' ] ?? null,
            'group_id' => $data[ 'groupId' ] ?? null,
            'appointment_status' => $data[ 'appointmentStatus' ] ?? null,
            'assigned_user_id' => $data[ 'assignedUserId' ] ?? null,
            'users' => isset( $data[ 'users' ] ) ? json_encode( $data[ 'users' ] ) : null,
            'notes' => $data[ 'notes' ] ?? null,
            'source' => $data[ 'source' ] ?? null,
            'date_updated' => $dateUpdated,
            'start_time' => $startTime,
            'end_time' => $endTime,
            'date_added' => $dateAdded,
        ];


        if ( $appointment ) {
            foreach ( $appointmentData as $key => $value ) {
                $appointment->$key = $value;
            }

            $appointment->save();
            Log::info( "Appointment with GHL Appointment ID: {$data['id']} updated successfully and type is {$type}." );
        } else {
            $appointment = new Appointment();
            foreach ( $appointmentData as $key => $value ) {
                $appointment->$key = $value;
            }
            $appointment->save();
            Log::info( "Appointment with GHL Appointment ID: {$data['id']} created successfully and type is {$type}." );
        }

        return $appointment;
    }
}
