<?php

namespace App\Http\Controllers;

use App\Models\Users;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

class HomeController extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function __construct()
    {
        $this->middleware('auth');
    }

    function index(){
        echo 'homepage';
        //return redirect()->route('homeid', ['id' => 1]);
        return redirect()->route('login');
    }

    function home(){
        return redirect()->route('homeid', ['id' => 1]);
    }

    function loginRedirect(Request $request) {
        $user = $request['type'];
        if(User::where('type','==','Administrator')) {
            return redirect()->route('admin-users');
        }
        else if(User::where('type','==','Supervisor')) {
            return redirect()->route('super-profile');
        }
        else {
            return redirect()->route('')
        }
    }
}
