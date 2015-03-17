<?php namespace App\Http\Controllers\Admin;

use App\Http\Requests;
use App\Models\Customer\Property_Application;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Admin\CustomerApplicationLog;
use App\Http\Controllers\Admin\IndexController;
use Illuminate\Http\Request;

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
		return view('admin.applications',compact('applications'));
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
		$draftApplication = DB::table('customer_property_application')->where('status','=',Config::get('constants.application_draft'))->get();
		return view('admin.draft',compact('draftApplication'));
	}
	
	public function submitted(){
		$submittedApplication = DB::table('customer_property_application')->where('status','=',Config::get('constants.application_submitted'))->get();
		return view('admin.submitted',compact('submittedApplication'));
	}

	public function accepted(){
		$acceptedApplication = DB::table('customer_property_application')->where('status','=','Accepted')->get();
		return view('admin.accepted',compact('acceptedApplication'));
	}

	public function showapplication($id){
		$statusCode = ['Draft','Canceled','Completed'];
		if($id){
			$personalInformation = DB::table('customer_personal_information as cpi')
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
				->leftjoin('customer_property_application as cap','cap.application_no','=','cpi.application_no')
				->where('cpi.application_no','=',$id)->first();
			if($personalInformation==NULL){
				$personalInformation = array();
			}


		}else{
			$personalInformation = NULL;
		}
		$application_history = CustomerApplicationLog::where('application_no','=',$id)->get();
		$statuses = DB::table('customer_application_status')->get();
		return view('admin.show-application',compact('personalInformation','statuses','application_history','statusCode'));
	}

	public function applicationComment(){
		$postComment = Input::except('_token');

		if($postComment['application_cancel']){
			$postComment['status'] = 'Canceled';
			$comments = CustomerApplicationLog::create($postComment);
			$propertyApplication  = Property_Application::where('application_no','=',Input::get('application_no'))->update(array('status'=>$postComment['status']));
			return redirect()->back()->withErrors("Applicaiton history successfully canceled!.");
		}else{
			$comments = CustomerApplicationLog::create($postComment);
			$propertyApplication  = Property_Application::where('application_no','=',Input::get('application_no'))->update(array('status'=>$postComment['status']));
			return redirect()->back()->withErrors("Applicaiton history successfully updated!.");
		}





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
			return view('admin.show',compact('applications'));
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
