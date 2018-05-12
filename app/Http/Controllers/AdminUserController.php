<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AdminUserController extends Controller
{


    function index(){
        return view('webs.admin.users');
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
