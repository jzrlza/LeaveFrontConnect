<?php
/**
 * Created by PhpStorm.
 * User: pranger54
 * Date: 16/5/2018 AD
 * Time: 23:28
 */

namespace App;


use Illuminate\Database\Eloquent\Model;

class Task extends Model

{
    protected $fillable = [
        'title','detail','deadline','user_id','done','priority','expected_date'
    ];

}

