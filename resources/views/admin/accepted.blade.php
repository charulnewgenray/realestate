@extends('admin.app')

@section('content')
    <!-- BEGIN PAGE CONTENT-->
    <div class="row">
        <div class="col-sm-12">
			<h4>Load Accepted Application</h4>
		</div>
	</div>
	<hr>
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>Application No.</th>
					<th>Applicant</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody class="applicant-data">
				@foreach($acceptedApplication as $accepted)
				<tr>
					<td>{{$accepted->application_no}}</td>
					<td>{{$accepted->applicant_email}}</td>
					<td><a href="{{route('admin.applications.showapplication',['id'=>$accepted->application_no])}}">Load</a></td>
				</tr>
				@endforeach
			</tbody>
		</table>
	</div>
    <!-- END PAGE CONTENT-->
@endsection