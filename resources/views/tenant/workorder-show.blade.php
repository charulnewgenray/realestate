@extends('tenant.app')

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
                    {!! Form::open(array('route' => 'tenant.workorders.create', 'method' => 'post', 'class' => 'form-horizontal'))!!}
                        <div class="form-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {!! Form::label('Select Property','',array('class' => 'control-label col-md-4')) !!}
                                        <div class="col-md-8">
                                            <p class="form-control-static">{{$workorder->property_id}}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {!! Form::label('Request Category','',array('class' => 'control-label col-md-4')) !!}
                                        <div class="col-md-8">
                                            <p class="form-control-static">{{$workorder->request_category}}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {!! Form::label('Call back Phone','',array('class' => 'control-label col-md-4')) !!}
                                        <div class="col-md-8">
                                            <p class="form-control-static">{{$workorder->phone}}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {!! Form::label('Visiting Hours','',array('class' => 'control-label col-md-4')) !!}
                                        <div class="col-md-8">
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
                            @if(unserialize($workorder->file_links))
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        {!! Form::label('Uploaded Images','',array('class' => 'control-label col-md-2')) !!}
                                        <div class="col-md-10">
                                            @foreach(unserialize($workorder->file_links) as $filelink)
                                                <img src="{{$filelink}}" class="img-responsive">
                                                <br>
                                            @endforeach
                                        </div>
                                    </div>
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
@section('page-scripts')
    <script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
    <link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
    <script>
        jQuery(document).ready(function(){
            Dropzone.autoDiscover = false;
            var myDropzone = new Dropzone("#my-dropzone",{url: "{{route('tenant.workorders.image')}}"});
            myDropzone.on("sending",function(file, xhr, formData){
                formData.append('_token',jQuery('input[name="_token"]').val());
            });
            myDropzone.on("success",function(file, response){
                console.log(response);
                if(response.status == 'success'){
                    jQuery('.filelinks').append('<input type="hidden" name="file_links[]" value="'+response.filelink+'">')
                }
            });
            myDropzone.on("addedfile", function(file) {
                var removeButton = Dropzone.createElement('<a class="dz-remove">Remove file</a>');
                var _this = this;
                removeButton.addEventListener("click", function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    var fileInfo = new Array();
                    fileInfo['name']=file.name;
                    $.ajax({
                        type: "POST",
                        url: "{{ url('/delete-image') }}",
                        data: {file: file.name},
                        beforeSend: function () {
                            // before send
                        },
                        success: function (response) {

                            if (response == 'success')
                                alert('deleted');
                        },
                        error: function () {
                            alert("error");
                        }
                    });
                    _this.removeFile(file);
                });
                file.previewElement.appendChild(removeButton);
            });
        });

    </script>
@endsection