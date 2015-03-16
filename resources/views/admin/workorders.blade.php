@extends('admin.app')

@section('content')
    <!-- BEGIN PAGE CONTENT-->
    <div class="row">
        <div class="col-md-12">
            <!-- Begin: life time stats -->
            <div class="portlet  box blue">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-shopping-cart"></i>Work Orders
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-advance table-hover">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Property</th>
                                    <th>Category</th>
                                    <th>Phone</th>
                                    <th>Description</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($workorders as $workorder)
                                    <tr>
                                        <td>{{$workorder->id}}</td>
                                        <td>{{$workorder->property_id}}</td>
                                        <td>{{$workorder->request_category}}</td>
                                        <td>{{$workorder->phone}}</td>
                                        <td>{{$workorder->work_description}}</td>
                                        <td>{{$workorder->status}}</td>
                                        <td><a href="{{route('admin.workorders.show',$workorder->id)}}">View</a></td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- End: life time stats -->
        </div>
    </div>
    <!-- END PAGE CONTENT-->
@endsection