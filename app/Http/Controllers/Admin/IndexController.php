<?php namespace App\Http\Controllers\Admin;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Tenant\WorkOrder;
use App\Models\Customer\Property_Application;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;

class IndexController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	protected $workorder;
	protected $newapplication;
	public $statusCode;

	public function __construct(){
		$this->workorder = WorkOrder::where('status','=','new')->count();
		$this->newapplication = Property_Application::where('status','=','submitted')->count();
		$this->statusCode = ['Draft','Canceled','Completed','Submitted'];
	}

	public function index()
	{
		return view('admin.dashboard');
	}

	public function getNewWorkorders(){
		return $this->workorder;
	}

	public function getNewApplications(){
		return $this->newapplication;
	}

	public function settings(){
		$fixedStatusCode = $this->statusCode;
		$statuses = DB::table('customer_application_status')->get();
		return view('admin.settings',compact('statuses','fixedStatusCode'));
	}

	public function updateSettings(){
		if(Input::get('setting_code') == 'status'){
			$arraystatus = array();
			foreach(Input::get('status') as $key => $value){
				$array['status'] = $value;
				$arraystatus[] = $array;
			}
			DB::table('customer_application_status')->truncate();
			DB::table('customer_application_status')->insert($arraystatus);
		}
		return redirect()->back()->withSuccess('Updated successfully.');
	}



}
