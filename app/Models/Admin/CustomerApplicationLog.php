<?php namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class CustomerApplicationLog extends Model {

	protected $table = 'customer_application_log';
    protected $fillable = ['application_no','comment','status'];

}
