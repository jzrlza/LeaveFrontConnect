<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function login(Request $request)
    {
        $username = $request['name'];
        $pw = $request['password'];
        //alert($username);
        //alert($password);
        $user = User::where('name', $username)->first();
        /*
        if ($user and Hash::check($password, $user->password)) {
            return [
                'token' => $user->createToken('token')->accessToken,
                'message' => 'Authenticated',
                'type' => $user->type
            ];
        }*/
        if ($user) {
            if ($pw == $user['password']){
                var_dump($username->session()->get()->first());
                return [
                'token' => $user->createToken('token')->accessToken,
                'message' => 'Authenticated',
                'type' => $user->type
                ];
            }
            
        }
        return [
            'message' => 'Email or Password is incorrect',
            'type' => 'Error'
        ];
    }
    public function refresh(Request $request)
    {
        return $this->response($this->loginProxy->attemptRefresh());
    }
    public function logout()
    {
        $this->loginProxy->logout();
        return $this->response(null, 204);
    }

    public function index(){
        return view('login');
    }

    public function loginRedirect(Request $request) {
        $type = $request->type;
        if($type == 'Administrator') {
            return redirect()->route('admin-users');
        }
        else if($type == 'Supervisor') {
            return redirect()->route('super-profile');
        }
        else {
            return redirect()->route('sub-profile');
        }

    }
}
