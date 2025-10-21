<?php

namespace App\Services;

use Carbon\Carbon;
use App\Models\Message;
use Illuminate\Support\Facades\Log;
use App\Models\Contact;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Response;

class InboundCallServices {
    public function handel_Inboundcall( array $data ) {
        try {
            $dateAdded = isset( $data[ 'dateAdded' ] ) ? Carbon::parse( $data[ 'dateAdded' ] )->format( 'Y-m-d H:i:s' ) : null;

            $callData = [
                'ghl_call_id'     => $data[ 'userId' ] ?? null,
                'type'            => $data[ 'type' ] ?? null,
                'location_id'     => $data[ 'locationId' ] ?? null,
                'attachments'     => isset( $data[ 'attachments' ] ) ? json_encode( $data[ 'attachments' ] ) : null,
                'body'            => isset( $data[ 'body' ] ) ? $this->sanitizeAndTruncateBody( $data[ 'body' ] ) : null,
                'contact_id'      => $data[ 'contactId' ] ?? null,
                'content_type'    => $data[ 'contentType' ] ?? null,
                'conversation_id' => $data[ 'conversationId' ] ?? null,
                'date_added'      => $dateAdded,
                'direction'       => $data[ 'direction' ] ?? null,
                'message_type'    => $data[ 'messageType' ] ?? null,
                'message_id'      => $data[ 'messageId' ] ?? null,
                'status'          => $data[ 'status' ] ?? null,
                'source'          => $data[ 'source' ] ?? null,
                'assigned_to'     => $data[ 'userId' ] ?? null,
                'subject'         => $data[ 'subject' ] ?? null,
                'call_duration'   => $data[ 'callDuration' ] ?? null,
                'call_status'     => $data[ 'callStatus' ] ?? null,
                'ghl_user_Id'     => $data[ 'userId' ] ?? null,
            ];

            $call = Message::updateOrCreate(
                [
                    'type'            => $data[ 'type' ] ?? null,
                    'location_id'     => $data[ 'locationId' ] ?? null,
                    'contact_id'      => $data[ 'contactId' ] ?? null,
                    'conversation_id' => $data[ 'conversationId' ] ?? null,
                ],
                $callData
            );

            Log::info( 'Call record created or updated successfully.' );
            return $call;

        } catch ( \Exception $e ) {
            Log::error( 'Error processing inbound call webhook: ' . $e->getMessage(), [
                'data' => $data
            ] );
            return null;
        }
    }

    public function messages( array $data ) {
        $userExists = User::where('location_id', $data['locationId'] ?? null)->exists();
        if(!$userExists){   
            return response()->json(['status' => 'error', 'message' => 'Invalid location_id'], 400);
        }
        $contactExists = Contact::where('contact_id', $data['contactId'] ?? null)->exists();
        if(!$contactExists){
            return response()->json(['status' => 'error', 'message' => 'Invalid contact_id'], 400);
        }
        
        $type = $data[ 'type' ] ?? 'UNKNOWN';
        $direction = strtolower( $data[ 'direction' ] ?? 'outbound' );
        $messageType = $data[ 'messageType' ] ?? null;
       $newMessage = Message::create( [
            'user_id'            => $data[ 'userId' ] ?? null,
            'ghl_call_id'        => $data[ 'messageId' ] ?? null,
            'type'               => $type, 
            'message_type'       => $messageType, 
            'location_id'        => $data[ 'locationId' ] ?? null,
            'contact_id'         => $data[ 'contactId' ] ?? null,
            'conversation_id'    => $data[ 'conversationId' ] ?? null,
            'direction'          => $direction,
            'date_added'         => $data[ 'dateAdded' ] ?? null,
            'date_updated'       => $data[ 'dateUpdated' ] ?? null,
            'body'               => $data[ 'body' ] ?? null,
            'status'             => $data[ 'status' ] ?? null,

            'call_status'        => $data[ 'callStatus' ] ?? null,
            'call_duration'      => $data[ 'callDuration' ] ?? null,
            'call_recording_url' => $data[ 'callRecordingUrl' ] ?? null,

            'email_message_id'   => $data[ 'emailMessageId' ] ?? null,
            'thread_id'          => $data[ 'threadId' ] ?? null,
            'subject'            => $data[ 'subject' ] ?? null,
            'from_email'         => $data[ 'from' ] ?? null,
            'to_email'           => isset( $data[ 'to' ] ) ? json_encode( $data[ 'to' ] ) : null,

            'content_type'       => $data[ 'contentType' ] ?? null,
            'chat_widget_id'     => $data[ 'chatWidgetId' ] ?? null,

            'attachments'        => isset( $data[ 'attachments' ] ) ? json_encode( $data[ 'attachments' ] ) : null,
            'conversation_provider_id' => $data[ 'conversationProviderId' ] ?? null,
            'assigned_to'        => $data[ 'assignedTo' ] ?? null,
            'delete_in_ghl'      => $data[ 'deleteInGhl' ] ?? null,
            'company_id'         => $data[ 'companyId' ] ?? null,
        ] );



        if ($direction === 'outbound'  ) {
            $alreadyExists = Response::where('contact_id', $newMessage->contact_id)->exists();
            if (!$alreadyExists) {
                Response::create([
                    'contact_id' => $newMessage->contact_id,
                    'assigned_user_id' => $newMessage->user_id,
                    'date_created' => $newMessage->date_added,
                    'first_response' => $newMessage->date_added,
                ]);
            }
        }


        return response()->json( [ 'status' => 'success' ] );
    }


        /**
        * Sanitize and safely truncate the body content.
        *
        * @param mixed $body
        * @return string
        */

    private function sanitizeAndTruncateBody( $body ): string {
        // If it's an array or object, encode to JSON string
        if (is_array($body) || is_object($body)) {
            $body = json_encode($body);
        }

        // Cast to string if still not
        $body = (string) $body;

        // Optional: remove unwanted HTML tags (keep basic ones)
        $cleanBody = strip_tags($body, '<p><div><span><br>');

        // Truncate to avoid DB overflow (LONGTEXT max is ~4GB; this is a safe real-world size)
        return mb_substr($cleanBody, 0, 65535, 'UTF-8' );
    }
}
