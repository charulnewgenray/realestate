@extends('register.app')

@section('content')
	<!-- BEGIN PAGE CONTENT-->
	<?php if(isset($data)){
	}else{
		$data = [];
	}if(isset($dataMap)){
	}else{
		$dataMap = [];
	}
	if(isset($id)){
	}else{
		$id = "";
	}?>
	<div class="row">
		<div class="col-sm-6">
			<h3 class="page-title register-title">
				New Application <small>for renting a property</small>
			</h3>
			
		</div>
		<div class="col-sm-6">
			<h3 class="pull-right page-title register-title" style="padding-right: 10px;">
				<button type="button" id="load_application" class="btn btn-sm red">Load Data</button>
			</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box" id="form_wizard_1">
				<div class="portlet-body form">
					{!! Form::model($data,array('method'=>'post','class'=> 'form-horizontal','url' => route('register.register.postRegister'), 'id'=>'submit_form')) !!}
					<input type="hidden" name="user_id" value="{{Auth::id()}}">
					<input type="hidden" name="property_id" value="1">
					<input type="hidden" name="application_no" value="{{$id}}">
					<div class="form-wizard">
						<div class="form-body">
							<ul class="nav nav-pills nav-justified steps">
								<li>
									<a href="#tab1" data-toggle="tab" class="step">
											<span class="number">
											1 </span>
											<span class="desc">
											<i class="fa fa-check"></i> Personal & Residence</span>
									</a>
								</li>
								<li>
									<a href="#tab2" data-toggle="tab" class="step">
											<span class="number">
											2 </span>
											<span class="desc">
											<i class="fa fa-check"></i> Employment & Credit</span>
									</a>
								</li>
								<li>
									<a href="#tab3" data-toggle="tab" class="step active">
											<span class="number">
											3 </span>
											<span class="desc">
											<i class="fa fa-check"></i>Vehicle & References </span>
									</a>
								</li>
								<li>
									<a href="#tab4" data-toggle="tab" class="step">
											<span class="number">
											4 </span>
											<span class="desc">
											<i class="fa fa-check"></i>General Information </span>
									</a>
								</li>
							</ul>
						<div id="bar" class="progress progress-striped" role="progressbar">
							<div class="progress-bar progress-bar-success">
							</div>
						</div>
						<div class="tab-content">
						<div class="alert alert-danger display-none">
							<button class="close" data-dismiss="alert"></button>
							You have some form errors. Please check below.
						</div>
						<div class="alert alert-success display-none">
							<button class="close" data-dismiss="alert"></button>
							Your form validation is successful!
						</div>
						<?php $tabVal = 0;?>
						@foreach($dataMap as $key=>$value)
							<?php $index = 0;?>
							<?php if($dataSection[$key]['section'] != $tabVal){?>
								<?php if($tabVal){?>
								
									</div>
								<?php }?>
							<?php }?>
							<?php if($dataSection[$key]['section'] == $tabVal){?>
								
							<?php }else{ ?>
								<div class="tab-pane active" id="tab{{$dataSection[$key]['section']}}">
								<?php $tabVal = $dataSection[$key]['section'];?>
							<?php }?>
							<h3 class="block">{{$dataSection[$key]['heading']}}</h3>
							<div class="row">
							@foreach($value as $field)
								<?php $fieldName = $field->field; ?>
								<?php if($dataSection[$key]['heading'] == "General Information"){?>
									<div class="col-lg-12 col-md-12 col-xs-12">
								<?php }else{?>
									<div class="col-lg-4 col-md-6 col-xs-6">
								<?php }?>
									<div class="form-group">
										<label class="control-label col-md-4">{{$field->label}}</label>
										<div class="col-md-8">
											@if($field->meta)
												<input type="hidden" name="{{$key .'_meta['.$index.']['.'application_no'.']'}}" class="form-control input-sm" value="{{$id}}" placeholder="">
												<input type="hidden" name="{{$key .'_meta['.$index.'][field_name]'}}" class="form-control input-sm" value="{{$field->field}}" placeholder="" <?php if($field->required){ ?>  <?php } ?>>
												<input type="{{$field->type}}" name="{{$key .'_meta['.$index.'][field_value]'}}" class="form-control input-sm" value="@if(isset($data[$key]->$fieldName)){{$data[$key]->$fieldName}}@endif" placeholder="" <?php if($field->required){ ?>  <?php } ?>>
											@else
												<input type="{{$field->type}}" name="{{$key .'['.$field->field.']'}}" class="form-control input-sm" value="@if(isset($data[$key]->$fieldName)){{$data[$key]->$fieldName}}@endif" placeholder="" <?php if($field->required){ ?>  <?php } ?>>
											@endif


										</div>
									</div>

								</div>

							<?php $index++;?>
							@endforeach
							</div>
							
						@endforeach
						
						</div>
						</div>
						<div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-9">
                                        <a href="javascript:;" class="btn default button-previous">
                                            <i class="m-icon-swapleft"></i> Back </a>
                                        <a href="javascript:;" class="btn blue button-next">
                                            Continue <i class="m-icon-swapright m-icon-white"></i>
                                        </a>
                                        <a href="javascript:;" class="btn green button-submit">
                                            Submit <i class="m-icon-swapright m-icon-white"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
						{!! Form::close() !!}
					</div>
				</div>
			</div>
		</div>
	</div>




<!-- END PAGE CONTENT-->
	<!-- Login Model -->
	<div class="modal fade black-modal" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<!-- The form is placed inside the body of modal -->
					<div class="row">
						<div class="col-sm-6">
							<h4 class="modal-header">New user</h4>
							<div class="btn green newuser-act">Sign Up</div>
						</div>
						<div class="col-sm-6">
							<h4 class="modal-header">Existing user</h4>
							{!! Form::open(array('route' => 'register.login','method' => 'POST' , 'class' => 'form-horizontal', 'id' =>'loginForm')) !!}
							<div class="form-group">
								<label class="col-xs-12 error-message"></label>
							</div>
								<div class="form-group">
									<label class="col-xs-3 control-label">Email</label>
									<div class="col-xs-9">
										<input type="email" required class="form-control" name="email" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-xs-3 control-label">Password</label>
									<div class="col-xs-9">
										<input type="password" required class="form-control" name="password" />
									</div>
								</div>

								<div class="form-group">
									<div class="col-xs-9 col-xs-offset-3">
										<button type="submit" class="btn login">Login</button>
									</div>
								</div>
							{!! Form::close()!!}
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
<!-- End Login Modal-->

<!-- Signin Model-->
	<div class="modal fade black-modal" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<!-- The form is placed inside the body of modal -->

							<h4 class="modal-header">Signup</h4>
							{!! Form::open(array('route' => 'register.signup','method' => 'POST' , 'class' => 'form-horizontal', 'id' =>'signupForm')) !!}
								<div class="form-group">
									<label class="col-xs-12 error-message"></label>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label">Name</label>
									<div class="col-xs-8">
										<input type="text" required class="form-control" name="name" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-xs-4 control-label">Email</label>
									<div class="col-xs-8">
										<input type="email" required class="form-control" name="email" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-xs-4 control-label">Password</label>
									<div class="col-xs-8">
										<input type="password" required class="form-control" name="password" />
									</div>
								</div>

								<div class="form-group">
									<div class="col-xs-8 col-xs-offset-4">
										<button type="submit" class="btn login">Sign up</button>
									</div>
								</div>
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
							{!! Form::model($data,array('method'=>'post','class'=> 'form-horizontal new-application','url' => route('register.application.create'), 'id'=>'submit_form')) !!}
							<input type="hidden"  name="user_id" value="" />
							<input type="hidden" name="property_id" value="1" />
							<h4 class="modal-header"><button type="submit" class="btn green" name="new_application">New Application</button></h4>
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
	
	<!-- Load Application Model-->
	<div class="modal fade" id="loadApplicationModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<!-- The form is placed inside the body of modal -->
					<div class="row">
						<div class="col-sm-7">
							<h4 class="modal-header">Load Data of Previous Application</h4>
						</div>
						<div class="col-sm-5">
							<div class="pull-right"><button class="btn btn-sm red filter-cancel" id="close_load_application">Cancel</button></div>
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
						<tbody class="load-applicant-data">

						</tbody>

					</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Load Application Model -->

@endsection
@section('page-script')
    <script>
        
/* Model Actions*/
		jQuery(document).ready(function() {

			var application_url = "{{route('register.application.index')}}";
			var load_application_url = "/register/loadApplication";
			var current_url = "{{Request::path()}}";
			@if(!Auth::check())
				jQuery('#loginModal').modal('show');
			@else
			if(current_url == 'register'){
				$.post("{{route('register.application.get')}}", {
							'_token': jQuery('#submit_form input[name="_token"]').val()
						}
				).done(function(data){
							if(data.status == 'success'){
								if(data.data != ''){
									jQuery('.new-application input[name="user_id"]').val(data.user_id);
									var html = '';
									$.each(data.data,function(i,val){
										html += '<tr><td>'+i+'</td><td>'+val+'</td><td><a href="'+application_url+'/'+i+'">Open</a></td></tr>';
									});
									jQuery('.applicant-data').append(html);
									jQuery('#loginModal').modal('hide');
									jQuery('#signupModal').modal('hide');
									jQuery('#applicationModal').modal('show');
								}else{
									location.reload();
								}


							}
							else{
								jQuery('#loginForm .error-message').text(data.message);
							}
						});
//					jQuery('#applicationModal').modal('show');

			}
			@endif


        	jQuery('.newuser-act').on('click',function(){
				jQuery('#signupModal').modal('show');
			});
			jQuery('#loginForm').submit(function(e){
				e.preventDefault();

				$.post("{{route('register.login')}}", {
							'_token': jQuery('#loginForm input[name="_token"]').val(),
							'email': jQuery('#loginForm input[name="email"]').val(),
							'password': jQuery('#loginForm input[name="password"]').val()
						}
				).done(function(data){
							if(data.status == 'success'){
							if(data.data != ''){
									jQuery('.new-application input[name="user_id"]').val(data.user_id);
									var html = '';
									$.each(data.data,function(i,val){
										html += '<tr><td>'+i+'</td><td>'+val+'</td><td><a href="'+application_url+'/'+i+'">Open</a></td></tr>';
									});
									
									jQuery('.applicant-data').append(html);
									jQuery('#loginModal').modal('hide');
									jQuery('#signupModal').modal('hide');
									jQuery('#applicationModal').modal('show');
								}else{
									location.reload();
								}


							}
							else{
								jQuery('#loginForm .error-message').text(data.message);
							}
						});
			});
			jQuery('#signupModal').submit(function(e){
				e.preventDefault();

				$.post("{{route('register.signup')}}", {
							'_token': jQuery('#signupForm input[name="_token"]').val(),
							'name': jQuery('#signupForm input[name="name"]').val(),
							'email': jQuery('#signupForm input[name="email"]').val(),
							'password': jQuery('#signupForm input[name="password"]').val()
						}
				).done(function(data){
							if(data.status == 'success'){
								jQuery('form.new-application input[name="user_id"]').val(data.data['user_id']);
								jQuery('form.new-application').submit();
							}
							else{
								jQuery('#signupForm .error-message').text(data.message);
							}
						});
			});
		jQuery('#load_application').click(function(e){
				var application_no = jQuery('#submit_form input[name="application_no"]').val();
				e.preventDefault();

				$.post("{{route('register.application.get')}}", {
										'_token': jQuery('#submit_form input[name="_token"]').val(),
										'application_no':jQuery('#submit_form input[name="application_no"]').val()}
				).done(function(data){
							if(data.status == 'success'){
							if(data.data != ''){
									jQuery('.new-application input[name="user_id"]').val(data.user_id);
									var html = '';
									$.each(data.data,function(i,val){
										html += '<tr><td>'+i+'</td><td>'+val+'</td><td><a href="'+load_application_url+'/'+i+'/'+application_no+'">Load</a></td></tr>';
									});
									
									jQuery('.load-applicant-data').html(html);
									jQuery('#loadApplicationModal').modal('show');
								}else{
									location.reload();
								}


							}
							else{
								jQuery('#loginForm .error-message').text(data.message);
							}
						});
			});
		
		jQuery('#close_load_application').click(function(){
			jQuery('#loadApplicationModal').modal('hide');
		});
		
		
		
		
		
});
    </script>
    @endsection