<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\annoncecontroller;
use App\Http\Controllers\usercontroller;
use App\Http\Controllers\Authcontroller;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


//// auth Api
Route::post('/checkemail', [Authcontroller::class, 'Checkemail']);
Route::post('/inscription', [Authcontroller::class, 'inscription']);
Route::post('/login', [Authcontroller::class, 'login']);


/// users api
Route::get('/', [usercontroller::class, 'index']);
Route::get('/{id}', [usercontroller::class, 'show']);
Route::put('/{id}', [usercontroller::class, 'update']);
Route::delete('/{id}', [usercontroller::class, 'destroy']);


//// annonce api
Route::get('/', [annoncecontroller::class, 'index']);
Route::get('/{id}', [annoncecontroller::class, 'show']);
Route::post('/', [annoncecontroller::class, 'store']);
Route::put('/{id}', [annoncecontroller::class, 'update']);
Route::delete('/{id}', [annoncecontroller::class, 'destroy']);
