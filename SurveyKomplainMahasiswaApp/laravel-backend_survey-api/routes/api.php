<?php

use App\Http\Controllers\APIController;
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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post("all_data",[APIController::class,"index"]);
Route::post("show_data",[APIController::class,"show"]);
Route::post("show_data/by_factor",[APIController::class,"showByFactor"]);
Route::post("show_data/by_gender",[APIController::class,"showByGender"]);
Route::post("show_data/by_nationality",[APIController::class,"showByNationality"]);
Route::post("get_average_age",[APIController::class,"getAvgAge"]);
Route::post("get_average_gpa",[APIController::class,"getAvgGPA"]);