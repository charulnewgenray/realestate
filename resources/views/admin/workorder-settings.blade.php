@extends('admin.app')

@section('content')
    <div class="row">
        <div class="col-md-6 ">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption">
                        Work Order Categories
                    </div>
                </div>

                <div class="portlet-body form">
                    {!! Form::open(array('route' => 'admin.workorder.settingsupdate', 'method' => 'post'))!!}
                    {!! Form::hidden('setting_code','category')!!}
                    <div class="form-body">
                        <div id="categories">
                            @foreach($categories as $key => $categorie)
                                <div class="row" data-category="{{$key}}">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <input type="text" name="category[]" value="{{$categorie}}" class="form-control">
                                                <span class="input-group-btn">
                                                    <button type="button" class="btn red editable-cancel delete" data-category="{{$key}}"><i class="fa fa-times"></i></button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                        <div class="form-actions">
                            <a id="add-category" class="btn green">Add</a>
                            <button type="submit" class="btn blue">Update</button>
                        </div>
                    </div>
                    {!! Form::close()!!}
                </div>
            </div>
        </div>
        <div class="col-md-6 ">
            <div class="portlet box purple">
                <div class="portlet-title">
                    <div class="caption">
                        Work Order Status Codes
                    </div>
                </div>

                <div class="portlet-body form">
                    {!! Form::open(array('route' => 'admin.workorder.settingsupdate', 'method' => 'post'))!!}
                    {!! Form::hidden('setting_code','status')!!}
                    <div class="form-body">
                        <div id="status">
                            @foreach($status as $key => $code)
                                <div class="row" data-status="{{$key}}">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <input type="text" name="status[]" value="{{$code}}" class="form-control">
                                                <span class="input-group-btn">
                                                    <button type="button" class="btn red editable-cancel delete" data-status="{{$key}}"><i class="fa fa-times"></i></button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                        <div class="form-actions">
                            <a id="add-status" class="btn green">Add</a>
                            <button type="submit" class="btn purple">Update</button>
                        </div>
                    </div>
                    {!! Form::close()!!}
                </div>
            </div>
        </div>
    </div>
@endsection
@section('page-scripts')
    <script>
        $(document).ready(function(){
            $(document).on('click','.delete',function(){
                var id = $(this).data('category');
                $('#categories').find("[data-category='" + id + "']").remove();
            });
            $('#add-category').on('click',function(){
                var nextId = parseInt($('#categories .row').last().data('category')) + 1;
                var html = ' <div class="row" data-category="'+nextId+'"> <div class="col-sm-12"><div class="form-group"> <div class="input-group">'+
                        '<input type="text" name="category[]" value="" class="form-control"><span class="input-group-btn">'+
                        '<button type="button" class="btn red editable-cancel delete" data-category="'+nextId+'"><i class="fa fa-times"></i></button>'+
                        '</span></div></div></div></div>';

                $('#categories').append(html);
            });
            /* Status code*/
            $(document).on('click','.delete',function(){
                var id = $(this).data('status');
                $('#status').find("[data-status='" + id + "']").remove();
            });
            $('#add-status').on('click',function(){
                var nextId = parseInt($('#status .row').last().data('status')) + 1;
                var html = ' <div class="row" data-status="'+nextId+'"> <div class="col-sm-12"><div class="form-group"> <div class="input-group">'+
                        '<input type="text" name="status[]" value="" class="form-control"><span class="input-group-btn">'+
                        '<button type="button" class="btn red editable-cancel delete" data-status="'+nextId+'"><i class="fa fa-times"></i></button>'+
                        '</span></div></div></div></div>';

                $('#status').append(html);
            });
        });
    </script>
@endsection