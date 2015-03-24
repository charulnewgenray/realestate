<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Customer\Customer_Application_Table;
use App\Models\Customer\Personal_Information;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Input;
use App\Models\Customer\Property_Application;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Vsmoraes\Pdf\PdfFacade;


class RegisterController extends Controller
{

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		$personalInformation = array();
		return view('register.register', compact('personalInformation'));


	}

	public function updateIntoTable($table, $application_no, $formData)
	{
		$update = DB::table($table)->where('application_no', $application_no)->update($formData);
		return $update;
	}

	public function insertIntoTable($table, $application_no, $formData)
	{
		$insert = DB::table($table)->insert($formData);
		return $insert;
	}

	public function getDataFromTable($table, $application_no)
	{
		$find = DB::table($table)->select('application_no')->where('application_no', $application_no)->first();
		return $find;
	}

	public function deleteDataFromTable($table, $application_no)
	{
		$find = DB::table($table)->where('application_no', '=', $application_no)->delete();
		return $find;
	}

	public function postRegister()
	{

		parse_str(Input::get('form'), $formData);
		$make_pdf = Input::get('make_pdf');

		$tableList = Customer_Application_Table::lists('table_heading', 'table_name');
		foreach ($tableList as $key => $value) {
			if ($formData[$key]) {
				$find = $this->getDataFromTable($key, $formData['application_no']);
				if ($find == NULL) {
					$formData[$key]['application_no'] = $formData['application_no'];
					$insert = $this->insertIntoTable($key, $formData['application_no'], $formData[$key]);
					if (isset($formData[$key . '_meta'])) {
						$insert = $this->insertIntoTable($key . '_meta', $formData['application_no'], $formData[$key . '_meta']);
					}
				} else {
					$update = $this->updateIntoTable($key, $formData['application_no'], $formData[$key]);
					if (isset($formData[$key . '_meta'])) {
						$delete = $this->deleteDataFromTable($key . '_meta', $formData['application_no']);
						$insert = $this->insertIntoTable($key . '_meta', $formData['application_no'], $formData[$key . '_meta']);
					}
				}

			}

		}
		return ['status' => 'success', 'message' => 'Application successfully updated!'];


//
	}

	public function create()
	{
		$application = Property_Application::create(['user_id' => Input::get('user_id'), 'property_id' => Input::get('property_id'), 'status' => 'Draft']);
		return redirect()->to(route('register.application', array('id' => $application)));
	}

	public function getApplications()
	{
		if (Auth::id()) {
			$userApplications = DB::table('customer_property_application')->where('user_id', '=', Auth::id())->where('status', '!=', 'Completed')->lists('applicant_email', 'application_no');
			return ['status' => 'success', 'message' => 'Successfully logged in', 'data' => $userApplications, 'user_id' => Auth::id()];
		}

	}

	public function login()
	{
		if (Auth::attempt(array('email' => Input::get('email'), 'password' => Input::get('password')), true)) {
			$userApplications = DB::table('customer_property_application')->where('user_id', '=', Auth::id())->where('status', '!=', 'Completed')->lists('applicant_email', 'application_no');

			return ['status' => 'success', 'message' => 'Successfully logged in', 'data' => $userApplications, 'user_id' => Auth::id()];
		}
		return ['status' => 'failed', 'message' => 'email not found'];
	}

	public function signup()
	{
		$userid = User::where('email', '=', Input::get('email'))->pluck('id');
		if ($userid) {
			return ['status' => 'failed', 'message' => 'Email already registered.'];
		} else {
			$user = User::create(['name' => Input::get('name'), 'email' => Input::get('email'), 'password' => Hash::make(Input::get('password'))]);
			$roleid = DB::table('roles')->where('name', '=', 'Customer')->pluck('id');
			DB::table('assigned_roles')->insert(
				['user_id' => $user->id, 'role_id' => $roleid]
			);
			if ($user->id) {
				Auth::loginUsingId($user->id);
				if (Auth::check())
					return ['status' => 'success', 'data' => ['user_id' => $user->id]];
				else
					return ['status' => 'failed', 'message' => 'Could Not login please try again'];
			} else {
				return ['status' => 'failed', 'message' => 'email not found'];
			}
		}
	}

	public function show($id)
	{
//		//$html = view('register.pdf-view')->render();
//		$html = 'test';
//		PdfFacade::load($html)->filename('/pdf/example1.pdf')
//			->output();;
//		return 'Pdf Saved';
//			die;
		if (Auth::check()) {
			$userId = Auth::user()->id;
			$data = [];
			$dataMap = [];
			$tableList = Customer_Application_Table::orderBy('section', 'asc')->lists('table_heading', 'table_name');
			$tableSection = Customer_Application_Table::orderBy('section', 'asc')->select('table_heading', 'section', 'table_name')->get();
			$dataSection = [];
			foreach ($tableSection as $key => $section) {
				$dataSection[$section->table_name] = ['heading' => $section->table_heading, 'section' => $section->section];
			}

			foreach ($tableList as $key => $value) {
				$data[$key] = DB::table($key)->where('application_no', '=', $id)->first();
				$data_meta = DB::table($key . '_meta')->where('application_no', '=', $id)->get();

				$metaArr = array();
				foreach ($data_meta as $meta) {
					$fieldName = $meta->field_name;
					$data[$key]->$fieldName = $meta->field_value;
				}
				$dataMap[$key] = DB::table($key . '_map')->get();


			}
			return view('register.register', compact('data', 'dataMap', 'dataSection', 'id'));
		} else {
			$data = NULL;
		}
		return view('register.register', compact('data'));
	}

	public function load($id,$application_no)
	{
		$tableList = Customer_Application_Table::orderBy('section', 'asc')->lists('table_heading', 'table_name');
		foreach ($tableList as $key => $value) {
			$data = DB::table($key)->where('application_no', '=', $id)->first();
			if($data!=NULL){
				$data->application_no = $application_no;
				$arrData = (array)$data;
				unset($arrData['id']);
				$find = DB::table($key)->where('application_no', '=', $application_no)->first();
				if($find){
					$update = DB::table($key)->where('application_no', '=', $application_no)->update($arrData);
				}else{
					$insert = DB::table($key)->insert($arrData);
				}
				$data_meta = DB::table($key . '_meta')->where('application_no', '=', $id)->get();
				foreach($data_meta as $key2=>$meta){
					$meta->application_no = $application_no;
					$data_meta_arr[] = (array)$data_meta[$key2];
					unset($data_meta_arr[$key2]['id']);
					//dd($data_meta_arr);
				}
				$findMetaData = DB::table($key . '_meta')->where('application_no', '=', $application_no)->first();
				if($findMetaData){
					$data_meta_delete = DB::table($key . '_meta')->where('application_no', '=', $application_no)->delete();

				}
				$data_meta_insert = DB::table($key . '_meta')->insert($data_meta_arr);
			}


		}
		return redirect()->route('register.application',['id'=>$application_no]);
	}
}
