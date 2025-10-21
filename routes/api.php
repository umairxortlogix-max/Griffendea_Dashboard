<?php

use Illuminate\Http\Request;
use App\Http\Controllers\Admin\RenamemenuController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CustomValueController;
use App\Http\Controllers\WebhookController;
Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('/webhook' , [WebhookController::class ,'handle_webhook']);
// Route::get('/renamed-menus/{locationId}', [RenamemenuController::class, 'renameGetApi']);



Route::get('/custom-values', [CustomValueController::class, 'apiIndex']);
 


Route::post('/webhook/handleInboundOutbound', [WebhookController::class, 'handleInboundOutbound']);
Route::post('/webhook/handleContact', [WebhookController::class, 'handleContact']);
Route::post('/webhook/handleAppointment', [WebhookController::class, 'handleAppointment']);
Route::post('/webhook/handleOpportunity', [WebhookController::class, 'handleOpportunity']);
Route::post('/webhook/handleInvoice', [WebhookController::class, 'handleInvoice'])->name('handleInvoice');














// Weekly Report :: 
// Tested and debugged webhooks from GHL to ensure correct data synchronization.
// Created separate Appointments and Opportunities pages to manage and display their data independently, allowing better organization and access.
// Built a dashboard to visualize the states of opportunities and appointments using charts, showing key metrics such as pipeline stages, status counts, and            appointment        summaries.
// Implemented logic to prevent duplicate tags for contacts and automatically remove obsolete tags.