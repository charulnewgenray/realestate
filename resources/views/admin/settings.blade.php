@extends('admin.app')

@section('content')
    <div class="row">
        <div class="col-md-6 ">
            <div class="portlet box purple">
                <div class="portlet-title">
                    <div class="caption">
                        Customer Application Status Codes
                    </div>
                </div>

                <div class="portlet-body form">
                    {!! Form::open(array('route' => 'admin.general.updates', 'method' => 'post'))!!}
                    {!! Form::hidden('setting_code','status')!!}
                    <div class="form-body">
                        <div id="status">

                            @foreach($statuses as $key => $status)
                                <div class="row" data-status="{{$key}}">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            @if(in_array($status->status,$fixedStatusCode))
                                                <p class="form-control static">{{$status->status}}</p>
                                                <input type="hidden" name="status[]" value="{{$status->status}}" class="form-control">
                                            @else
                                                <div class="input-group">
                                                    <input type="text" name="status[]" value="{{$status->status}}" class="form-control">
                                                <span class="input-group-btn">
                                                    <button type="button" class="btn red editable-cancel delete" data-status="{{$key}}"><i class="fa fa-times"></i></button>
                                                </span>
                                                </div>
                                            @endif
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