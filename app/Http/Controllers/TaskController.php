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
    /*
    public function Create(Request $request)
    {
        $task = Task::create([
            'title' => $request->get('task_name'),
            'detail' => $request->get('detail'),
            'deadline' => $request->get('deadline'),
            'user_id' => $request->user()->id,
            'done' => $request->get('done'),
            'priority' => $request->get('priority'),
            'expected_date' => $request->get('expected_date'),
            'accepted' => $request->get('accepted')
        ]);
        return $task;
    }*/ 
    //Based on the commented above
    public function assign(Request $request)
    {
        $task = Task::create([
            'title' => $request->title,
            'detail' => $request->detail,
            'deadline' => $request->deadline, // format : '2018-05-31 05:00:00'
            'user_id' => $request->user_id,
            'done' => 0,
            'priority' => null,
            'expected_date' => null,
            'accepted' => 0
        ]);
        return $request;
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

    function getCertainTask(Request $request)
    {
        $task = Task::where('task_id','=',$request->id)->first();
        //alert($owner);
        return $task;
    }

    public function getUndoeTask()
    {
        $tasks = Task::where('done','=',0)->All();
        return $tasks;
    }

    public function markTaskAsDone(Task $task)
    {
        return [
            "success" => $task->update([
                'done' => 1

            ])
        ];
    }
}