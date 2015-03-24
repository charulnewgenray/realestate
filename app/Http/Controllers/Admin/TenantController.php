<?php namespace App\Http\Controllers\Admin;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;

class TenantController extends Controller {

    /**  get active tenants **/
	public function active(){
        $tenants = [];
        // get user id whose role is tenant
        $tenantId = DB::table('roles')->select('id')->where('name','=','Tenant')->first();
        $tenants = DB::table('users')->join('assigned_roles', 'users.id', '=', 'assigned_roles.user_id')
                                    ->join('customer_property_application', 'users.id', '=', 'customer_property_application.user_id')
                                    ->where('assigned_roles.role_id','=',$tenantId->id)
                                    ->where('users.status','=',1)
                                    ->where('customer_property_application.status','=','Completed')
                                    ->get();
        $type = 'active';
        return view('admin.list',compact('tenants','type'));
    }
    /**  get inactive tenants **/
    public function pending(){
        $tenants = DB::table('customer_property_application')->where('status','=','Approved')->get();
       $type = 'pending';
        return view('admin.pending-list',compact('tenants','type'));
    }
    /**  get canceled tenants **/
    public function canceled(){
        $tenants = [];
        $type = 'canceled';
        return view('admin.list',compact('tenants','type'));
    }

    public function activeinfo($id){
        return view('admin.active-info');
    }
    public function pendinginfo($id){
        $applicationInfo = DB::table('customer_property_application')->where('application_no','=',$id)->first();
        return view('admin.pending-info',compact('applicationInfo'));
    }
    public function pendingpost(){
        $applicant_email = Input::get('applicant_email');
        $data = Input::except('_token','applicant_email');
//        if($applicant_email){
//            $user = DB::table('users')->insert(['name' => '', 'email' => $applicant_email, 'password' => Hash::make(rand(3,5))]);
//            $lastInsertedId = $user->id;
//            var_dump($lastInsertedId);
//            die;
//        }
        $data['start_date'] = date('Y-m-d H:i:s',strtotime($data['start_date']));
        $data['end_date'] = date('Y-m-d H:i:s',strtotime($data['end_date']));
        DB::table('lease_documents_pdfs')->insert($data);
        return redirect()->route('admin.tenant.pendinginfo',['id'=>$data['application_no']]);
    }
    public function canceledinfo(){
        return view('admin.canceled-info');
    }

}
