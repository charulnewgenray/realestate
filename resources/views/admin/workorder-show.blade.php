@extends('admin.app')

@section('content')
    <!-- BEGIN PAGE CONTENT-->
    <div class="row">
        <div class="col-md-12">
            <!-- Begin: life time stats -->
            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-shopping-cart"></i>Work Orders
                    </div>
                </div>
                <div class="portlet-body form">
                    {!! Form::open(array('route' => 'tenant.workorder.update', 'method' => 'post', 'class' => 'form-horizontal'))!!}
                        {!! Form::hidden('workorder_id',$workorder->id)!!}
                        <div class="form-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {!! Form::label('Property','',array('class' => 'control-label col-xs-4')) !!}
                                        <div class="col-xs-8">
                                            <p class="form-control-static">{{$workorder->property_id}}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {!! Form::label('Category','',array('class' => 'control-label col-xs-4')) !!}
                                        <div class="col-xs-8">
                                            <p class="form-control-static">{{$workorder->request_category}}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {!! Form::label('Phone','',array('class' => 'control-label col-xs-4')) !!}
                                        <div class="col-xs-8">
                                            <p class="form-control-static">{{$workorder->phone}}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {!! Form::label('Visiting Hours','',array('class' => 'control-label col-xs-4')) !!}
                                        <div class="col-xs-8">
                                            <p class="form-control-static">{{$workorder->phone}}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        {!! Form::label('Description of Work','',array('class' => 'control-label col-md-2')) !!}
                                        <div class="col-md-10">
                                            <p class="form-control-static">{{$workorder->work_description}}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row well">
                                <h4>Work history</h4>
                                @foreach($workorder_logs as $workorder_log )
                                    <div class="col-xs-2">{{$workorder_log->updated_at}}</div>
                                    <div class="col-xs-2">{{$workorder_log->status}}</div>
                                    <div class="col-xs-8">{{$workorder_log->comment}}</div>
                                @endforeach
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        {!! Form::label('Update Status','',array('class' => 'control-label col-md-2')) !!}
                                        <div class="col-md-10">
                                            {!! Form::select('status', $status, $workorder->status,array('class' => 'form-control' , 'required' => 'required')) !!}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        {!! Form::label('Comment','',array('class' => 'control-label col-md-2')) !!}
                                        <div class="col-md-10">
                                            {!! Form::textarea('comment','',array('class' => 'form-control' , 'required' => 'required')) !!}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-offset-2 col-md-10">
                                    <button type="submit" class="btn yellow">Update</button>
                                </div>
                            </div>
                            @if(unserialize($workorder->file_links))
                            <div class="row">
                                <div class="col-md-12">
                                    <br><br>
                                   <h4>Uploaded Images</h4>
                                    <hr>
                                </div>
                                <div class="col-md-12">
                                    @foreach(unserialize($workorder->file_links) as $filelink)
                                        <div class="col-md-4">
                                            <a href="{{$filelink}}"><img src="{{$filelink}}" class="img-responsive"></a>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                            @endif
                        </div>
                    {!! Form::close()!!}

                </div>
            </div>
            <!-- End: life time stats -->
        </div>
    </div>
    <!-- END PAGE CONTENT-->
@endsection