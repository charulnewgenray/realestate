<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Customer\Personal_Information;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use App\Models\Customer\Property_Application;

class RegisterController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		$personalInformation = array();
		return view('register.register',compact('personalInformation'));


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

	public function postRegister(){
		parse_str(Input::get('form'),$formData);
		$formData['customer_personal_information']['application_no'] = $formData['application_no'];
		$formData['customer_occupants_information']['application_no'] = $formData['application_no'];
		$formData['customer_current_residence_history']['application_no'] = $formData['application_no'];
		$formData['customer_previous_residence_history']['application_no'] = $formData['application_no'];
		$formData['customer_prior_residence_history']['application_no'] = $formData['application_no'];
		$formData['customer_current_employment_history']['application_no'] = $formData['application_no'];
		$formData['customer_previous_employment_history']['application_no'] = $formData['application_no'];
		$formData['customer_prior_employment_history']['application_no'] = $formData['application_no'];
		$formData['customer_saving_credit_history']['application_no'] = $formData['application_no'];
		$formData['customer_checking_credit_history']['application_no'] = $formData['application_no'];
		$formData['customer_credit_credit_history']['application_no'] = $formData['application_no'];
		$formData['customer_auto_credit_history']['application_no'] = $formData['application_no'];
		$formData['customer_vehicles']['application_no'] = $formData['application_no'];
		$formData['customer_doctor_references']['application_no'] = $formData['application_no'];
		$formData['customer_lawyer_references']['application_no'] = $formData['application_no'];
		$formData['customer_native_references']['application_no'] = $formData['application_no'];
		$formData['customer_general_information']['application_no'] = $formData['application_no'];
		
		if(Input::get('customer_personal_information')){
			$table = 'customer_personal_information';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_personal_information']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_personal_information']);
			}

		}
		if(Input::get('customer_occupants_information')){
			$table = 'customer_occupants_information';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_occupants_information']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_occupants_information']);
			}
		}
		if(Input::get('customer_current_residence_history')){
			$table = 'customer_current_residence_history';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_current_residence_history']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_current_residence_history']);
			}
		}
		if(Input::get('customer_previous_residence_history')){
			$table = 'customer_previous_residence_history';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_previous_residence_history']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_previous_residence_history']);
			}
		}
		if(Input::get('customer_prior_residence_history')){
			$table = 'customer_prior_residence_history';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_prior_residence_history']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_prior_residence_history']);
			}
		}
		if(Input::get('customer_current_employment_history')){
			$table = 'customer_current_employment_history';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_current_employment_history']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_current_employment_history']);
			}
		}
		if(Input::get('customer_previous_employment_history')){
			$table = 'customer_previous_employment_history';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_previous_employment_history']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_previous_employment_history']);
			}
		}
		if(Input::get('customer_prior_employment_history')){
			$table = 'customer_prior_employment_history';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_prior_employment_history']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_prior_employment_history']);
			}
		}
		if(Input::get('customer_saving_credit_history')){
			$table = 'customer_saving_credit_history';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_saving_credit_history']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_saving_credit_history']);
			}
		}
		if(Input::get('customer_checking_credit_history')){
			$table = 'customer_checking_credit_history';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_checking_credit_history']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_checking_credit_history']);
			}
		}
		if(Input::get('customer_credit_credit_history')){
			$table = 'customer_credit_credit_history';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_credit_credit_history']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_credit_credit_history']);
			}
		}
		if(Input::get('customer_auto_credit_history')){
			$table = 'customer_auto_credit_history';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_auto_credit_history']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_auto_credit_history']);
			}
		}
		if(Input::get('customer_vehicles')){
			$table = 'customer_vehicles';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_vehicles']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_vehicles']);
			}
		}
		if(Input::get('customer_doctor_references')){
			$table = 'customer_doctor_references';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_doctor_references']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_doctor_references']);
			}
		}
		if(Input::get('customer_lawyer_references')){
			$table = 'customer_lawyer_references';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_lawyer_references']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_lawyer_references']);
			}
		}
		if(Input::get('customer_lawyer_references')){
			$table = 'customer_lawyer_references';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_lawyer_references']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_lawyer_references']);
			}
		}
		if(Input::get('customer_native_references')){
			$table = 'customer_native_references';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_native_references']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_native_references']);
			}
		}
		if(Input::get('customer_general_information')){
			$table = 'customer_general_information';
			$find = $this->getDataFromTable($table,$formData['application_no']);
			if($find == NULL){
				$insert = $this->insertIntoTable($table,$formData['application_no'],$formData['customer_general_information']);
			}else{
				$update = $this->updateIntoTable($table,$formData['application_no'],$formData['customer_general_information']);
			}
		}
	}
	public function create(){
		$application = Property_Application::create(['user_id'=>Input::get('user_id'),'property_id'=>Input::get('property_id'),'status'=>'draft']);
		return redirect()->to(route('register.application',array('id'=>$application)));
	}

	public function getApplications(){
		if(Auth::id()){
			$userApplications = DB::table('customer_property_application')->where('user_id','=',Auth::id())->whereNotIn('status','=',[Config::get('constants.application_completed'),Config::get('constants.application_canceled')])->lists('applicant_email','application_no');
			return ['status'=> 'success','message' => 'Successfully logged in','data' => $userApplications,'user_id'=>Auth::id()];
		}

	}

	public function login(){
		if (Auth::attempt(array('email' => Input::get('email'), 'password' => Input::get('password')),true))
		{
			$userApplications = DB::table('customer_property_application')->where('user_id','=',Auth::id())->where('status','=','draft')->lists('applicant_email','application_no');

			return ['status'=> 'success','message' => 'Successfully logged in','data' => $userApplications,'user_id'=>Auth::id()];
		}
		return ['status'=> 'failed','message' => 'email not found'];
	}

	public function signup(){
		$userid = User::where('email','=',Input::get('email'))->pluck('id');
		if($userid){
			return ['status'=> 'failed','message' => 'Email already registered.'];
		}
		else{
			$user = User::create(['name'=> Input::get('name'),'email'=> Input::get('email'),'password'=> Hash::make(Input::get('password'))]);
			$roleid = DB::table('roles')->where('name','=','Customer')->pluck('id');
			DB::table('assigned_roles')->insert(
				['user_id' => $user->id , 'role_id' => $roleid]
			);
			if($user->id){
				Auth::loginUsingId($user->id);
				if(Auth::check())
					return ['status'=> 'success','data'=>['user_id'=>$user->id]];
				else
					return ['status'=> 'failed','message' => 'Could Not login please try again'];
			}
			else{
				return ['status'=> 'failed','message' => 'email not found'];
			}
		}
	}

	public function show($id){
		if(Auth::check()){
			$userId =  Auth::user()->id;
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

			return view('register.register',compact('personalInformation'));
		}else{
			$personalInformation = NULL;
		}
		return view('register.register',compact('personalInformation'));
	}
}
