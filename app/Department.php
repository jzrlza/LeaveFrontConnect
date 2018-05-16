<?php
/**
 * Created by PhpStorm.
 * User: pranger54
 * Date: 16/5/2018 AD
 * Time: 23:29
 */

namespace App;


use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    protected $fillable = [
        'dept_id','name'
    ];

}