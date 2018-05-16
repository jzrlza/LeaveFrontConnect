<?php
/**
 * Created by PhpStorm.
 * User: pranger54
 * Date: 16/5/2018 AD
 * Time: 23:29
 */

namespace App;


use Illuminate\Database\Eloquent\Model;

class AssignedTask extends Model
{
    protected $fillable = [
        'user_id','task_id','done','priority','expected_date'
    ];

}