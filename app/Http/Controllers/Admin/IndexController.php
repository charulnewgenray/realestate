<?php namespace App\Http\Controllers\Admin;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Customer\Customer_Application_Table;
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

	public function formSettings(){
		$statuses = array();
		$tableMap = [];
		$tableList = Customer_Application_Table::get();
		foreach($tableList as $table){
			$tableMap[$table->table_name] = DB::table($table->table_name.'_map')->where('meta','=','0')->get();

		}
		return view('admin.form-settings',compact('tableList','tableMap'));
	}
	public function postformSettings(){
		$table = Input::get('table_name');
//		dd($table);
		$tableForm  = Input::get('row');
//		dd($tableForm);

		DB::beginTransaction();
		try{

//				DB::table($table)->truncate();
				DB::table($table)->where('meta','=','0')->delete();
				if($tableForm){
					DB::table($table)->insert($tableForm);
				}
				DB::commit();




		}
		catch(\Exception $e){
			DB::rollback();
			dd($e);
			//return redirect()->withErrors($e);
		}

		return redirect()->route('admin.form.settings');
	}


}
