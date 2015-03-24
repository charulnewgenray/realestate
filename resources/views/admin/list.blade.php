@extends('admin.app')

@section('content')
    <!-- BEGIN PAGE CONTENT-->
    <div class="row">
        <div class="col-sm-12">
            @if($type == "active")
                <h4>List of In Active Tenants</h4>
            @elseif($type == "pending")
                <h4>List of In Pending Tenants</h4>
            @elseif($type == "canceled")
                <h4>List of In Canceled Tenants</h4>
            @endif
        </div>
    </div>
    <hr>
    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>Application No.</th>
                <th>Name</th>
                <th>Email</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody class="applicant-data">
            @foreach($tenants as $tenant)
                <tr>
                    <td>{{$tenant->application_no}}</td>
                    <td>{{$tenant->name}}</td>
                    <td>{{$tenant->email}}</td>
                    <td>{{$tenant->status}}</td>
                    @if($type == "active")
                        <td><a href="{{route('admin.tenant.activeinfo',['id'=>$tenant->user_id])}}">View</a></td>
                    @elseif($type == "pending")
                        <td><a href="{{route('admin.tenant.pendinginfo',['id'=>$tenant->application_no])}}">View</a></td>
                    @elseif($type == "canceled")
                        <td><a href="{{route('admin.tenant.canceledinfo',['id'=>$tenant->application_no])}}">View</a></td>
                    @endif

                </tr>
            @endforeach
            </tbody>
        </table>
    </div>
    <!-- END PAGE CONTENT-->
@endsection