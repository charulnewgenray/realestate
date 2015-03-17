<?php namespace App\Http\Controllers\Tenant;

use App\Http\Requests;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\Customer\Personal_Information;
use App\Models\Customer\Occupants_Information;
use App\Models\Customer\Current_Residence_History;
use App\Models\Customer\Previous_Residence_History;
use App\Models\Customer\Prior_Residence_History;
use App\Models\Customer\Current_Employment_History;
use App\Models\Customer\Previous_Employment_History;
use App\Models\Customer\Prior_Employment_History;
use App\Models\Customer\Saving_Credit_History;
use App\Models\Customer\Checking_Credit_History;
use App\Models\Customer\Credit_Credit_History;
use App\Models\Customer\Auto_Credit_History;
use App\Models\Customer\Vehicles;
use App\Models\Customer\Doctor_References;
use App\Models\Customer\Lawyer_References;
use App\Models\Customer\Native_References;
use App\Models\Customer\General_Information;

use Illuminate\Http\Request;
use Monolog\Handler\NullHandlerTest;

class ApplicationsController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		$applications = DB::table('wp_tenant_meta as wtm')
			->select('wtm.tenant_id','wtm.property_id','tenant_meta_key','tenant_meta_value','wt.user_id','wu.display_name',
				'wu.user_email','wu.user_registered','wp.post_title','wp.post_date')
			->join('wp_tenant as wt','wtm.tenant_id','=','wt.id')
			->join('wp_users as wu','wt.user_id','=','wu.ID')
			->join('wp_posts as wp','wp.ID','=','wtm.property_id')
			->where('wp.post_type','=','property')
			->where('wtm.tenant_meta_value','=','Submit')
			->get();
		return view('tenant.applications',compact('applications'));
	}
	/**
	 * Display a result of the search request.
	 *
	 * @return Response
	 */
	public function search(){

		$applications = DB::table('wp_tenant_meta as wtm')
			->select('wtm.tenant_id','wtm.property_id','tenant_meta_key','tenant_meta_value','wt.user_id','wu.display_name',
				'wu.user_email','wu.user_registered','wp.post_title','wp.post_date')
			->join('wp_tenant as wt','wtm.tenant_id','=','wt.id')
			->join('wp_users as wu','wt.user_id','=','wu.ID')
			->join('wp_posts as wp','wp.ID','=','wtm.property_id')
			->where('wp.post_type','=','property')
			->where('wtm.tenant_meta_value','=','Submit');
		if(Input::get('name')){
			$applications = $applications->where('wu.display_name','LIKE','%'.Input::get('name').'%');
		}if(Input::get('email')){
			$applications = $applications->where('wu.user_email','LIKE','%'.Input::get('email').'%');
		}if(Input::get('email')){
			$applications = $applications->where('wp.post_title','LIKE','%'.Input::get('property_name').'%');
		}
		$applications = $applications->get();
		$html = "";
		foreach($applications as $key => $application){
			$html .= "<tr role='row'><td><div class='checker'><span><input type='checkbox' name='id[]' value='1'></span></div></td><td>$application->display_name</td><td>$application->user_email</td><td>$application->post_title</td><td>$application->post_date</td><td></td><td><a href='javascript:;' class='btn btn-xs default'><i class='fa fa-search'></i> View</a></td></tr>";
		}
		echo json_encode($html);


	}

	public function draft(){
		$draftApplication = DB::table('customer_property_application')
			->where('status','=','draft')
			->where('user_id','=',Auth::id())
			->get();
		return view('tenant.draft',compact('draftApplication'));
	}

	public function submitted(){
		$submittedApplication = DB::table('customer_property_application')
			->where('status','=','submitted')
			->where('user_id','=',Auth::id())
			->get();
		return view('tenant.submitted',compact('submittedApplication'));
	}

	public function showapplication($id){
		if($id){
			$personalInformation = DB::table('customer_personal_information as cpi')->select(array('*','cpi.application_no'))
				->leftjoin('customer_current_residence_history as crh','crh.application_no','=','cpi.application_no')
				->leftjoin('customer_previous_residence_history','customer_previous_residence_history.application_no','=','cpi.application_no')
				->leftjoin('customer_prior_residence_history','customer_prior_residence_history.application_no','=','cpi.application_no')
				->leftjoin('customer_occupants_information as coi','coi.application_no','=','cpi.application_no')
				->leftjoin('customer_current_employment_history','customer_current_employment_history.application_no','=','cpi.application_no')
				->leftjoin('customer_previous_employment_history','customer_previous_employment_history.application_no','=','cpi.application_no')
				->leftjoin('customer_prior_employment_history','customer_prior_employment_history.application_no','=','cpi.application_no')
				->leftjoin('customer_saving_credit_history','customer_saving_credit_history.application_no','=','cpi.application_no')
				->leftjoin('customer_checking_credit_history','customer_checking_credit_history.application_no','=','cpi.application_no')
				->leftjoin('customer_credit_credit_history','customer_credit_credit_history.application_no','=','cpi.application_no')
				->leftjoin('customer_auto_credit_history','customer_auto_credit_history.application_no','=','cpi.application_no')
				->leftjoin('customer_vehicles as cv','cv.application_no','=','cpi.application_no')
				->leftjoin('customer_doctor_references','customer_doctor_references.application_no','=','cpi.application_no')
				->leftjoin('customer_lawyer_references','customer_lawyer_references.application_no','=','cpi.application_no')
				->leftjoin('customer_native_references','customer_native_references.application_no','=','cpi.application_no')
				->leftjoin('customer_general_information as cgi','cgi.application_no','=','cpi.application_no')
				->where('cpi.application_no','=',$id)->first();
			if($personalInformation == NUll){
				$personalInformation = array();
				return view('tenant.show-application',compact('personalInformation'));
			}else{
				return view('tenant.show-application',compact('personalInformation','id'));
			}

		}else{
			$personalInformation = array();
		}
		return view('tenant.show-application',compact('personalInformation'));
	}

	public  function updateIntoTable($table,$application_no,$formData){
		$update = DB::table($table)->where('application_no', $application_no)->update($formData);
		return $update;
	}

	public  function insertIntoTable($table,$application_no,$formData){
		$insert = DB::table($table)->insert($formData);
		return $insert;
	}

	public  function getDataFromTable($table,$application_no){
		$find = DB::table($table)->select('application_no')->where('application_no', $application_no)->first();
		return $find;
	}

	public function postapplication(){
		$application_no = Input::get('application_no');
		$formData  = Input::get();
		$formData['customer_personal_information']['application_no'] = $application_no;
		$formData['customer_occupants_information']['application_no'] = $application_no;
		$formData['customer_current_residence_history']['application_no'] = $application_no;
		$formData['customer_previous_residence_history']['application_no'] = $application_no;
		$formData['customer_prior_residence_history']['application_no'] = $application_no;
		$formData['customer_current_employment_history']['application_no'] = $application_no;
		$formData['customer_previous_employment_history']['application_no'] = $application_no;
		$formData['customer_prior_employment_history']['application_no'] = $application_no;
		$formData['customer_saving_credit_history']['application_no'] = $application_no;
		$formData['customer_checking_credit_history']['application_no'] = $application_no;
		$formData['customer_credit_credit_history']['application_no'] = $application_no;
		$formData['customer_auto_credit_history']['application_no'] = $application_no;
		$formData['customer_vehicles']['application_no'] = $application_no;
		$formData['customer_doctor_references']['application_no'] = $application_no;
		$formData['customer_lawyer_references']['application_no'] = $application_no;
		$formData['customer_native_references']['application_no'] = $application_no;
		$formData['customer_general_information']['application_no'] = $application_no;

		if(Input::get('customer_personal_information')){
			$table = 'customer_personal_information';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_personal_information']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_personal_information']);
			}

		}
		if(Input::get('customer_occupants_information')){
			$table = 'customer_occupants_information';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_occupants_information']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_occupants_information']);
			}
		}
		if(Input::get('customer_current_residence_history')){
			$table = 'customer_current_residence_history';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_current_residence_history']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_current_residence_history']);
			}
		}
		if(Input::get('customer_previous_residence_history')){
			$table = 'customer_previous_residence_history';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_previous_residence_history']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_previous_residence_history']);
			}
		}
		if(Input::get('customer_prior_residence_history')){
			$table = 'customer_prior_residence_history';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_prior_residence_history']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_prior_residence_history']);
			}
		}
		if(Input::get('customer_current_employment_history')){
			$table = 'customer_current_employment_history';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_current_employment_history']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_current_employment_history']);
			}
		}
		if(Input::get('customer_previous_employment_history')){
			$table = 'customer_previous_employment_history';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_previous_employment_history']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_previous_employment_history']);
			}
		}
		if(Input::get('customer_prior_employment_history')){
			$table = 'customer_prior_employment_history';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_prior_employment_history']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_prior_employment_history']);
			}
		}
		if(Input::get('customer_saving_credit_history')){
			$table = 'customer_saving_credit_history';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_saving_credit_history']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_saving_credit_history']);
			}
		}
		if(Input::get('customer_checking_credit_history')){
			$table = 'customer_checking_credit_history';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_checking_credit_history']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_checking_credit_history']);
			}
		}
		if(Input::get('customer_credit_credit_history')){
			$table = 'customer_credit_credit_history';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_credit_credit_history']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_credit_credit_history']);
			}
		}
		if(Input::get('customer_auto_credit_history')){
			$table = 'customer_auto_credit_history';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_auto_credit_history']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_auto_credit_history']);
			}
		}
		if(Input::get('customer_vehicles')){
			$table = 'customer_vehicles';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_vehicles']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_vehicles']);
			}
		}
		if(Input::get('customer_doctor_references')){
			$table = 'customer_doctor_references';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_doctor_references']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_doctor_references']);
			}
		}
		if(Input::get('customer_lawyer_references')){
			$table = 'customer_lawyer_references';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_lawyer_references']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_lawyer_references']);
			}
		}
		if(Input::get('customer_lawyer_references')){
			$table = 'customer_lawyer_references';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_lawyer_references']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_lawyer_references']);
			}
		}
		if(Input::get('customer_native_references')){
			$table = 'customer_native_references';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_native_references']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_native_references']);
			}
		}
		if(Input::get('customer_general_information')){
			$table = 'customer_general_information';
			$find = $this->getDataFromTable($table,$application_no);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$application_no,$formData['customer_general_information']);
			}else{
				$update = $this->updateIntoTable($table,$application_no,$formData['customer_general_information']);
			}
		}
		return redirect()->back()->withInput()->with('success', 'Application Information has been successfully updated!.');;

	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		//
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		/* code check the property id requested is submit status or not if not then no show the info */
		$isSubmit = DB::table('wp_tenant_meta as wtm')
						->where('wtm.tenant_meta_value','=','Submit')
						->where('wtm.property_id','=',$id)
						->first();
		if($isSubmit){
			$applications = DB::table('wp_tenant_meta as wtm')
				->select('wtm.tenant_id','wtm.property_id','wtm.tenant_meta_key','wtm.tenant_meta_value')
				->where('wtm.property_id','=',$id)
				->where('wtm.tenant_meta_key','!=','tenant_application_status')
				->get();
			return view('tenant.show',compact('applications'));
		}else{
			return redirect()->back()->withErrors("No such application record found!.");
		}

	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		//
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}

}
