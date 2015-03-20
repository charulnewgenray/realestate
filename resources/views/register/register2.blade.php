@extends('register.app')

@section('content')
	<!-- BEGIN PAGE CONTENT-->
    <h3 class="page-title register-title">
        New Application <small>for renting a property</small>
    </h3>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box" id="form_wizard_1">
                <div class="portlet-body form">
					{!! Form::model($personalInformation,array('method'=>'post','class'=> 'form-horizontal','url' => route('register.register.postRegister'), 'id'=>'submit_form')) !!}
					<input type="hidden" name="user_id" value="{{Auth::id()}}">
					<input type="hidden" name="property_id" value="1">

					<input type="hidden" name="application_no" value="@if($personalInformation){{$personalInformation->application_no}}@else @endif">

					{!! Form::close()!!}
				</div>
			</div>
		</div>
	</div>
<!-- Sign Model -->
<!-- Applicant Model-->
	<div class="modal fade" id="applicationModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<!-- The form is placed inside the body of modal -->
					<div class="row">
						<div class="col-sm-6">
							<h4 class="modal-header">Load Previous Application</h4>
						</div>
						<div class="col-sm-6">
							{!! Form::model($personalInformation,array('method'=>'post','class'=> 'form-horizontal new-application','url' => route('register.application.create'), 'id'=>'submit_form')) !!}
							<input type="hidden"  name="user_id" value="" />
							<input type="hidden" name="property_id" value="1" />
							<h4 class="modal-header"><button type="submit" class="btn green" name="new_application">New Application</button></h4>
							{!!Form::text('first_name', null, array('class'=>'form-control', 'name'=>'customer_personal_information[first_name]'))!!}
							{!! Form::close()!!}
							
						</div>
					</div>
					
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

						</tbody>

					</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Applicant Model -->

@endsection
@section('page-script')
    <script>
        
/* Model Actions*/
		$(document).ready(function() {
			var application_url = "{{route('register.application.index')}}";
			var current_url = "{{Request::path()}}";
			@if(!Auth::check())
				$('#loginModal').modal('show');
			@else
			if(current_url == 'register'){
				$.post("{{route('register.application.get')}}", {
							'_token': $('#submit_form input[name="_token"]').val()
						}
				).done(function(data){
							if(data.status == 'success'){
								if(data.data != ''){
									$('.new-application input[name="user_id"]').val(data.user_id);
									var html = '';
									$.each(data.data,function(i,val){
										html += '<tr><td>'+i+'</td><td>'+val+'</td><td><a href="'+application_url+'/'+i+'">Load</a></td></tr>';
									});
									$('.applicant-data').append(html);
									$('#loginModal').modal('hide');
									$('#signupModal').modal('hide');
									$('#applicationModal').modal('show');
								}else{
									location.reload();
								}


							}
							else{
								$('#loginForm .error-message').text(data.message);
							}
						});
//					$('#applicationModal').modal('show');

			}
			@endif


        	$('.newuser-act').on('click',function(){
				$('#signupModal').modal('show');
			});
			$('#loginForm').submit(function(e){
				e.preventDefault();

				$.post("{{route('register.login')}}", {
							'_token': $('#loginForm input[name="_token"]').val(),
							'email': $('#loginForm input[name="email"]').val(),
							'password': $('#loginForm input[name="password"]').val()
						}
				).done(function(data){
							if(data.status == 'success'){
							if(data.data != ''){
									$('.new-application input[name="user_id"]').val(data.user_id);
									var html = '';
									$.each(data.data,function(i,val){
										html += '<tr><td>'+i+'</td><td>'+val+'</td><td><a href="'+application_url+'/'+i+'">Load</a></td></tr>';
									});
									$('.applicant-data').append(html);
									$('#loginModal').modal('hide');
									$('#signupModal').modal('hide');
									$('#applicationModal').modal('show');
								}else{
									location.reload();
								}


							}
							else{
								$('#loginForm .error-message').text(data.message);
							}
						});
			});
			$('#signupModal').submit(function(e){
				e.preventDefault();

				$.post("{{route('register.signup')}}", {
							'_token': $('#signupForm input[name="_token"]').val(),
							'name': $('#signupForm input[name="name"]').val(),
							'email': $('#signupForm input[name="email"]').val(),
							'password': $('#signupForm input[name="password"]').val()
						}
				).done(function(data){
							if(data.status == 'success'){
								$('form.new-application input[name="user_id"]').val(data.data['user_id']);
								$('form.new-application').submit();
							}
							else{
								$('#signupForm .error-message').text(data.message);
							}
						});
			});


});
    </script>
    @endsection