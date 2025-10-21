<?php
namespace App\Services;
use App\Models\Contact;
use App\Models\CustomField;
use App\Models\Tag;
use App\Models\ContactTag;
use Carbon\Carbon;
use App\Models\ContactCustomField;
use App\Models\GhlAuth;

class ContactServices {

    public function handle_contact( array $data ) {
        $type = $data[ 'type' ] ?? null;
        $location_id = $data[ 'locationId' ] ?? $data[ 'location_id' ];
        $contact = Contact::where( 'contact_id', $data[ 'id' ] )
        ->where( 'location_id', $location_id )
        ->first();
        if ( $type === 'ContactDelete' ) {
            if ( $contact ) {
                $contact->delete();
                return response()->json( [ 'status' => 'success', 'message' => 'Contact Deleted successfully' ], 200 );
            } else {
                return response()->json( [ 'status' => 'error', 'message' => 'Contact not found' ], 404 );
            }
        }
        if ( $type === 'ContactDndUpdate' ) {
            if ( $contact ) {
                $contact->dnd = true;
                $contact->save();
                return response()->json( [ 'status' => 'success', 'message' => 'DND updated Successfuly' ], 200 );
            } else {
                return response()->json( [ 'status' => 'error', 'message' => 'Contact not found' ], 404 );
            }
            return 'done';
        }

        $contactData = [
            'contact_id' => $data[ 'id' ],
            'location_id' => $location_id,
            // 'name' => isset( $data[ 'firstName' ] ) && isset( $data[ 'lastName' ] ) ? $data[ 'firstName' ] . ' ' . $data[ 'lastName' ] : null,
            'name' => trim(($data['firstName'] ?? '') . ' ' . ($data['lastName'] ?? '')) ?: null,

            'email' => $data[ 'email' ] ?? null,
            'phone' => $data[ 'phone' ] ?? null,
            'state' => $data[ 'state' ] ?? null,
            'country' => $data[ 'country' ] ?? null,
            'city' => $data[ 'city' ] ?? null,
            'source' => $data[ 'source' ] ?? null,
            'dnd' => $data[ 'dnd' ] ?? null,
            'type' => $data[ 'type' ] ?? null,
            'company' => $data[ 'companyName' ] ?? null,
            'assigned_to' => $data[ 'assignedTo' ] ?? null,
            'tags' => isset( $data[ 'tags' ] ) ? implode( ',', $data[ 'tags' ] ) : null,
            'custom_fields' => isset( $data[ 'customFields' ] ) ? json_encode( $data[ 'customFields' ] ) : null,
            'postal_code' => $data[ 'postalCode' ] ?? null,
            'date_added' => isset( $data[ 'dateAdded' ] ) ? Carbon::parse( $data[ 'dateAdded' ] )->format( 'Y-m-d H:i:s' ) : null,
            'date_of_birth' => isset( $data[ 'dateOfBirth' ] ) ? date( 'Y-m-d', strtotime( $data[ 'dateOfBirth' ] ) ) : null,

        ];
        if ( $contact ) {
            foreach ( $contactData as $key => $value ) {
                $contact->$key = $value;
            }
            $contact->save();
        } else {
            $contact = new Contact();
            foreach ( $contactData as $key => $value ) {
                $contact->$key = $value;
            }
            $contact->save();
        }

        if ( ! empty( $data[ 'customFields' ] ) && is_array( $data[ 'customFields' ] ) ) {
            foreach ( $data[ 'customFields' ] as $cf ) {
                if ( ! isset( $cf[ 'id' ], $cf[ 'value' ] ) ) {
                    continue;
                }

                $rawValue  = $cf[ 'value' ];
                $valueType = gettype( $rawValue );
                switch ( $valueType ) {
                    case 'boolean':
                    $safeValue  = $rawValue ? 'true' : 'false';
                    $storedType = 'boolean';
                    break;
                    case 'integer':
                    case 'double':
                    $safeValue  = ( string ) $rawValue;
                    $storedType = 'number';
                    break;
                    case 'array':
                    $safeValue  = json_encode( $rawValue );
                    $storedType = 'array';
                    break;
                    case 'object':
                    $safeValue  = json_encode( $rawValue );
                    $storedType = 'object';
                    break;
                    case 'string':
                    default:
                    $safeValue  = ( string ) $rawValue;
                    $storedType = 'string';
                    break;
                }
                $mappedField = CustomField::where( 'cf_id', $cf[ 'id' ] )
                ->where( 'location_id', $location_id )
                ->first();
                if ( $mappedField ) {
                    ContactCustomField::updateOrCreate(
                        [
                            'contact_id'      => $contact->id,
                            'custom_field_id' => $mappedField->id,
                        ],
                        [
                            'value'       => $safeValue,
                            'type'        => $storedType,
                            'location_id' => $location_id,
                        ]
                    );
                }
            }
        }

        if ( !empty( $data[ 'tags' ] ) && is_array( $data[ 'tags' ] ) ) {

            $newTags = array_filter( $data[ 'tags' ] );

            Tag::where( 'location_id', $location_id )->delete();

            foreach ( $newTags as $tagName ) {
                Tag::create( [
                    'tag_name'    => $tagName,
                    'location_id' => $location_id
                ] );
            }

            $currentTags = ContactTag::where( 'contact_id', $contact->id )
            ->pluck( 'tag' )
            ->toArray();

            $tagsToAdd = array_diff( $newTags, $currentTags );
            foreach ( $tagsToAdd as $tagName ) {
                ContactTag::create( [
                    'contact_id' => $contact->id,
                    'tag'        => $tagName,
                ] );
            }

            $tagsToRemove = array_diff( $currentTags, $newTags );
            if ( !empty( $tagsToRemove ) ) {
                ContactTag::where( 'contact_id', $contact->id )
                ->whereIn( 'tag', $tagsToRemove )
                ->delete();
            }

        } else {
            ContactTag::where( 'contact_id', $contact->id )->delete();
        }

        return;

    }

}
