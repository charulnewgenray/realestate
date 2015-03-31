@extends('admin.app')
@section('content')
    <div class="row">
        <div class="col-sm-6">
            <h4>Tenant Information</h4>
        </div>
        <div class="col-sm-6">
            <div class="pull-right">
                <button class="btn btn-sm red filter-cancel" id="application_inactive"></i>In Active</button>
                <button class="btn btn-sm red filter-cancel" id="application_cancel">Cancel</button>
            </div>
        </div>
    </div>
    <hr>
    <div class="row">
        {!! Form::open(array('method'=>'post','class'=> 'form-horizontal','url' => route('admin.tenant.postChangeStatus'), 'id'=>'tenant_form')) !!}
        <input type="hidden" name="inactive" value="" id="inactive"/>
        <input type="hidden" name="cancel" value="" id="cancel"/>
        <input type="hidden" name="application_no" value="{{$id}}" id="application_no"/>
            <div class="row">
                <div class="col-sm-6">
                    <div class="col-sm-12">
                        <h4>Lease History</h4>
                    </div>
                    <hr>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-12">Lease Start Date</label>
                            <p class="col-sm-12">{{$leaseAgreement->start_date}}</p>
                        </div>

                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-12">Lease End Date</label>
                            <p class="col-sm-12">{{$leaseAgreement->end_date}}</p>
                        </div>
                    </div>
                    @foreach($leaseDocuments as $key => $leaseDocument)
                        <div class="col-sm-12">
                            <label class="col-sm-1 control-label"><?php echo $key+1;?>.</label>
                            <div class="col-sm-6">
                                <p class="form-control-static"><a target="_blank" href="/{{$leaseDocument->path}}">{{$leaseDocument->path}}</a></p>
                                <!--<label class="control-label col-md-6">{{$leaseDocument->path}}</label>-->
                            </div>
                        </div>
                    @endforeach
                </div>
                <div class="col-sm-6">
                    <div class="col-sm-12">
                        <h4>Application History</h4>
                    </div>
                    <hr>
                    <div class="col-sm-12">
                        <h5>Below are the application form's pdf that are submitted from registration form.</h5>
                    </div>
                    @foreach($applicationDocuments as $key => $applicationDocument)
                    <div class="col-sm-12">
                        <label class="col-sm-1 control-label"><?php echo $key+1;?>.</label>
                        <div class="col-sm-6">
                            <p class="form-control-static"><a target="_blank" href="/application_forms/{{$applicationDocument->path}}">{{$applicationDocument->path}}</a></p>
                            <!--<label class="control-label col-md-6">{{$applicationDocument->path}}</label>-->
                        </div>
                    </div>
                    @endforeach
                </div>

            </div>

        {!! Form::close() !!}

    </div>

@endsection

@section('page-scripts')
    <script>
        $(document).ready(function(){
            $('#application_inactive').click(function(e){
                $('#inactive').val(1);
                $('#cancel').val(0);
                $('#tenant_form').submit();
            });
            $('#application_cancel').click(function(e){
                $('#cancel').val(1);
                $('#inactive').val(0);
                $('#tenant_form').submit();
            });
        });
    </script>
@endsection