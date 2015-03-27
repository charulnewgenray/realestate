@extends('admin.app')
@section('content')
    <div class="row">
        <div class="col-sm-12">
            <h4>Tenant Information</h4>
        </div>
    </div>
    <hr>
    <div class="row">
        <form action="#" class="form-horizontal">
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="control-label col-md-4">Lease Started Date</label>
                        <div class="col-md-8">
                            <p class="form-control-static">This is the date</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="control-label col-sm-4">Lease End Date</label>
                        <div class="col-sm-8">
                            <p class="form-control-static">This is the date</p>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label class="control-label">Lease Documents</label>
                        </div>
                    </div>
                    @foreach($leaseDocuments as $key => $leaseDocument)
                        <div class="col-sm-12">
                            <label class="col-md-1 control-label"><?php echo $key+1;?></label>
                            <div class="col-md-6">
                                <p class="form-control-static"><a href="/{{$leaseDocument->path}}">{{$leaseDocument->path}}</a></p>
                                <!--<label class="control-label col-md-6">{{$leaseDocument->path}}</label>-->
                            </div>
                        </div>
                    @endforeach
                </div>
                <div class="col-sm-6">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label class="control-label">Application Pdf</label>
                        </div>
                    </div>
                    @foreach($applicationDocuments as $key => $applicationDocument)
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label class="col-md-1 control-label"><?php echo $key+1;?></label>
                            <div class="col-md-6">
                                <p class="form-control-static"><a href="/application_forms/{{$applicationDocument->path}}">{{$applicationDocument->path}}</a></p>
                                <!--<label class="control-label col-md-6">{{$applicationDocument->path}}</label>-->
                            </div>
                        </div>
                    </div>
                    @endforeach

                </div>

            </div>
        </form>

    </div>

@endsection