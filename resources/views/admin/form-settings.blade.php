@extends('admin.app')

@section('content')
    <div class="row">
        {{-- */$tablecount = 0;/* --}}
        @foreach($tableList as $key=>$table)
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-gift"></i>{{$table->table_heading}}
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse" data-original-title="" title=""></a>
                    </div>

                </div>
                <div class="portlet-body form">
                    {!! Form::open(array('method'=>'post','class'=> 'horizontal-form','url' => route('admin.form.postsettings'))) !!}
                    <input type="hidden" name="table_name" value="{{$table->table_name}}_map">
                    <div class="form-body">
                        <div class="table_fields" data-tableid="{{$tablecount}}">
                            @foreach($tableMap[$table->table_name] as $key=>$map)
                                <div class="row"  data-rowid="{{$key}}">
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <select class="form-control input-sm" name="row[{{$key}}][type]">
                                                <option {{{ $map->type == "text" ? 'Selected' : '' }}} value="text">Text</option>
                                                <option {{{ $map->type == "textarea" ? 'Selected' : '' }}} value="textarea">Textarea</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <input type="hidden" name="row[{{$key}}][meta]" value="{{$map->meta}}">
                                        <input type="text" id="name" name="row[{{$key}}][field]" value="{{$map->field}}" class="form-control input-sm" placeholder="name">
                                    </div>
                                    <div class="col-xs-2">
                                        <input type="text" id="label" name="row[{{$key}}][label]" value="{{$map->label}}" class="form-control input-sm" placeholder="label">
                                    </div>
                                    <div class="col-xs-1">
                                        <div class="">
                                            <input class="input-sm" type="checkbox" value="{{$map->required}}" name="row[{{$key}}][required]">
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
										<span class="input-group-btn">
											<button type="button" class="btn red editable-cancel delete" data-deleteid="{{$tablecount}}" data-field="{{$key}}" ><i class="fa fa-times"></i></button>
										</span>
                                    </div>
                                </div>



                            @endforeach
                        </div>
                        <div class="form-actions">
                            <a class="btn green add_field" data-id="{{$tablecount}}">Add</a>
                            <button type="submit" class="btn purple">Update</button>
                        </div>
                    </div>
                    {!! Form::close()!!}
                </div>
            </div>
            {{-- */$tablecount++;/* --}}
        @endforeach

</div>
@endsection
@section('page-scripts')
    <script>
        $(document).ready(function(){
            $(document).on('click','.delete',function(){
                var tableid = $(this).data('deleteid');
                var rowid = $(this).data('field');
                //console.log(tableid);
                $("[data-tableid='" + tableid + "']").find("[data-rowid='" + rowid + "']").remove();
            });
            $('.add_field').on('click',function(){
                var id = $(this).data('id');
                if($("[data-tableid='" + id + "'] .row").last().data('rowid')){
                    var nextId = parseInt($("[data-tableid='" + id + "'] .row").last().data('rowid')) + 1;
                }else{
                    var nextId = 1;
                }
                var html = '<div class="row" data-rowid="'+nextId+'"><div class="col-xs-2"><div class="form-group">' +
                        '<select class="form-control input-sm" name="row['+nextId+'][type]"><option  value="text">Text</option><option value="textarea">Textarea</option><option value="hidden">Hidden</option></select></div></div>'+
                        '<div class="col-xs-2"><input type="hidden" name="row['+nextId+'][meta]" value="1"><input type="text"  name="row['+nextId+'][field]" value="" class="form-control input-sm" placeholder="name"></div>'+
                        '<div class="col-xs-2"><input type="text"  name="row['+nextId+'][label]" value="" class="form-control input-sm" placeholder="label"></div>'+
                        '<div class="col-xs-1"><div class=""><input class="input-sm" type="checkbox" value="" name="row['+nextId+'][required]"></div>'+
                        '</div>' +
                        '<div class="col-xs-2">' +
                        '<span class="input-group-btn"><button class="btn red editable-cancel delete" data-deleteid="'+id+'" data-field="'+nextId+'" type="button"><i class="fa fa-times"></i></button></span>' +
                        '</div>' +
                        '</div>';

                $("[data-tableid='" + id + "']").append(html);
            });
        });
    </script>
@endsection