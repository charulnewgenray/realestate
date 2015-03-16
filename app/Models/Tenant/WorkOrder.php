<?php namespace App\Models\Tenant;

use Illuminate\Database\Eloquent\Model;

class WorkOrder extends Model {

	protected $table = 'work_order';
    protected $fillable = ['property_id','request_category','phone','visit_hours','work_description','file_links','status'];

}
