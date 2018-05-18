<?php

namespace App\Http\Controllers;

use App\Models\Users;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

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

    
}
