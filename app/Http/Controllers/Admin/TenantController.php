<?php namespace App\Http\Controllers\Admin;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpFoundation\File\UploadedFile;
class TenantController extends Controller {

    /**  get active tenants **/
	public function active(){
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
        $leaseDocuments = DB::table('lease_documents_pdfs')->where('user_id','=',$id)->get();
        $applicationDocuments = DB::table('application_pdfs')->where('user_id','=',$id)->get();
        return view('admin.active-info',compact('leaseDocuments','applicationDocuments'));
    }
    public function pendinginfo($id){
        $applicationInfo = DB::table('customer_property_application')->where('application_no','=',$id)->first();
        return view('admin.pending-info',compact('applicationInfo'));
    }
    public function pendingpost(){

        $applicant_email = Input::get('applicant_email');
        $data = Input::except('_token','applicant_email');
//        dd($_SERVER['HTTP_HOST']);
        if($applicant_email){
            // find in users table that email is exist or not
            $findApplicant = DB::table('users')->where('email','=',$applicant_email)->first();

            $tenantRoleId = DB::table('roles')->select('id')->where('name','=','Tenant')->first();

            if($findApplicant){

                // find the exist email that this email user is tenant or not
                if($tenantRoleId){

                    // find in the assigned role table that the user is already a tenant
                    $isUserTenant = DB::table('assigned_roles')->where('user_id','=',$findApplicant->id)
                                                                ->where('role_id','=',$tenantRoleId->id)->first();
                    if($isUserTenant==NULL){
                        // set the role of users to tenant
                        DB::table('assigned_roles')->insert(['user_id'=>$findApplicant->id,'role_id'=>$tenantRoleId->id]);
                        DB::table('customer_property_application')->where('applicant_email','=',$applicant_email)->update(['user_id'=>$findApplicant->id,'status'=>'Completed']);
                    }else{
                        DB::table('customer_property_application')->where('applicant_email','=',$applicant_email)->update(['user_id'=>$findApplicant->id,'status'=>'Completed']);
                    }
                    $user_id = $findApplicant->id;
                }
            }else{
                $password = Hash::make(rand(3,5));
                $user = DB::table('users')->insert(['name' => '', 'email' => $applicant_email, 'password' => $password]);
                // mail coding for sending the password to the applicant
                $lastInsertedUserId = DB::getPdo()->lastInsertId();
                if($lastInsertedUserId){
                    DB::table('assigned_roles')->insert(['user_id'=>$lastInsertedUserId,'role_id'=>$tenantRoleId->id]);
                    DB::table('customer_property_application')->where('applicant_email','=',$applicant_email)->update(['user_id'=>$lastInsertedUserId,'status'=>'Completed']);
                    $user_id = $lastInsertedUserId;
                }

            }
            // update the status and user id in customer_property_application
            if($_FILES){
                $data['start_date'] = date('Y-m-d H:i:s',strtotime($data['start_date']));
                $data['end_date'] = date('Y-m-d H:i:s',strtotime($data['end_date']));
                $rand = rand(0000,9999);
                $destinationPath = 'leasedocuments'.'/'.$rand.'_'.$_FILES['file']['name'];
                move_uploaded_file($_FILES['file']['tmp_name'],$destinationPath);
                DB::table('lease_documents_pdfs')->insert(['user_id'=>$user_id,'application_no'=>Input::get('application_no'),'path'=>$destinationPath,'start_date'=>$data['start_date'],'end_date'=>$data['end_date']]);
            }

        }
        return redirect()->route('admin.tenant.pendinginfo',['id'=>$data['application_no']]);
    }
    public function canceledinfo(){
        return view('admin.canceled-info');
    }

}
