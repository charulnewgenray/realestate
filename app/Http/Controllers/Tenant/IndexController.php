<?php namespace App\Http\Controllers\Tenant;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

class IndexController extends Controller {

	public function index(){
        return view('tenant.dashboard');
    }

}
