@extends('app')

@section('content')

	<!-- BEGIN PAGE CONTENT-->
	<div class="row">
		<div class="col-sm-12">
			<div class="note note-success">
				<h4>Application Information</h4>
				<!--<p>Description</p>-->
			</div>
			<div class="tabbable tabbable-custom">
				<ul class="nav nav-tabs">
					<li class="active">
						<a data-toggle="tab" href="#tab_1_1">
							Personal</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab_1_2">
							Occupants</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab_1_3">
							Rental Residence</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab_1_4">
							Employment</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab_1_5">
							Credit</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab_1_6">
							Vehicle</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab_1_7">
							References & Emergency Contacts</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab_1_8">
							General</a>
					</li>
				</ul>
				<div class="portlet-body form">
					{!! Form::model($personalInformation,array('method'=>'post','class'=> 'form-horizontal','url' => route('register.register.postRegister'), 'id'=>'submit_form')) !!}
					<input type="hidden" name="user_id" value="{{Auth::id()}}">
					<input type="hidden" name="property_id" value="1">
				</div>
				<div class="form-body">
					<div id="bar" class="progress progress-striped" role="progressbar">
						<div class="progress-bar progress-bar-success">
						</div>
					</div>
				</div>
				<div class="tab-content">
					<div id="tab_1_1" class="tab-pane active">
						<h3 class="block">Personal Information</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">First Name<span class="required">
																* </span>
									</label>

									<div class="col-md-6">
										{!!Form::text('first_name', null, array('class'=>'form-control', 'name'=>'personal_information[first_name]'))!!}
																	<span class="help-block">
																	Provide your username </span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Middle Name <span class="required">
																* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('middle_name', null, array('class'=>'form-control', 'name'=>'personal_information[middle_name]'))!!}
																	<span class="help-block">
																	Provide your middle name. </span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Last Name <span class="required">
																* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('last_name', null, array('class'=>'form-control', 'name'=>'personal_information[last_name]'))!!}
																	<span class="help-block">
																	Provide your last name. </span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Email <span class="required">
																* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('email', null, array('class'=>'form-control', 'name'=>'personal_information[email]','id'=>'email'))!!}
																	<span class="help-block" id="email-exist">
																	Provide your email address </span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Birth Date <span class="required">
																* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('dob', null, array('class'=>'form-control', 'name'=>'personal_information[dob]'))!!}
																	<span class="help-block">
																	Provide birth date.</span>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Social Security <span class="required">
																* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('social_security', null, array('class'=>'form-control', 'name'=>'personal_information[social_security]'))!!}
																	<span class="help-block">
																	Provide Social Security.</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Driver Licence <span class="required">
																* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('driver_licence', null, array('class'=>'form-control', 'name'=>'personal_information[driver_licence]'))!!}
																	<span class="help-block">
																	Provide Driver Licence.</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Any Other Name you used in Past <span class="required">
																* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('past_name', null, array('class'=>'form-control', 'name'=>'personal_information[past_name]'))!!}
																	<span class="help-block">
																	Provide Past Name.</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Home Phone <span class="required">
																* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('home_phone', null, array('class'=>'form-control', 'name'=>'personal_information[home_phone]'))!!}
																	<span class="help-block">
																	Provide Home Phone.</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Cell Phone <span class="required">
																* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('cell_phone', null, array('class'=>'form-control', 'name'=>'personal_information[cell_phone]'))!!}
																	<span class="help-block">
																	Provide Cell Phone.</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
@endsection