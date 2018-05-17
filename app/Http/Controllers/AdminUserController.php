<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\User;
use App\Department;

class AdminUserController extends Controller
{

    //IMPORTANT!! DON'T DELETE, KEEP IT
    function index(){
        
        return view('webs.admin.users');//->with(['users' => $users]);

    }

    //IMPORTANT!! DON'T DELETE, KEEP IT
    function getUsers(){
    	//$query = User::all(); //Get all users, even admin
    	$users = User::where('type', '=', 'Supervisor')->orWhere('type', '=', 'Subordinate')->get(); //then exclude admin.
    	//Screw this one, it's long :> DB::select('select * from users where type = "Supervisor" or type = "Subordinate"');

        return $users;
    }

    //IMPORTANT!! DON'T DELETE, KEEP IT
    function getDepts(){
        //$query = User::all(); //Get all users, even admin
        $depts = Department::all(); //then exclude admin.
        //Screw this one, it's long :> DB::select('select * from users where type = "Supervisor" or type = "Subordinate"');

        return $depts;
    }

    function addUserTest(Request $request){

    	$user = User::create([
                'name' => $request['name'],
                'type' => $request['type'],
                'dept_id' => $request['dept_id']
        ]);


    	$users = User::where('type', '=', 'Supervisor')->orWhere('type', '=', 'Subordinate')->get();


        return view('webs.admin.users_test', ['users' => $users]);
    }

    function temp_print(){
        return view('webs.admin.print_report');
    }

    function super_profile(){
        return view('webs.super.profile');
    }

    function super_assign(){
        return view('webs.super.assign_tasks');
    }

    function super_approve(){
        return view('webs.super.approve_leaves');
    }

    function super_check(){
        return view('webs.super.check');
    }

    function sub_profile(){
        return view('webs.sub.profile');
    }

    function sub_tasks(){
        return view('webs.sub.accept_tasks');
    }

    function sub_requests(){
        return view('webs.sub.accept_requests');
    }

    function sub_check(){
        return view('webs.sub.check');
    }
}
