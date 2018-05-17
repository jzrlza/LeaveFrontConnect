<?php
/**
 * Created by PhpStorm.
 * User: pranger54
 * Date: 17/5/2018 AD
 * Time: 20:02
 */

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\LeaveRequest;

class LeaveRequestController extends Controller
{
	function getUnapprovedRequests(){
		//User specific maybe later

		$reqs = LeaveRequest::where('approved', '=', '0')->get();

		return $reqs;
	}
}