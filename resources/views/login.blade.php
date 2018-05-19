@extends('main_layout')
@section('content')
 <div id="app">
 	<meta name="csrf-token" content="{{ csrf_token() }}">
  <login-page></login-page>
<!--
  <a class="btn btn-lg btn-primary btn-block" type="submit" href="{{ route('admin-users') }}" >Sign in as Admin (Placeholder)https://laracasts.com/discuss/channels/laravel/how-to-use-laravel-route-in-vue</a>
    <a class="btn btn-lg btn-primary btn-block" type="submit" href="{{ route('super-profile') }}">Sign in as Supervisor (Placeholder)https://stackoverflow.com/questions/47734860/accessing-laravel-routes-in-vue-component-attribute</a>
    <a class="btn btn-lg btn-primary btn-block" type="submit" href="{{ route('sub-profile') }}">Sign in as Subordinate (Placeholder) https://github.com/tightenco/ziggy/issues/70</a>

-->
<passport-clients></passport-clients>
<passport-authorized-clients></passport-authorized-clients>
<passport-personal-access-tokens></passport-personal-access-tokens>
 </div>
<style lang="css">

.login-wrapper {
  background: #fff;
  width: 70%;
  margin: 12% auto;
}

.form-signin {
  max-width: 330px;
  padding: 10% 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>
@endsection