@extends('main_layout')
@section('content')
 <div id="app">
 	<h1>Back-end Test Users from Database Page</h1>

 	<?php 
 		foreach ($users as $user) {
    		echo $user->name . " ";
		}
 	?>

 </div>
@endsection