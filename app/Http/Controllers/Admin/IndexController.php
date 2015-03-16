<?php namespace App\Http\Controllers\Admin;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Tenant\WorkOrder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class IndexController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	protected $workorder;

	public function __construct(){
		$this->workorder = WorkOrder::where('status','=','new')->count();
	}

	public function index()
	{
		return view('admin.dashboard');
	}

	public function getNewWorkorders(){
		return $this->workorder;
	}


}
