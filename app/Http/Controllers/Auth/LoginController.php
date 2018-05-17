<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

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
        $username = $request->get('name');
        $password = $request->get('password');
        $user = User::where('name', $username)->first();
        if ($user and Hash::check($password, $user->password)) {
            return [
                'token' => $user->createToken('token')->accessToken,
                'message' => 'Authenticated',
                'type' => $user->type
            ];
        }
        return [
            'message' => 'Email or Password is incorrect'
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
}
