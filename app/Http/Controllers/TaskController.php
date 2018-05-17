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

class TaskController extends Controller
{
    public function Create(Request $request)
    {
        $task = Task::create([
            'title' => $request->get('task_name'),
            'detail' => $request->get('detail'),
            'deadline' => $request->get('detail'),
            'user_id' => $request->user()->id,
            'done' => $request->get('done'),
            'priority' => $request->get('priority'),
            'expected_date' => $request->get('expected_date'),
            'accepted' => $request->get('accepted')
        ]);
        return $task;
    }

    public function delete(Task $task)
    {
        $task->delete();
        return response()->json(null, 204);
    }

	function accept_tasks(){
        return view('webs.sub.accept_tasks');
    }

	function getWaitingTasks(){
		$temp_user_id = 3; //Remove this once login is implemented

		$tasks = Task::where('accepted', '=', '0')->get();

		return $tasks;
	}

	function getPendingTasks(){
		$temp_user_id = 3; //Remove this once login is implemented

		$tasks = Task::where('done', '=', '0')->get();

		return $tasks;
	}
}