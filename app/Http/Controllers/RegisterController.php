<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

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
		$personalInformation = NULL;
		return view('register.register',compact('personalInformation'));


	}
	public function postRegister(){
		parse_str(Input::get('form'),$formdata);
		$formdata['personal_information']['application_no'] = 1;
		$formdata['occupants_information']['application_no'] = 1;
		$formdata['current_residence_history']['application_no'] = 1;
		$formdata['previous_residence_history']['application_no'] = 1;
		$formdata['prior_residence_history']['application_no'] = 1;

		$formdata['current_residence_history']['cur_rent_paid_full'] = 'no';
		$formdata['previous_residence_history']['cur_rent_paid_full'] = 'no';
		$formdata['prior_residence_history']['cur_rent_paid_full'] = 'no';

		$formdata['current_employment_history']['application_no'] = 1;
		$formdata['previous_employment_history']['application_no'] = 1;
		$formdata['prior_employment_history']['application_no'] = 1;
		$formdata['saving_credit_history']['application_no'] = 1;
		$formdata['checking_credit_history']['application_no'] = 1;
		$formdata['credit_credit_history']['application_no'] = 1;
		$formdata['auto_credit_history']['application_no'] = 1;
		$formdata['vehicles']['application_no'] = 1;
		$formdata['doctor_references']['application_no'] = 1;
		$formdata['lawyer_references']['application_no'] = 1;
		$formdata['native_references']['application_no'] = 1;
		$formdata['general_information']['application_no'] = 1;
		$personalInformation = DB::table('customer_personal_information')->insert(
			$formdata['personal_information']
		);
		$occupantsInformation = DB::table('customer_occupants_information')->insert(
			$formdata['occupants_information']
		);
		$currentResidence = DB::table('customer_current_residence_history')->insert(
			$formdata['current_residence_history']
		);

//		$previousResidence = DB::table('customer_previous_residence_history')->insert(
//			$formdata['previous_residence_history']
//		);
//		$priorResidence = DB::table('customer_prior_residence_history')->insert(
//			$formdata['prior_residence_history']
//		);
		$currentEmployment = DB::table('customer_current_employment_history')->insert(
			$formdata['current_employment_history']
		);
		$previousEmployment = DB::table('customer_previous_employment_history')->insert(
			$formdata['previous_employment_history']
		);
		$priorEmployment = DB::table('customer_prior_employment_history')->insert(
			$formdata['prior_employment_history']
		);
		$savingCredit = DB::table('customer_saving_credit_history')->insert(
			$formdata['saving_credit_history']
		);
		$checkingCredit = DB::table('customer_checking_credit_history')->insert(
			$formdata['checking_credit_history']
		);
		$creditCredit = DB::table('customer_credit_credit_history')->insert(
			$formdata['credit_credit_history']
		);
		$autoCredit = DB::table('customer_auto_credit_history')->insert(
			$formdata['auto_credit_history']
		);
		$vehicles = DB::table('customer_vehicles')->insert(
			$formdata['vehicles']
		);
		$doctorReferences = DB::table('customer_doctor_references')->insert(
			$formdata['doctor_references']
		);
		$lawyerReferences = DB::table('customer_lawyer_references')->insert(
			$formdata['lawyer_references']
		);
		$nativeReferences = DB::table('customer_native_references')->insert(
			$formdata['native_references']
		);
		$generalInformation = DB::table('customer_general_information')->insert(
			$formdata['general_information']
		);

	}
	public function create(){
		$application = Property_Application::create(['user_id'=>Input::get('user_id'),'property_id'=>Input::get('property_id'),'status'=>'draft']);
		return redirect()->to(route('register.application',array('id'=>$application)));
	}

	public function getApplications(){
		if(Auth::id()){
			$userApplications = DB::table('customer_property_application')->where('user_id','=',Auth::id())->where('status','=','draft')->lists('applicant_email','application_no');
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
			$personalInformation = DB::table('customer_personal_information as cpi')
				->join('customer_current_residence_history as crh','crh.application_no','=','cpi.application_no')
				->join('customer_previous_residence_history','customer_previous_residence_history.application_no','=','cpi.application_no')
				->join('customer_prior_residence_history','customer_prior_residence_history.application_no','=','cpi.application_no')
				->join('customer_occupants_information as coi','coi.application_no','=','cpi.application_no')
				->join('customer_current_employment_history','customer_current_employment_history.application_no','=','cpi.application_no')
				->join('customer_previous_employment_history','customer_previous_employment_history.application_no','=','cpi.application_no')
				->join('customer_prior_employment_history','customer_prior_employment_history.application_no','=','cpi.application_no')
				->join('customer_saving_credit_history','customer_saving_credit_history.application_no','=','cpi.application_no')
				->join('customer_checking_credit_history','customer_checking_credit_history.application_no','=','cpi.application_no')
				->join('customer_credit_credit_history','customer_credit_credit_history.application_no','=','cpi.application_no')
				->join('customer_auto_credit_history','customer_auto_credit_history.application_no','=','cpi.application_no')
				->join('customer_vehicles as cv','cv.application_no','=','cpi.application_no')
				->join('customer_doctor_references','customer_doctor_references.application_no','=','cpi.application_no')
				->join('customer_lawyer_references','customer_lawyer_references.application_no','=','cpi.application_no')
				->join('customer_native_references','customer_native_references.application_no','=','cpi.application_no')
				->join('customer_general_information as cgi','cgi.application_no','=','cpi.application_no')
				->where('cpi.application_no','=',$id)->first();

			return view('register.register',compact('personalInformation'));
		}else{
			$personalInformation = NULL;
		}
		return view('register.register',compact('personalInformation'));
	}
}
