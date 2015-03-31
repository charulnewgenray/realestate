@extends('admin.app')
@section('content')
    <div class="row">
        <div class="col-sm-12">
            <h4>Canceled Application</h4>
        </div>
    </div>
    <hr>
    <div class="form-horizontal">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label class="control-label col-xs-4" for="Property">Applicant No.</label>
                    <div class="col-xs-8">
                        <p class="form-control-static">{{$applicationInfo->application_no}}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-xs-4" for="Property">Status.</label>
                    <div class="col-xs-8">
                        <p class="form-control-static">{{$applicationInfo->status}}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="control-label col-xs-4" for="Property">Applicant Email</label>
                    <div class="col-xs-8">
                        <p class="form-control-static">{{$applicationInfo->applicant_email}}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-xs-4" for="Property">Date of Canceled</label>
                    <div class="col-xs-8">
                        <p class="form-control-static">{{$applicationInfo->updated_at}}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection