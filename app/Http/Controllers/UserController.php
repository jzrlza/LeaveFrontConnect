<?php
/**
 * Created by PhpStorm.
 * User: pranger54
 * Date: 17/5/2018 AD
 * Time: 09:54
 */

namespace App\Http\Controllers;

use Hash;
use Illuminate\Http\Request;
use App\User as User;
use Illuminate\Support\Facades\DB;


class UserController extends Controller
{
    /**
     * Get the type of users.
     * @param Request $request
     * @return array
     */
    public function index(Request $request)
    {
        $type = $request->get('type');
        $type = strtolower($type);
        if ($type === 'Admin') {
            $users = User::where('type', 'Admin')->get();
        } else if ($type === 'Supervisor') {
            $users = User::where('type', 'Supervisor')->get();
        } else if ($type === 'Subordinate') {
            $users = User::where('type', 'Subordinate')->get();
        } else {
            $users = User::get();
        }
        return $users;
    }

    /**
     * Register an user.
     * @param Request $request
     * @return array
     */
    public function register(Request $request)
    {
        if (User::where(['email' => $request['email']])->first()) {
            return ['message' => 'Email is already in the system'];
        }

        if (User::where(['name' => $request['name']])->first()) {
            return ['message' => 'Username is already in the system'];
        }
        /* Comment this for now, authentication system is later
        if (DB::select('select * from users where type = ?',['Admin']))
        {
            $user = User::create([
                'name' => $request['name'],
                'email' => $request['email'],
                'password' => $request['password'],
                'fullname' => $request['fullname'],
                'address' => $request['address'],
                'facebook' => $request['facebook'],
                'lineid' => $request['lineid'],
                'ig' => $request['ig'],
                'tel' => $request['tel'],
                'type' => $request['type'],
                'profile_image_src' => $request['profile_image_src'],
                'dept_id' => $request[Department::where(['dept_id' => $request->get('dept_id')])->first()]
            ]);
            return $user;
        }*/ 
            $user = User::create([
                'name' => $request['name'],
                'email' => $request['email'],
                'password' => '',
                'fullname' => '',
                'address' => '',
                'facebook' => '',
                'lineid' => '',
                'ig' => '',
                'tel' => '',
                'type' => $request['type'],
                'profile_image_src' => '',
                'dept_id' => $request['dept_id'],
                'super_id' => $request['super_id']
            ]);
            return $user;
        

        //return ['message' => 'Require admin access to create a user'];

    }

    /**
     * Set supervisor.
     * @param Request $request
     * @return array
     */
    public function setSupervisor(Request $request) {
        if (DB::select('select * from users where type = ?',[Supervisor])) {
            $user = User::where(['id' => $request->get('user_id')])->first();
            $user->update($request->only('super_id'));
            return $user;
        }
        return ['message' => 'Require admin for set supervisor only.'];
    }


    /**
     * Update the user information
     * @param Request $request
     * @return array
     */
    public function update(Request $request)
    {
        $user = $request->user()->update($request->only(['name','email','type','dept_id','super_id']));
        return response()->json($user, 200);
    }

    /**
     * Show all user
     * @param User $user
     * @return $user
     */
    public function show(User $user) {
        return $user;
    }

    public function getAllUsers(){
        $users = User::All();
        return $users;
    }

    public function getUser(Request $request){
        $user = User::where('id','=',$request->id)->first();
        return $user;
    }

    public function getSubUsers(){
        $users = User::where('type','=','Subordinate')->get();
        return $users;
    }

    public function getOtherSubUsers(Request $request){
        $users = User::where('type','=','Subordinate')->where('id','<>',$request['id'])->get();
        return $users;
    }

    public function delete(User $user)
    {
        $user->delete();
        return response()->json(null, 204);
    }

    public function getUser(Request $request)
    {
        $user = User::where('id','=',$request->id)->first();
        //alert($owner);
        return $user;
    }


}