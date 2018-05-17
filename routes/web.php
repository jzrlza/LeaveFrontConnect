<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/', function () {
//    return view('welcome');
//});

// Route::get('/home', function () {
//     echo "this is home";
// });

Route::get('/login', 'Auth\LoginController@index')->name('login');

Route::post('/login-user', 'Auth\LoginController@login')->name('login-user');

Route::get('/home/{id}', 'HomeController@home')->name('homeid');
Route::any('/', 'HomeController@index');
Route::get('/vue/{vue_capture?}', function () {
 return view('vue.index');
})->where('vue_capture', '[\/\w\.-]*');

Route::get('/admin-users', 'AdminUserController@index')->name('admin-users');
Route::get('/admin-print-report', 'AdminUserController@temp_print')->name('admin-print-report');
Route::get('/super-profile', 'AdminUserController@super_profile')->name('super-profile');
Route::get('/super-assign-tasks', 'AdminUserController@super_assign')->name('super-assign-tasks');
Route::get('/super-approve-leaves', 'AdminUserController@super_approve')->name('super-approve-leaves');
Route::get('/super-check', 'AdminUserController@super_check')->name('super-check');
Route::get('/sub-profile', 'AdminUserController@sub_profile')->name('sub-profile');
Route::get('/sub-accept-tasks', 'TaskController@accept_tasks')->name('sub-accept-tasks');
Route::get('/sub-accept-requests', 'AdminUserController@sub_requests')->name('sub-accept-requests');
Route::get('/sub-check', 'AdminUserController@sub_check')->name('sub-check');

Route::get('/admin-users-get', 'AdminUserController@getUsers')->name('admin-users-get');
Route::get('/depts-get', 'AdminUserController@getDepts')->name('depts-get');
Route::post('/admin-users-test', 'AdminUserController@addUserTest')->name('admin-users-add-test');

Route::get('/unaccepted-tasks-get', 'TaskController@getWaitingTasks')->name('unaccepted-tasks-get');

Route::get('/users-test', 'UserController@index')->name('user-test');
Route::post('/users-add-test', 'UserController@createUser')->name('user-add-test');