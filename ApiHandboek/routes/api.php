<?php

use App\Http\Controllers\HoofdstukController;
use App\Http\Controllers\ScriptController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::apiResource('scripts', ScriptController::class);
Route::apiResource('hoofdstukken', HoofdstukController::class)->parameters(['hoofdstukken' => 'hoofdstuk']);

// Het type van de route reflecteerd het soort request wat er op binnenkomt.
Route::get('hoofdstukken/{id}/scripts', [ScriptController::class, 'indexHoofdstuk']);
Route::delete('hoofdstukken/{id}/scripts', [ScriptController::class, 'destroyHoofdstuk']);
