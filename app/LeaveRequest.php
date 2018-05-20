<?php
/**
 * Created by PhpStorm.
 * User: pranger54
 * Date: 16/5/2018 AD
 * Time: 23:29
 */

namespace App;


use Illuminate\Database\Eloquent\Model;

class LeaveRequest extends Model
{
    protected $fillable = [
        'type','details','approved','days_period_of_leave','main_user_id','sub_user_id','sub_user_approve','involved_task_id'
    ];


}