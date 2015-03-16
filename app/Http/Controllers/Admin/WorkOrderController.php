<?php namespace App\Http\Controllers\Admin;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Admin\WorkOrderLog;
use App\Models\Tenant\WorkOrder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;

class WorkOrderController extends Controller {

    public function index(){
        $workorders = WorkOrder::orderBy('id','desc')->get();
        return view('admin.workorders',compact('workorders'));
    }

    public function newWorkOrder(){
        return view('admin.workorder');
    }

    public function create(){
        /*dd(Input::all());*/
        WorkOrder::create(['property_id'=> Input::get('property_id'),'request_category' => Input::get('request_category'),'phone'=> Input::get('phone'),'visit_hours' => Input::get('visit_hours'),'work_description' => Input::get('work_description'),'file_links' => serialize(Input::get('file_links')),'status' => 'submited']);
    }

    public function show($id){
        $workorder = WorkOrder::where('id','=',$id)->first();
        $workorder_logs = DB::table('work_order_log')->where('workorder_id','=',$id)->select('status','comment','updated_at')->get();
        $status = DB::table('work_order_status')->lists('status','status');
        return view('admin.workorder-show',compact('workorder','status','workorder_logs'));
    }

    public function updateWorkorder(){
        if(Input::get('comment'))
            WorkOrderLog::create(['workorder_id' => Input::get('workorder_id') , 'comment' => Input::get('comment') ,'status' => Input::get('status')]);
        DB::table('work_order')->where('id','=',Input::get('workorder_id'))->update(['status' => Input::get('status')]);

        return redirect()->back()->withSuccess(['message' => 'Successfully updated the work order']);
    }

    public function settings(){
        $categories = DB::table('work_order_category')->lists('category','category');
        $status = DB::table('work_order_status')->lists('status','id');
        return view('admin.workorder-settings',compact('categories','status'));
    }
    public function updateSettings(){
        if(Input::get('setting_code') == 'category'){
            $arraycat = array();
            foreach(Input::get('category') as $key => $value){
                $array['category'] = $value;
                $arraycat[] = $array;
            }
            DB::table('work_order_category')->truncate();
            DB::table('work_order_category')->insert($arraycat);
        }
        elseif(Input::get('setting_code') == 'status'){
            $arraystatus = array();
            foreach(Input::get('status') as $key => $value){
                $array['status'] = $value;
                $arraystatus[] = $array;
            }
            DB::table('work_order_status')->truncate();
            DB::table('work_order_status')->insert($arraystatus);
        }
        return redirect()->back()->withSuccess('Updated successfully.');
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
