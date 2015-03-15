@extends('admin.app')

@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="tabbable tabbable-custom">
                <ul class="nav nav-tabs">
                   @foreach($applications as $key => $application)
                        <li @if($key==0) class="active" @endif>
                            <a href="#tab-{{$application->tenant_meta_key}}" data-toggle="tab">
                                {{ucwords(str_replace('-',' ',$application->tenant_meta_key))}} </a>
                        </li>
                        {{--<li>
                            <a href="#tab_1_3" data-toggle="tab">
                                Simple Line Icons </a>
                        </li>
                        <li>
                            <a href="#tab_1_2" data-toggle="tab">
                                Glyphicons </a>
                        </li>--}}
                   @endforeach
                </ul>
                <div class="tab-content">
                    @foreach($applications as $key => $application)
                        <div class="tab-pane @if($key==0) active @endif fontawesome-demo" id="tab-{{$application->tenant_meta_key}}">
                            {{--{{unserialize($application->tenant_meta_value)}}--}}
                        </div>
                    @endforeach

                </div>
            </div>
        </div>
    </div>
@endsection