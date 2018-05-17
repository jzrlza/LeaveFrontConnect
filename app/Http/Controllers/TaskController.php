<?php
/**
 * Created by PhpStorm.
 * User: pranger54
 * Date: 17/5/2018 AD
 * Time: 20:01
 */

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Task;
use App\AssignedTask;

class TaskController extends Controller
{

	function accept_tasks(){
        return view('webs.sub.accept_tasks');
    }

	function getWaitingTasks(){
		$temp_user_id = 3; //Remove this once login is implemented

		$tasks = AssignedTask::where('priority', '=', '""')->where('user_id','=',$temp_user_id)->get();

		return $tasks;
	}

	function getAllTasks(){
		//$tasks = Task::all();

		//return $tasks;
	}
}