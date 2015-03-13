<?php namespace App\Models\Customer;

use Illuminate\Database\Eloquent\Model;

class Property_Application extends Model {

    protected $table = 'customer_property_application';
    protected $fillable = ['user_id','property_id','status'];

}
