<?php namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class WorkOrderLog extends Model {

	protected $table = 'work_order_log';
    protected $fillable = ['workorder_id','comment','status'];

}
