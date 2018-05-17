<?php
/**
 * Created by PhpStorm.
 * User: pranger54
 * Date: 17/5/2018 AD
 * Time: 20:01
 */

namespace App\Http\Controllers;


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
            'expected_date' => $request->get('expected_date')
        ]);
        return $task;
    }

    public function delete(Task $task)
    {
        $task->delete();
        return response()->json(null, 204);
    }

}