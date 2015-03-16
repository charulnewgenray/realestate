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
                    {!! Form::open(array('route' => 'tenant.workorders.create', 'method' => 'post', 'class' => 'form-horizontal'))!!}
                        <div class="form-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {!! Form::label('Select Property','',array('class' => 'control-label col-md-4')) !!}
                                        <div class="col-md-8">
                                            {!! Form::select('property_id', array('1' => 'Flat 1', '2' => 'Flat 2'), '1',array('class' => 'form-control' , 'required' => 'required')) !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {!! Form::label('Request Category','',array('class' => 'control-label col-md-4')) !!}
                                        <div class="col-md-8">
                                            {!! Form::select('request_category', array('' => '','1' => 'Electricity', '2' => 'Plumbing','3' => 'Kitchen'), '',array('class' => 'form-control','required' => 'required')) !!}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {!! Form::label('Call back Phone','',array('class' => 'control-label col-md-4')) !!}
                                        <div class="col-md-8">
                                            {!! Form::text('phone','',array('class' => 'form-control','required' => 'required')) !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {!! Form::label('Visiting Hours','',array('class' => 'control-label col-md-4')) !!}
                                        <div class="col-md-8">
                                            {!! Form::text('visit_hours','',array('class' => 'form-control', 'placeholder' => '11:00AM - 4:00 PM','required' => 'required')) !!}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        {!! Form::label('Description of Work','',array('class' => 'control-label col-md-2')) !!}
                                        <div class="col-md-10">
                                            {!! Form::textarea('work_description','',array('class' => 'form-control')) !!}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        {!! Form::label('Upload Images','',array('class' => 'control-label col-md-2')) !!}
                                        <div class="col-md-10">
                                            <div id="my-dropzone" class="dropzone" name="images">
                                            </div>
                                            <div class="filelinks"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-offset-2 col-md-10">
                                    {!!Form::submit('Submit!', array('class' => 'btn green')) !!}
                                </div>
                            </div>
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