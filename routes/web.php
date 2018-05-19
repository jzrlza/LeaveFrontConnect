<?php
use Illuminate\Http\Request;
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
Route::get('/tasks-get', 'TaskController@getPendingTasks')->name('tasks-get');
Route::get('/specific-task', 'TaskController@getCertainTask')->name('specific-task');
Route::get('/assign-task', 'TaskController@assign')->name('assign-task');
Route::post('/assign-task', 'TaskController@assign')->name('assign-task');
Route::put('/task-done', 'TaskController@markTaskAsDone')->name('task-done');  //TEST ME
Route::put('/accept-task', 'TaskController@accept')->name('accept-task');  //ADD ME

Route::get('/testPost', function(){
    return "Post received";
});
Route::post('/testPost', function(Request $request){
    return $request;
    //return $request['test']; [value of "test"]
});

Route::put('/testPut', function(Request $request){
    return $request;
    //return $request['test']; [value of "test"]
});

Route::post('/submit-leave-req', 'LeaveRequestController@submit')->name('submit-leave-req'); //ADD ME
Route::get('/unapproved-reqs-get', 'LeaveRequestController@getWaitingLeaves')->name('unapproved-reqs-get');
Route::get('/reqs-get', 'LeaveRequestController@getLeaves')->name('reqs-get');
Route::get('/sub-reqs-get', 'LeaveRequestController@getSubReqLeaves')->name('sub-reqs-get');
Route::put('/accept_sub_req', 'LeaveRequestController@acceptSubRequest')->name('accept_sub_req');  //ADD ME
Route::put('/approve_leave_req', 'LeaveRequestController@approve')->name('approve_leave_req');  //TEST ME

Route::get('/req-owner', 'LeaveRequestController@getOwner')->name('req-owner-id');
//Route::resource('/req-owner', 'LeaveRequestController', ['except' => ['getOwner']]);

Route::get('/users-test', 'UserController@index')->name('user-test');
Route::get('/users-all', 'UserController@getAllUsers')->name('users-all');
Route::get('/user-get', 'UserController@getUser')->name('user-get');
Route::get('/users-subs', 'UserController@getSubUsers')->name('users-subs');
Route::get('/users-other-subs', 'UserController@getOtherSubUsers')->name('users-other-subs');
Route::post('/user-register', 'UserController@register')->name('user-register');

//Put and delete must already know the id, just id, but put also needs the editing datas as well
Route::put('/user-edit', 'UserController@update')->name('user-edit');   //FIX ME
Route::delete('/user-delete', 'UserController@delete')->name('user-delete');   //FIX ME

Route::post('/logging-in', 'Auth\LoginController@login')->name('logging-in');   //FIX ME
Route::get('/logging-out', 'Auth\LoginController@logout')->name('logging-out');  //ADD ME

Route::get('/logged-in', 'Auth\LoginController@is_login')->name('logged-in');   //FIX ME

Route::get('/redirect', 'Auth\LoginController@loginRedirect')->name('redirect');
