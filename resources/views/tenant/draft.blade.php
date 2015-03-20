@extends('tenant.app')

@section('content')
    <!-- BEGIN PAGE CONTENT-->
    <div class="row">
        <div class="col-sm-12">
			<h4>Load Draft Application</h4>
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
				@foreach($draftApplication as $draft)
				<tr>
					<td>{{$draft->application_no}}</td>
					<td>{{$draft->applicant_email}}</td>
					<td><a href="{{route('tenant.applications.showapplication',['id'=>$draft->application_no])}}">Load</a></td>
				</tr>
				@endforeach
			</tbody>
		</table>
	</div>
    <!-- END PAGE CONTENT-->
@endsection