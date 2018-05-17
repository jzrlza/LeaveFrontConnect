<?php
/**
 * Created by PhpStorm.
 * User: pranger54
 * Date: 17/5/2018 AD
 * Time: 19:35
 */

namespace App\Http\Controllers;


class DepartmentController extends Controller
{
    public function createDepartment(Request $request)
    {
        if (User::where(['name' => $request->get('name')])->first()) {
            return ['message' => 'Name is already in the system'];
        }

        if (DB::select('select * from users where type = ?',[Admin])) {
            $deepartment = User::create([
                'name' => $request->get('name')
            ]);
            return $deepartment;
        }

        return ['message' => 'Require admin access to create a department'];

    }

}