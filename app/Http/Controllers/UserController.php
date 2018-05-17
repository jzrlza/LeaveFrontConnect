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


class UserController extends Controller
{
    public function index(Request $request)
    {
        $type = $request->get('type');
        $type = strtolower($type);
        if ($type === 'admin') {
            $users = User::where('is_admin', true)->get();
        } else if ($type === 'supervisor') {
            $users = User::where('type', 'supervisor')->get();
        } else if ($type === 'subordinate') {
            $users = User::where('type', 'subordinate')->get();
        } else {
            $users = User::get();
        }
        return $users;
    }
    public function createUser(Request $request) {
        if (User::where(['email' => $request->get('email')])->first()) {
            return ['message' => 'This Email is already used'];
        }

        if ($request->user()->is_admin) {
            $user = User::create([
                'name' => $request->get('name'),
                'email' => $request->get('email'),
                'password' => Hash::make($request->get('password')),
                'fullname' => $request->get('fullname'),
                'address' => $request->get('address'),
                'facebook' => $request->get('facebook'),
                'lineid' => $request->get('lineid'),
                'ig' => $request->get('ig'),
                'tel' => $request->get('tel'),
                'type' => $request->get('type'),
                'profile_image_src' => $request->get('profile_image_src'),
                'is_admin' => $request->get('is_admin') === 'true'
            ]);
            return $user;
        }
        return ['message' => 'Admin only can create user'];
    }



}