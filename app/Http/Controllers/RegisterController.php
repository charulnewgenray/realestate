<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Admin\Application_Pdf;
use App\Models\Customer\Customer_Application_Table;
use App\Models\Customer\Personal_Information;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Input;
use App\Models\Customer\Property_Application;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Barryvdh\DomPDF\PDF;
use League\Flysystem\Exception;


class RegisterController extends Controller
{
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index($id)
	{
		$property_id = $id;
		return view('register.register',compact('property_id'));


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
//		dd(Input::get('make_pdf'));;
		$user_id = $formData['user_id'];
		$tableList = Customer_Application_Table::lists('table_heading', 'table_name');
		foreach ($tableList as $key => $value) {
			if ($formData[$key]) {
				$find = $this->getDataFromTable($key, $formData['application_no']);
				if ($find == NULL) {
					$formData[$key]['application_no'] = $formData['application_no'];
					try{
						$insert = $this->insertIntoTable($key, $formData['application_no'], $formData[$key]);
						if (isset($formData[$key . '_meta'])) {
							$insert = $this->insertIntoTable($key . '_meta', $formData['application_no'], $formData[$key . '_meta']);
						}
						$status = 'Success';
					}catch (\Exception $e){
						$message = $e->getMessage();
						$status = 'Failed';
					}
				} else {
					try{
						$update = $this->updateIntoTable($key, $formData['application_no'], $formData[$key]);
						if (isset($formData[$key . '_meta'])) {
							$delete = $this->deleteDataFromTable($key . '_meta', $formData['application_no']);
							$insert = $this->insertIntoTable($key . '_meta', $formData['application_no'], $formData[$key . '_meta']);
						}
						$status = 'Success';
					}catch (\ErrorException $e){
						$message = $e->getMessage();
						$status = 'Failed';
					}


				}

			}

		}
		if($status=="Failed"){
			return ['status' => $status, 'message' => $message];
		}elseif($status=="Success") {
			if (Input::get('make_pdf') == 1) {
				$table_class = "border-collapse: collapse;font-size:10px;";
				$tr_class = "";
				$tb_heading = "font-size:13px;margin-top:10px;top:10px;font-weight:bold;";
				$td_class = "border: 1px solid #999;padding: 0.25rem;text-align: left";
				$application_no = $formData['application_no'];
				$data = [];
				$dataMap = [];
				$residenceTable = ['customer_current_residence_history', 'customer_previous_residence_history', 'customer_prior_residence_history'];
				$employmentTable = ['customer_current_employment_history', 'customer_previous_employment_history', 'customer_prior_employment_history'];
				$creditTable = ['customer_saving_credit_history', 'customer_checking_credit_history', 'customer_credit_credit_history', 'customer_auto_credit_history'];
				$referenceTable = ['customer_doctor_references', 'customer_lawyer_references', 'customer_native_references'];
				$residenceArray = [];
				$employmentArray = [];
				$creditArray = [];
				$referenceArray = [];
				$tableList = Customer_Application_Table::orderBy('section', 'asc')->lists('table_heading', 'table_name');
				$tableSection = Customer_Application_Table::orderBy('section', 'asc')->select('table_heading', 'section', 'table_name')->get();
				$dataSection = [];
				foreach ($tableSection as $key => $section) {
					$dataSection[$section->table_name] = ['heading' => $section->table_heading, 'section' => $section->section];
				}
				foreach ($tableList as $key => $value) {
					$data[$key] = DB::table($key)->where('application_no', '=', $application_no)->first();
					$data_meta = DB::table($key . '_meta')->where('application_no', '=', $application_no)->get();

					$metaArr = array();
					foreach ($data_meta as $meta) {
						$fieldName = $meta->field_name;
						$data[$key]->$fieldName = $meta->field_value;
					}
					$dataMap[$key] = DB::table($key . '_map')->get();
				}
				$html = "";
				foreach ($dataMap as $key => $value) {
					if ($key == "customer_personal_information") {
						$html .= '<div style="' . $tb_heading . '">' . $dataSection[$key]["heading"] . '</div>';
						$html .= '<table border="0" cellspacing="0" width="100%" style="' . $table_class . '">';
						$index = 0;
						$count = count($value);
						foreach ($value as $field) {
							//$html .= $index;
							$fieldName = $field->field;
							if (($index % 3) == 0 || $index == 0) {
								$html .= '<tr>';
							}

							$html .= '<td style="font-weight:bold;' . $td_class . '" width="12%">' . $field->label . '</td>';
							$html .= '<td style="' . $td_class . '" width="21.33%">' . $data[$key]->$fieldName . '</td>';
							if (($index % 3) == 2 || $index == $count - 1) {
								$html .= '</tr>';
							}
							$index = $index + 1;
						}
						$html .= '</table>';

					} else if ($key == "customer_occupants_information") {
						$html .= '<div style="' . $tb_heading . '">' . $dataSection[$key]["heading"] . '</div>';
						$html .= '<table border="0" cellspacing="0" width="100%" style="' . $table_class . '">';
						$html .= '<thead><tr>';
						foreach ($value as $field) {
							$html .= '<th style="' . $td_class . '">' . $field->label . '</th>';
						}
						$html .= '</tr></thead>';

						$index = 0;
						$count = count($value);
						$html .= '<tbody>';
						foreach ($value as $field) {
							//$html .= $index;
							$fieldName = $field->field;
							if (($index % 3) == 0 || $index == 0) {
								$html .= '<tr>';
							}
							$html .= '<td style="' . $td_class . '" width="21.33%">' . $data[$key]->$fieldName . '</td>';
							if (($index % 3) == 2 || $index == $count - 1) {
								$html .= '</tr>';
							}
							$index = $index + 1;
						}
						$html .= '</tbody>';
						$html .= '</table>';
					} else if (in_array($key, $residenceTable)) {
						foreach ($value as $field) {
							$fieldName = $field->field;
							$residenceArray[$field->label][$key] = $data[$key]->$fieldName;
						}
						if ($key == "customer_prior_residence_history") {
							$html .= '<div style="' . $tb_heading . '"> Rental Residence History' . '</div>';
							$html .= '<table border="0" cellspacing="0" width="100%" style="' . $table_class . '">';
							$html .= '<thead>';
							$html .= '<tr>';
							$html .= '<th style="' . $td_class . '"></th><th style="' . $td_class . '">' . 'Current Residence' . '</th>';
							$html .= '<th style="' . $td_class . '">' . 'Previous Residence' . '</th>';
							$html .= '<th style="' . $td_class . '">' . 'Prior Residence' . '</th>';
							$html .= '</tr>';
							$html .= '</thead><tbody>';

							foreach ($residenceArray as $keylabel => $residence) {

								$html .= '<tr>';
								$html .= '<td style="' . $td_class . '" width="21.33%">' . $keylabel . '</td>';
								foreach ($residence as $residence1) {
									if (isset($residence1)) {
										$html .= '<td style="' . $td_class . '" width="21.33%">' . $residence1 . '</td>';
									}
								}
								$html .= '</tr>';
							}
							$html .= '</tbody></table>';
						}

					} else if (in_array($key, $employmentTable)) {
						foreach ($value as $field) {
							$fieldName = $field->field;
							$employmentArray[$field->label][$key] = $data[$key]->$fieldName;
						}
						if ($key == "customer_current_employment_history") {
							$html .= '<div style="' . $tb_heading . '"> Employment History' . '</div>';
							$html .= '<table border="0" cellspacing="0" width="100%" style="' . $table_class . '">';
							$html .= '<thead>';
							$html .= '<tr>';
							$html .= '<th style="' . $td_class . '"></th><th style="' . $td_class . '">' . 'Prior Employment' . '</th>';
							$html .= '<th style="' . $td_class . '">' . 'Previous Employment' . '</th>';
							$html .= '<th style="' . $td_class . '">' . 'Current Employment' . '</th>';
							$html .= '</tr>';
							$html .= '</thead><tbody>';

							foreach ($employmentArray as $keylabel => $employment) {

								$html .= '<tr>';
								$html .= '<td style="' . $td_class . '" width="21.33%">' . $keylabel . '</td>';
								foreach ($employment as $employmen1) {
									if (isset($employmen1)) {
										$html .= '<td style="' . $td_class . '" width="21.33%">' . $employmen1 . '</td>';
									}
								}
								$html .= '</tr>';
							}
							$html .= '</tbody></table>';
						}

					} else if ($key == "customer_vehicles") {
						$html .= '<div style="' . $tb_heading . '">' . $dataSection[$key]["heading"] . '</div>';
						$html .= '<table border="0" cellspacing="0" width="100%" style="' . $table_class . '">';
						$html .= '<thead><tr>';
						foreach ($value as $field) {
							$html .= '<th style="' . $td_class . '">' . $field->label . '</th>';
						}
						$html .= '</tr></thead>';

						$index = 0;
						$count = count($value);
						$html .= '<tbody>';
						foreach ($value as $field) {
							$fieldName = $field->field;
							if ($index == 0) {
								$html .= '<tr>';
							}
							$html .= '<td style="' . $td_class . '" width="21.33%">' . $data[$key]->$fieldName . '</td>';
							if ($index == $count - 1) {
								$html .= '</tr>';
							}
							$index = $index + 1;
						}
						$html .= '</tbody>';
						$html .= '</table>';
					} else if (in_array($key, $creditTable)) {
						foreach ($value as $field) {
							$fieldName = $field->field;
							$creditArray[$field->label][$key] = $data[$key]->$fieldName;
						}
						if ($key == "customer_saving_credit_history") {
							$html .= '<div style="' . $tb_heading . '"> Credit History' . '</div>';
							$html .= '<table border="0" cellspacing="0" width="100%" style="' . $table_class . '">';
							$html .= '<thead>';
							$html .= '<tr>';
							$html .= '<th style="' . $td_class . '"></th><th style="' . $td_class . '">' . 'Auto Credit' . '</th>';
							$html .= '<th style="' . $td_class . '">' . 'Credit Credit' . '</th>';
							$html .= '<th style="' . $td_class . '">' . 'Checking Credit' . '</th>';
							$html .= '<th style="' . $td_class . '">' . 'Saving Credit' . '</th>';
							$html .= '</tr>';
							$html .= '</thead><tbody>';

							foreach ($creditArray as $keylabel => $credit) {

								$html .= '<tr>';
								$html .= '<td style="' . $td_class . '" width="21.33%">' . $keylabel . '</td>';
								foreach ($credit as $credit1) {
									if (isset($credit1)) {
										$html .= '<td style="' . $td_class . '" width="21.33%">' . $credit1 . '</td>';
									}
								}
								$html .= '</tr>';
							}
							$html .= '</tbody></table>';
						}

					} else if (in_array($key, $referenceTable)) {
						foreach ($value as $field) {
							$fieldName = $field->field;
							$referenceArray[$field->label][$key] = $data[$key]->$fieldName;
						}
						if ($key == "customer_native_references") {
							$html .= '<div style="' . $tb_heading . '"> Reference History' . '</div>';
							$html .= '<table border="0" cellspacing="0" width="100%" style="' . $table_class . '">';
							$html .= '<thead>';
							$html .= '<tr>';
							$html .= '<th style="' . $td_class . '"></th><th style="' . $td_class . '">' . 'Doctor Reference' . '</th>';
							$html .= '<th style="' . $td_class . '">' . 'Lawyer Reference' . '</th>';
							$html .= '<th style="' . $td_class . '">' . 'Native Reference' . '</th>';
							$html .= '</tr>';
							$html .= '</thead><tbody>';

							foreach ($referenceArray as $keylabel => $reference) {

								$html .= '<tr>';
								$html .= '<td style="' . $td_class . '" width="21.33%">' . $keylabel . '</td>';
								foreach ($reference as $reference1) {
									if (isset($reference1)) {
										$html .= '<td style="' . $td_class . '" width="21.33%">' . $reference1 . '</td>';
									}
								}
								$html .= '</tr>';
							}
							$html .= '</tbody></table>';
						}

					} else if ($key == "customer_general_information") {
						$html .= '<div style="' . $tb_heading . '">' . $dataSection[$key]["heading"] . '</div>';
						$html .= '<table border="0" cellspacing="0" width="100%" style="' . $table_class . '">';
						foreach ($value as $field) {
							//$html .= $index;
							$fieldName = $field->field;
							$html .= '<tr style="font-weight:bold;' . $td_class . '"><td>' . $field->label . '</td></tr>';
							$html .= '<tr>';
							$html .= '<td style="' . $td_class . '" width="21.33%">' . $data[$key]->$fieldName . '</td>';
							$html .= '</tr>';
						}
						$html .= '</table>';
					}

				}
				$pdf = App::make('dompdf');
				$pdf->loadHTML($html);
				$pdfName = $application_no . '_' . strtotime(Carbon::now());
				$pdf->save(public_path() . '/application_forms/application_' . $pdfName . '.pdf')->stream('download.pdf');
				$savePdf = Application_Pdf::create(['user_id' => $user_id, 'application_no' => $application_no, 'path' => 'application_' . $pdfName . '.pdf']);
		}
			$message = 'Information Has been successfully updated';
			return ['status' => $status, 'message' => $message];
		}
//		dd($residenceArray);
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
			$property_id = DB::table('customer_property_application')->where('application_no','=',$id)->pluck('property_id');
			return view('register.register', compact('data', 'dataMap', 'dataSection', 'id','property_id'));
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
