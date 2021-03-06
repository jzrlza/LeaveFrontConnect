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
            'accepted' => 0,
            'super_id' => $request->super_id,
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

	function getWaitingTasks(Request $request){ //Sub
		$tasks = Task::where('user_id','=',$request->id)->where('accepted', '=', '0')->get();

		return $tasks;
	}

	function getPendingTasks(Request $request){ //Super
		$tasks = Task::where('super_id','=',$request->id)->where('done', '=', '0')->get();

		return $tasks;
	}

    function getPendingAll(){

        $tasks = Task::where('done', '=', '0')->get();

        return $tasks;
    }

    function getCertainTask(Request $request)
    {
        $task = Task::where('id','=',$request->id)->first();
        //alert($owner);
        return $task;
    }

    public function getUndoneTask()
    {
        $tasks = Task::where('done','=',0)->All();
        return $tasks;
    }

    public function markTaskAsDone(Request $request)
    {

        $task = Task::where('id','=',$request->id)->first();
        $task->update(['done' => 1]);
        return response()->json($task, 200);
    }

    public function acceptTask(Request $request)
    {
        $task = Task::where('id','=',$request['id'])->first();
        $task->update($request->only(['priority','exp_date','accepted']));
        return response()->json($task, 200);
    }


}