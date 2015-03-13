<?php namespace App\Http\Controllers\Tenant;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

class WorkorderController extends Controller {

	public function index(){
        return view('tenant.workorders');
    }

}
