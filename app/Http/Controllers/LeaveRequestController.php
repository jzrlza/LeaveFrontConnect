<?php
/**
 * Created by PhpStorm.
 * User: pranger54
 * Date: 17/5/2018 AD
 * Time: 20:02
 */

namespace App\Http\Controllers;
use App\Task;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\LeaveRequest;


class LeaveRequestController extends Controller
{
    public function getWaitingLeaves()
    {
        //User specific maybe later

        $reqs = LeaveRequest::where('approved', '=', '0')->get();

        return $reqs;
    }

    public function reject(Request $request, Leave $leave)
    {
        $supervisor = $request->user();
        $subordinate = $request->user()->first();

        if ($supervisor->id != $subordinate->super_id) {
            return false;
        }

        return [
            "success" => $leave->update([
                'approved' => 0

            ])
        ];
    }


    public function approve(Request $request, Leave $leave)
    {
        $supervisor = $request->user();
        $subordinate = $request->user()->first();

        if ($supervisor->id != $subordinate->super_id) {
            return false;
        }

        return [
            "success" => $leave->update([
                'approved' => 1

            ])
        ];
    }

    public function getLeaves()
    {
        //User specific maybe later

        $reqs = LeaveRequest::All();

        return $reqs;
    }
}