<?php namespace App\Http\Controllers\Tenant;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Tenant\WorkOrder;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;

class WorkorderController extends Controller {

	public function index(){
        $workorders = WorkOrder::orderBy('id','desc')->get();
        return view('tenant.workorders',compact('workorders'));
    }

    public function newWorkOrder(){
        $categories = DB::table('work_order_category')->lists('category','category');
        return view('tenant.workorder',compact('categories'));
    }

    public function create(){
        $workorder = WorkOrder::create(['property_id'=> Input::get('property_id'),'request_category' => Input::get('request_category'),'phone'=> Input::get('phone'),'visit_hours' => Input::get('visit_hours'),'work_description' => Input::get('work_description'),'file_links' => serialize(Input::get('file_links')),'status' => 'new']);
        if($workorder->id)
            return redirect()->back()->with('flash_success','Your Work Order has been submitted successfully');
        else
            return redirect()->back()->with('flash_warning','Error was encountered, please contact administrator');
    }

    public function show($id){
        $workorder = WorkOrder::where('id','=',$id)->first();
        $workorder_logs = DB::table('work_order_log')->where('workorder_id','=',$id)->select('status','comment','updated_at')->get();
        $status = DB::table('work_order_status')->lists('status','status');
        return view('tenant.workorder-show',compact('workorder','status','workorder_logs'));
    }

    public function upload()
    {
        $currentTime = date("YmdHis");
        $user_id = Auth::user()->id;
        $file = Input::file('file');
        $fileName = $file->getClientOriginalName();
        $uploadSuccess = $file->move(public_path().'/uploads/tenants/workorders/', $currentTime.'_'.$fileName);

        if( $uploadSuccess ) {
            return ['status' => 'success','filelink' => '/uploads/tenants/workorders/'.$currentTime.'_'.$fileName];
        } else {
            return ['status', 'failed'];
        }
    }

}
