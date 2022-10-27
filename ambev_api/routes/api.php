<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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
Route::group(['middleware' => 'api'], function ($router){
    Route::get('/', function () {
        return response()->json(['Aoba' => 'aiba']);
    });
    Route::post('users/create', [UserController::class, 'create']);
    Route::delete('users/{id}/delete', [UserController::class, 'delete']);
    Route::get('users/paginate', [UserController::class, 'paginate']);

    Route::get('access-levels/get', [AccessLevelsController::class, 'get']);

    Route::post('login', [AuthController::class, 'login']);
    Route::post('register', [AuthController::class, 'register']);
    Route::post('logout', [AuthController::class, 'logout']);
    Route::post('refresh', [AuthController::class, 'refresh']);
    Route::post('me', [AuthController::class, 'me']);
});
