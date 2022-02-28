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


//// auth Api
Route::prefix('auth')->group(function () {
    Route::post('/checkemail', [Authcontroller::class, 'Checkemail']);  /// DONE
    Route::post('/inscription', [Authcontroller::class, 'inscription']);   /// DONE
    Route::post('/login', [Authcontroller::class, 'login']);   /// DONE
});


/// users api
Route::prefix('user')->group(function () {
    Route::get('/', [usercontroller::class, 'index']);   /// DONE
    Route::get('/{id}', [usercontroller::class, 'show']);   /// DONE
    Route::get('/verefication/LoadData', [usercontroller::class, 'LoadData']);   /// DONE
    Route::put('/{id}', [usercontroller::class, 'update']);  /// DONE
    Route::delete('/{id}', [usercontroller::class, 'destroy']);  /// DONE
});


//// annonce api

Route::prefix('annonce')->group(function () {
    Route::get('/', [annoncecontroller::class, 'index']);  /// DONE
    Route::get('/{id}', [annoncecontroller::class, 'show']);  /// DONE
    Route::get('/user/{id}', [annoncecontroller::class, 'userAnnonce']);  /// DONE
    Route::post('/', [annoncecontroller::class, 'store']);  /// DONE
    Route::put('/{id}', [annoncecontroller::class, 'update']);  /// DONE
    Route::delete('/{id}', [annoncecontroller::class, 'destroy']);  /// DONE
    Route::put('/approve/{id}', [annoncecontroller::class, 'ApproceAnnonce']);  /// DONE
    Route::get('/lastfor/{id}', [annoncecontroller::class, 'lastannonce']);/// DONE
    Route::get('/Search/{titre}', [annoncecontroller::class, 'Searchannonce']);  /// DONE
    Route::post('/email', [annoncecontroller::class, 'SendEmail']);  /// DONE
    Route::get('/admin/dashboard', [annoncecontroller::class, 'getAnnonceForAdmine']);  /// DONE

});

