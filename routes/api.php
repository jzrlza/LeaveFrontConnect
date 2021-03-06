<?php

use Illuminate\Http\Request;

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
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/login', 'Auth\LoginController@login');

Route::get('/users', 'UserController@index');
Route::middleware('auth:api')->put('/user', 'UserController@update');
Route::middleware('auth:api')->post('/user', 'UserController@register');
Route::middleware('auth:api')->put('/user/set_department', 'UserController@setDepartment');
Route::middleware('auth:api')->put('/user/set_supervisor', 'UserController@setSupervisor');
