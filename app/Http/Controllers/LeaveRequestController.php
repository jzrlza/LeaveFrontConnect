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
use App\User;


class LeaveRequestController extends Controller
{
    public function getWaitingLeaves()
    {
        //User specific maybe later

        $reqs = LeaveRequest::where('approved', '=', '0')->get();

        return $reqs;
    }

    public function reject(Request $request, LeaveRequest $leave)
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


    public function approve(Request $request, LeaveRequest $leave)
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

    public function getSubReqLeaves()
    {
        //User specific maybe later

        $reqs = LeaveRequest::where('sub_user_approve', '=', '0')->get();

        return $reqs;
    }

    public function getOwner(Request $request)
    {
        $owner = User::where('id','=',$request->id)->first();
        //alert($owner);
        return $owner;
    }


    public function submit(Request $request)
    {

            $leave = LeaveRequest::create([
                'type' => $request['type'],
                'details' => $request['details'],
                'approved' => '0',
                'days_period_of_leave' => $request['days_period_of_leave'],
                'main_user_id' => $request['main_user_id'],
                'sub_user_id' => $request['sub_user_id'],
                'sub_user_approve' => '0',
                'involved_task_id' => $request['involved_task_id'],
            ]);
            return $leave;
        

        //return ['message' => 'Require admin access to create a user'];

    }

}