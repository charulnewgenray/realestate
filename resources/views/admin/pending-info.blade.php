@extends('admin.app')
@section('content')
    <div class="row">
        <div class="col-sm-12">
            <h4>Pending Application</h4>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="portlet-body form">
            {!! Form::open(array('method'=>'post','class'=> 'form-horizontal','url' => route('admin.tenant.pendingpost'))) !!}
                <input type="hidden" name="applicant_email" value="{{$applicationInfo->applicant_email}}">
                <input type="hidden" name="application_no" value="{{$applicationInfo->application_no}}">
                <input type="hidden" name="user_id" value="{{$applicationInfo->user_id}}">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label class="control-label col-md-4">Lease Start Date</label>
                        <div class="col-md-6">
                            <input type="text" name="start_date" value="" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4">Lease End Date</label>
                        <div class="col-md-6">
                            <input type="text" name="end_date" value="" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4">Upload Lease Documents</label>
                        <div class="col-md-6">
                            <input type="file" name="path" value="" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="row">


                        <div class="col-md-offset-2 col-md-10">
                            <button class="btn green" type="submit">Submit</button>
                        </div>

                </div>
            {!! Form::close() !!}
        </div>
    </div>

@endsection