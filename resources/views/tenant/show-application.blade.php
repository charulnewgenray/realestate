@extends('tenant.app')

@section('content')
	<!-- BEGIN PAGE CONTENT-->
	{!! Form::model($personalInformation,array('method'=>'post','class'=> 'form-horizontal','url' => route('tenant.applications.postapplication'), 'id'=>'submit_form')) !!}
		<input type="hidden" name="user_id" value="{{Auth::id()}}">
		<input type="hidden" name="property_id" value="1">
		<input type="hidden" name="application_no" value="{{$id}}">
	<div class="row">
		<div class="col-sm-6">
			<h4>Application Information</h4>
		</div>
		<div class="col-sm-6">
			<div class="pull-right">
				<button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i>Cancel</button>
				<button type="submit" class="btn btn-sm green">Submit</button>
			</div>

		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-12">
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
										{!!Form::text('first_name', null, array('class'=>'form-control', 'name'=>'customer_personal_information[first_name]'))!!}
													<span class="help-block">
													Provide your username </span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Middle Name <span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('middle_name', null, array('class'=>'form-control', 'name'=>'customer_personal_information[middle_name]'))!!}
													<span class="help-block">
													Provide your middle name. </span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Last Name <span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('last_name', null, array('class'=>'form-control', 'name'=>'customer_personal_information[last_name]'))!!}
													<span class="help-block">
													Provide your last name. </span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Email <span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('email', null, array('class'=>'form-control', 'name'=>'customer_personal_information[email]','id'=>'email'))!!}
													<span class="help-block" id="email-exist">
													Provide your email address </span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Birth Date <span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('dob', null, array('class'=>'form-control', 'name'=>'customer_personal_information[dob]'))!!}
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
										{!!Form::text('social_security', null, array('class'=>'form-control', 'name'=>'customer_personal_information[social_security]'))!!}
													<span class="help-block">
													Provide Social Security.</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Driver Licence <span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('driver_licence', null, array('class'=>'form-control', 'name'=>'customer_personal_information[driver_licence]'))!!}
													<span class="help-block">
													Provide Driver Licence.</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Any Other Name you used in Past <span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('past_name', null, array('class'=>'form-control', 'name'=>'customer_personal_information[past_name]'))!!}
													<span class="help-block">
													Provide Past Name.</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Home Phone <span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('home_phone', null, array('class'=>'form-control', 'name'=>'customer_personal_information[home_phone]'))!!}
													<span class="help-block">
													Provide Home Phone.</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Cell Phone <span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('cell_phone', null, array('class'=>'form-control', 'name'=>'customer_personal_information[cell_phone]'))!!}
													<span class="help-block">
													Provide Cell Phone.</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="tab_1_2" class="tab-pane">
						<h3 class="block">Occupants Information</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">All Other Perposel Occupants <span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('occupant_name', null, array('class'=>'form-control', 'name'=>'customer_occupants_information[occupant_name]'))!!}
													<span class="help-block">
													Provide your occupant name </span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Occupant DOB <span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('occupant_dob', null, array('class'=>'form-control', 'name'=>'customer_occupants_information[occupant_dob]'))!!}
													<span class="help-block">
													Provide your occupant birth date </span>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Occupant Relationship<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										{!!Form::text('occupant_relationship', null, array('class'=>'form-control', 'name'=>'customer_occupants_information[occupant_relationship]'))!!}
													<span class="help-block">
													Provide your occupant occupant relationship</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="tab_1_3" class="tab-pane active">
						<h3 class="block">Current Residence History</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Street Address<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::textarea('cur_address', null, array('class'=>'form-control', 'name'=>'customer_current_residence_history[cur_address]', 'rows'=>'5'))!!}
													<span class="help-block">
													Provide your street address</span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-4">City<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::select('customer_current_residence_history[cur_city]', array('Cats' => array('leopard' => 'Leopard'),'Dogs' => array('spaniel' => 'Spaniel'),));!!}
													<span class="help-block">
													Provide city</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Last Rent Amount Paid<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cur_last_amount_paid', null, array('class'=>'form-control', 'name'=>'customer_current_residence_history[cur_last_amount_paid]'))!!}
													<span class="help-block">
													Provide Last Rent Amount</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Owner<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cur_owner', null, array('class'=>'form-control', 'name'=>'customer_current_residence_history[cur_owner]'))!!}
													<span class="help-block">
													Provide owner</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Phone No<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cur_phone_no', null, array('class'=>'form-control', 'name'=>'customer_current_residence_history[cur_phone_no]'))!!}
													<span class="help-block">
													Provide Phone No</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Reason for leaving.<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::textarea('cur_reason_for_leaving', null, array('class'=>'form-control', 'name'=>'customer_current_residence_history[cur_reason_for_leaving]'))!!}
													<span class="help-block">
													Provide Reason for leaving</span>
									</div>
								</div>
								
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">State<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::select('customer_current_residence_history[cur_state]', array('Cats' => array('leopard' => 'Leopard'),'Dogs' => array('spaniel' => 'Spaniel'),));!!}
													<span class="help-block">
													Provide State</span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-4">Is/Was pent paid in full<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 <input type="radio" class="form-control font_input" name="customer_current_residence_history[cur_rent_paid_full]" value="yes">
										 <span style="color:red;">Yes</span>
										 <input type="radio" class="form-control font_input" name="customer_current_residence_history[cur_rent_paid_full]" value="no">
										 <span style="color:red;">No</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Did you give notice<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 <input type="radio" class="form-control font_input" name="customer_current_residence_history[cur_give_notice]" value="yes">
										 <span style="color:red;">Yes</span>
										 <input type="radio" class="form-control font_input" name="customer_current_residence_history[cur_give_notice]" value="no">
										 <span style="color:red;">No</span>
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Where you asked to move<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cur_asked_to_move', null, array('class'=>'form-control', 'name'=>'customer_current_residence_history[cur_asked_to_move]'))!!}
													<span class="help-block">
													Provide asked to move</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Name in which your utilities are now billed<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cur_utilities', null, array('class'=>'form-control', 'name'=>'customer_current_residence_history[cur_utilities]'))!!}
													<span class="help-block">
													Provide asked to move</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Date of residency From<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cur_residence_from', null, array('class'=>'form-control', 'name'=>'customer_current_residence_history[cur_residence_from]'))!!}
													<span class="help-block">
													Provide asked to move</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Date of residency To<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cur_residence_to', null, array('class'=>'form-control', 'name'=>'customer_current_residence_history[cur_residence_to]'))!!}
													<span class="help-block">
													Provide asked to move</span>
									</div>
								</div>
								
							</div>
						</div>
						<!-- start previous residence history -->
						<h3 class="block">Previous Residence History</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Street Address<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::textarea('pre_address', null, array('class'=>'form-control', 'name'=>'customer_previous_residence_history[pre_address]', 'rows'=>'5'))!!}
													<span class="help-block">
													Provide your street address</span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-4">City<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::select('customer_previous_residence_history[pre_city]', array('Cats' => array('leopard' => 'Leopard'),'Dogs' => array('spaniel' => 'Spaniel'),));!!}
													<span class="help-block">
													Provide city</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Last Rent Amount Paid<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pre_last_amount_paid', null, array('class'=>'form-control', 'name'=>'customer_previous_residence_history[pre_last_amount_paid]'))!!}
													<span class="help-block">
													Provide Last Rent Amount</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Owner<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pre_owner', null, array('class'=>'form-control', 'name'=>'customer_previous_residence_history[pre_owner]'))!!}
													<span class="help-block">
													Provide owner</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Phone No<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pre_phone_no', null, array('class'=>'form-control', 'name'=>'customer_previous_residence_history[pre_phone_no]'))!!}
													<span class="help-block">
													Provide Phone No</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Reason for leaving.<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::textarea('pre_reason_for_leaving', null, array('class'=>'form-control', 'name'=>'customer_previous_residence_history[pre_reason_for_leaving]'))!!}
													<span class="help-block">
													Provide Reason for leaving</span>
									</div>
								</div>
								
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">State<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::select('customer_previous_residence_history[pre_state]', array('Cats' => array('leopard' => 'Leopard'),'Dogs' => array('spaniel' => 'Spaniel'),));!!}
													<span class="help-block">
													Provide State</span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-4">Is/Was pent paid in full<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 <input type="radio" class="form-control font_input" name="customer_previous_residence_history[pre_rent_paid_full]" value="yes">
										 <span style="color:red;">Yes</span>
										 <input type="radio" class="form-control font_input" name="customer_previous_residence_history[pre_rent_paid_full]" value="no">
										 <span style="color:red;">No</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Did you give notice<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 <input type="radio" class="form-control font_input" name="customer_previous_residence_history[pre_give_notice]" value="yes">
										 <span style="color:red;">Yes</span>
										 <input type="radio" class="form-control font_input" name="customer_previous_residence_history[pre_give_notice]" value="no">
										 <span style="color:red;">No</span>
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Where you asked to move<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pre_asked_to_move', null, array('class'=>'form-control', 'name'=>'customer_previous_residence_history[pre_asked_to_move]'))!!}
													<span class="help-block">
													Provide asked to move</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Name in which your utilities are now billed<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pre_utilities', null, array('class'=>'form-control', 'name'=>'customer_previous_residence_history[pre_utilities]'))!!}
													<span class="help-block">
													Provide asked to move</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Date of residency From<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pre_residence_from', null, array('class'=>'form-control', 'name'=>'customer_previous_residence_history[pre_residence_from]'))!!}
													<span class="help-block">
													Provide asked to move</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Date of residency To<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pre_residence_to', null, array('class'=>'form-control', 'name'=>'customer_previous_residence_history[pre_residence_to]'))!!}
													<span class="help-block">
													Provide asked to move</span>
									</div>
								</div>
								
							</div>
						</div>
						<!-- end previous residence history -->
						
						<!-- start prior residence history -->
						<h3 class="block">Prior Residence History</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Street Address<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::textarea('pri_address', null, array('class'=>'form-control', 'name'=>'customer_prior_residence_history[pri_address]', 'rows'=>'5'))!!}
													<span class="help-block">
													Provide your street address</span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-4">City<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::select('customer_prior_residence_history[pri_city]', array('Cats' => array('leopard' => 'Leopard'),'Dogs' => array('spaniel' => 'Spaniel'),));!!}
													<span class="help-block">
													Provide city</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Last Rent Amount Paid<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pri_last_amount_paid', null, array('class'=>'form-control', 'name'=>'customer_prior_residence_history[pri_last_amount_paid]'))!!}
													<span class="help-block">
													Provide Last Rent Amount</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Owner<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pri_owner', null, array('class'=>'form-control', 'name'=>'customer_prior_residence_history[pri_owner]'))!!}
													<span class="help-block">
													Provide owner</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Phone No<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pri_phone_no', null, array('class'=>'form-control', 'name'=>'customer_prior_residence_history[pri_phone_no]'))!!}
													<span class="help-block">
													Provide Phone No</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Reason for leaving.<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::textarea('pri_reason_for_leaving', null, array('class'=>'form-control', 'name'=>'customer_prior_residence_history[pri_reason_for_leaving]'))!!}
													<span class="help-block">
													Provide Reason for leaving</span>
									</div>
								</div>
								
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">State<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::select('customer_prior_residence_history[pri_state]', array('Cats' => array('leopard' => 'Leopard'),'Dogs' => array('spaniel' => 'Spaniel'),));!!}
													<span class="help-block">
													Provide State</span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-4">Is/Was pent paid in full<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 <input type="radio" class="form-control font_input" name="customer_prior_residence_history[pri_rent_paid_full]" value="yes">
										 <span style="color:red;">Yes</span>
										 <input type="radio" class="form-control font_input" name="customer_prior_residence_history[pri_rent_paid_full]" value="no">
										 <span style="color:red;">No</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Did you give notice<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 <input type="radio" class="form-control font_input" name="customer_prior_residence_history[pri_give_notice]" value="yes">
										 <span style="color:red;">Yes</span>
										 <input type="radio" class="form-control font_input" name="customer_prior_residence_history[pri_give_notice]" value="no">
										 <span style="color:red;">No</span>
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Where you asked to move<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pri_asked_to_move', null, array('class'=>'form-control', 'name'=>'customer_prior_residence_history[pri_asked_to_move]'))!!}
													<span class="help-block">
													Provide asked to move</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Name in which your utilities are now billed<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pri_utilities', null, array('class'=>'form-control', 'name'=>'customer_prior_residence_history[pri_utilities]'))!!}
													<span class="help-block">
													Provide asked to move</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Date of residency From<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pri_residence_from', null, array('class'=>'form-control', 'name'=>'customer_prior_residence_history[pri_residence_from]'))!!}
													<span class="help-block">
													Provide asked to move</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Date of residency To<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pri_residence_to', null, array('class'=>'form-control', 'name'=>'customer_prior_residence_history[pri_residence_to]'))!!}
													<span class="help-block">
													Provide asked to move</span>
									</div>
								</div>
								
							</div>
						</div>
						<!-- end prior residence history -->
					</div>
					<div id="tab_1_4" class="tab-pane">
						<h3 class="block">Current Employment History</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Company<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cur_emp_company', null, array('class'=>'form-control', 'name'=>'customer_current_employment_history[cur_emp_company]'))!!}
													<span class="help-block">
													Provide company</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Street Address<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cur_emp_address', null, array('class'=>'form-control', 'name'=>'customer_current_employment_history[cur_emp_address]'))!!}
													<span class="help-block">
													Provide address</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Phone No<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cur_emp_phone_no', null, array('class'=>'form-control', 'name'=>'customer_current_employment_history[cur_emp_phone_no]'))!!}
													<span class="help-block">
													Provide Phone No</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Occupation<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cur_emp_occupation', null, array('class'=>'form-control', 'name'=>'customer_current_employment_history[cur_emp_occupation]'))!!}
													<span class="help-block">
													Provide Occupation</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Name of Supervisor<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cur_emp_supervisor', null, array('class'=>'form-control', 'name'=>'customer_current_employment_history[cur_emp_supervisor]'))!!}
													<span class="help-block">
													Provide Supervisor</span>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Monthly Gross Pay<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cur_emp_gross_pay', null, array('class'=>'form-control', 'name'=>'customer_current_employment_history[cur_emp_gross_pay]'))!!}
													<span class="help-block">
													Provide Monthly Gross Pay</span>
									</div>
								</div>
							
								<div class="form-group">
									<label class="control-label col-md-4">Date of Employment From<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cur_emp_employment_from', null, array('class'=>'form-control', 'name'=>'customer_current_employment_history[cur_emp_employment_from]'))!!}
													<span class="help-block">
													Date of Employment From</span>
									</div>
								</div>
							
								<div class="form-group">
									<label class="control-label col-md-4">Date of employment To<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cur_emp_employment_to', null, array('class'=>'form-control', 'name'=>'customer_current_employment_history[cur_emp_employment_to]'))!!}
													<span class="help-block">
													Date of Employment From</span>
									</div>
								</div>
							</div>
						</div>
						<!-- end of current employment history -->
						<!-- start of current employment history -->
						<h3 class="block">Previous Employment History</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Company<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pre_emp_company', null, array('class'=>'form-control', 'name'=>'customer_previous_employment_history[pre_emp_company]'))!!}
													<span class="help-block">
													Provide company</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Street Address<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pre_emp_address', null, array('class'=>'form-control', 'name'=>'customer_previous_employment_history[pre_emp_address]'))!!}
													<span class="help-block">
													Provide address</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Phone No<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pre_emp_phone_no', null, array('class'=>'form-control', 'name'=>'customer_previous_employment_history[pre_emp_phone_no]'))!!}
													<span class="help-block">
													Provide Phone No</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Occupation<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pre_emp_occupation', null, array('class'=>'form-control', 'name'=>'customer_previous_employment_history[pre_emp_occupation]'))!!}
													<span class="help-block">
													Provide Occupation</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Name of Supervisor<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pre_emp_supervisor', null, array('class'=>'form-control', 'name'=>'customer_previous_employment_history[pre_emp_supervisor]'))!!}
													<span class="help-block">
													Provide Supervisor</span>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Monthly Gross Pay<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pre_emp_gross_pay', null, array('class'=>'form-control', 'name'=>'customer_previous_employment_history[pre_emp_gross_pay]'))!!}
													<span class="help-block">
													Provide Monthly Gross Pay</span>
									</div>
								</div>
							
								<div class="form-group">
									<label class="control-label col-md-4">Date of Employment From<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pre_emp_employment_from', null, array('class'=>'form-control', 'name'=>'customer_previous_employment_history[pre_emp_employment_from]'))!!}
													<span class="help-block">
													Date of Employment From</span>
									</div>
								</div>
							
								<div class="form-group">
									<label class="control-label col-md-4">Date of employment To<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pre_emp_employment_to', null, array('class'=>'form-control', 'name'=>'customer_previous_employment_history[pre_emp_employment_to]'))!!}
													<span class="help-block">
													Date of Employment From</span>
									</div>
								</div>
							
								
							</div>
						</div>
						<!-- end of previous employment history -->
						<!-- start of current employment history -->
						<h3 class="block">Prior Employment History</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Company<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pri_emp_company', null, array('class'=>'form-control', 'name'=>'customer_prior_employment_history[pri_emp_company]'))!!}
													<span class="help-block">
													Provide company</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Street Address<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pri_emp_address', null, array('class'=>'form-control', 'name'=>'customer_prior_employment_history[pri_emp_address]'))!!}
													<span class="help-block">
													Provide address</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Phone No<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pri_emp_phone_no', null, array('class'=>'form-control', 'name'=>'customer_prior_employment_history[pri_emp_phone_no]'))!!}
													<span class="help-block">
													Provide Phone No</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Occupation<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pri_emp_occupation', null, array('class'=>'form-control', 'name'=>'customer_prior_employment_history[pri_emp_occupation]'))!!}
													<span class="help-block">
													Provide Occupation</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Name of Supervisor<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pri_emp_supervisor', null, array('class'=>'form-control', 'name'=>'customer_prior_employment_history[pri_emp_supervisor]'))!!}
													<span class="help-block">
													Provide Supervisor</span>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Monthly Gross Pay<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pri_emp_gross_pay', null, array('class'=>'form-control', 'name'=>'customer_prior_employment_history[pri_emp_gross_pay]'))!!}
													<span class="help-block">
													Provide Monthly Gross Pay</span>
									</div>
								</div>
							
								<div class="form-group">
									<label class="control-label col-md-4">Date of Employment From<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pri_emp_employment_from', null, array('class'=>'form-control', 'name'=>'customer_prior_employment_history[pri_emp_employment_from]'))!!}
													<span class="help-block">
													Date of Employment From</span>
									</div>
								</div>
							
								<div class="form-group">
									<label class="control-label col-md-4">Date of employment To<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('pri_emp_employment_to', null, array('class'=>'form-control', 'name'=>'customer_prior_employment_history[pri_emp_employment_to]'))!!}
													<span class="help-block">
													Date of Employment From</span>
									</div>
								</div>
							
								
							</div>
						</div>
						<!-- end of prior employment history -->
					</div>
					<div id="tab_1_5" class="tab-pane">
						<!-- start of saving credit history -->
						<h3 class="block">Saving Credit History</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Bank/Institution Name<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('sav_bank_name', null, array('class'=>'form-control', 'name'=>'customer_saving_credit_history[sav_bank_name]'))!!}
													<span class="help-block">
													Provide company</span>
									</div>
								</div>
								
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Balance On Deposit or Balance Owed<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('sav_balance', null, array('class'=>'form-control', 'name'=>'customer_saving_credit_history[sav_balance]'))!!}
													<span class="help-block">
													Provide Monthly Gross Pay</span>
									</div>
								</div>
							</div>
							
							
							
						</div>
						<!-- end of saving credit history -->
						
						<!-- start of saving credit history -->
						<h3 class="block">Checking Credit History</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Bank/Institution Name<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('che_bank_name', null, array('class'=>'form-control', 'name'=>'customer_checking_credit_history[che_bank_name]'))!!}
													<span class="help-block">
													Provide company</span>
									</div>
								</div>
								
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Balance On Deposit or Balance Owed<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('che_balance', null, array('class'=>'form-control', 'name'=>'customer_checking_credit_history[che_balance]'))!!}
													<span class="help-block">
													Provide Monthly Gross Pay</span>
									</div>
								</div>
							</div>
							
							
							
						</div>
						<!-- end of saving credit history -->
						
						<!-- start of saving credit history -->
						<h3 class="block">Credit Credit History</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Bank/Institution Name<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cre_bank_name', null, array('class'=>'form-control', 'name'=>'customer_credit_credit_history[cre_bank_name]'))!!}
													<span class="help-block">
													Provide company</span>
									</div>
								</div>
								
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Balance On Deposit or Balance Owed<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('cre_balance', null, array('class'=>'form-control', 'name'=>'customer_credit_credit_history[cre_balance]'))!!}
													<span class="help-block">
													Provide Monthly Gross Pay</span>
									</div>
								</div>
							</div>
							
							
							
						</div>
						<!-- end of saving credit history -->
						
						<!-- start of saving credit history -->
						<h3 class="block">Auto Credit History</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Bank/Institution Name<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('aut_bank_name', null, array('class'=>'form-control', 'name'=>'customer_auto_credit_history[aut_bank_name]'))!!}
													<span class="help-block">
													Provide company</span>
									</div>
								</div>
								
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Balance On Deposit or Balance Owed<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('aut_balance', null, array('class'=>'form-control', 'name'=>'customer_auto_credit_history[aut_balance]'))!!}
													<span class="help-block">
													Provide Monthly Gross Pay</span>
									</div>
								</div>
							</div>
							
							
							
						</div>
						<!-- end of saving credit history -->
					</div>
					<div id="tab_1_6" class="tab-pane">
						<h3 class="block">Vehicle History</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Make<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('make', null, array('class'=>'form-control', 'name'=>'customer_vehicles[make]'))!!}
													<span class="help-block">
													Provide Make</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Color<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('color', null, array('class'=>'form-control', 'name'=>'customer_vehicles[color]'))!!}
													<span class="help-block">
													Provide Color</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Licence<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('licence', null, array('class'=>'form-control', 'name'=>'customer_vehicles[licence]'))!!}
													<span class="help-block">
													Provide Licence</span>
									</div>
								</div>
								
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Model<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('model', null, array('class'=>'form-control', 'name'=>'customer_vehicles[model]'))!!}
													<span class="help-block">
													Provide Model</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Year<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('year', null, array('class'=>'form-control', 'name'=>'customer_vehicles[year]'))!!}
													<span class="help-block">
													Provide Year</span>
									</div>
								</div>
							</div>
						</div>
						<!-- end of customer_vehicles history -->
					</div>
					<div id="tab_1_7" class="tab-pane">
						<h3 class="block">Doctor References</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Name<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('doc_name', null, array('class'=>'form-control', 'name'=>'customer_doctor_references[doc_name]'))!!}
													<span class="help-block">
													Provide Name</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">City<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('doc_city', null, array('class'=>'form-control', 'name'=>'customer_doctor_references[doc_city]'))!!}
													<span class="help-block">
													Provide City</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Zip Code<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('doc_zip_code', null, array('class'=>'form-control', 'name'=>'customer_doctor_references[doc_zip_code]'))!!}
													<span class="help-block">
													Provide Zip Code</span>
									</div>
								</div>
								
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Street Address<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('doc_address', null, array('class'=>'form-control', 'name'=>'customer_doctor_references[doc_address]'))!!}
													<span class="help-block">
													Provide Street Address</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">State<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('doc_state', null, array('class'=>'form-control', 'name'=>'customer_doctor_references[doc_state]'))!!}
													<span class="help-block">
													Provide State</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Contact<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('doc_contact_no', null, array('class'=>'form-control', 'name'=>'customer_doctor_references[doc_contact_no]'))!!}
													<span class="help-block">
													Provide Contact</span>
									</div>
								</div>
							</div>
						</div>
						<!-- end of doctor references -->
						
						<!-- start of Lawyer references -->
						<h3 class="block">Lawyer References</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Name<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('law_name', null, array('class'=>'form-control', 'name'=>'customer_lawyer_references[law_name]'))!!}
													<span class="help-block">
													Provide Name</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">City<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('law_city', null, array('class'=>'form-control', 'name'=>'customer_lawyer_references[law_city]'))!!}
													<span class="help-block">
													Provide City</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Zip Code<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('law_zip_code', null, array('class'=>'form-control', 'name'=>'customer_lawyer_references[law_zip_code]'))!!}
													<span class="help-block">
													Provide Zip Code</span>
									</div>
								</div>
								
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Street Address<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('law_address', null, array('class'=>'form-control', 'name'=>'customer_lawyer_references[law_address]'))!!}
													<span class="help-block">
													Provide Street Address</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">State<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('law_state', null, array('class'=>'form-control', 'name'=>'customer_lawyer_references[law_state]'))!!}
													<span class="help-block">
													Provide State</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Contact<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('law_contact_no', null, array('class'=>'form-control', 'name'=>'customer_lawyer_references[law_contact_no]'))!!}
													<span class="help-block">
													Provide Contact</span>
									</div>
								</div>
							</div>
						</div>
						<!-- end of Lawyer references -->
						
						<!-- start of Native references -->
						<h3 class="block">Native References</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Name<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('nat_name', null, array('class'=>'form-control', 'name'=>'customer_native_references[nat_name]'))!!}
													<span class="help-block">
													Provide Name</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">City<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('nat_city', null, array('class'=>'form-control', 'name'=>'customer_native_references[nat_city]'))!!}
													<span class="help-block">
													Provide City</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Zip Code<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('nat_zip_code', null, array('class'=>'form-control', 'name'=>'customer_native_references[nat_zip_code]'))!!}
													<span class="help-block">
													Provide Zip Code</span>
									</div>
								</div>
								
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="control-label col-md-4">Street Address<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('nat_address', null, array('class'=>'form-control', 'name'=>'customer_native_references[nat_address]'))!!}
													<span class="help-block">
													Provide Street Address</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">State<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('nat_state', null, array('class'=>'form-control', 'name'=>'customer_native_references[nat_state]'))!!}
													<span class="help-block">
													Provide State</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Contact<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('nat_contact_no', null, array('class'=>'form-control', 'name'=>'customer_native_references[nat_contact_no]'))!!}
													<span class="help-block">
													Provide Contact</span>
									</div>
								</div>
							</div>
						</div>
						<!-- end of Native references -->
					</div>
					<div id="tab_1_8" class="tab-pane">
						<h3 class="block">General Information</h3>
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label class="control-label col-md-12">Have you ever served a late rent notice?<span class="required">
												* </span>
									</label>
									<div class="col-md-12">
										 {!!Form::text('question_1', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_1]'))!!}
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Do any of the people who would be living in the apartment smoke?<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('question_2', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_2]'))!!}
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">How long do you think you would be txt from us ?<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('question_3', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_3]'))!!}
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Have you ever filed for bankruptcy if so when?<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('question_4', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_4]'))!!}
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">When you would be able to move in ?<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('question_5', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_5]'))!!}
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Have you ever been convicted txt ?<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('question_6', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_6]'))!!}
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Have you ever been served txt notice if so when ?<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('question_7', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_7]'))!!}
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">How many pets do you have(list, type,breed, approx weight& age) ?<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('question_8', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_8]'))!!}
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Have you had any recurring problem with your current apartment or landlord if yes please explain:<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('question_9', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_9]'))!!}
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Why are you moving fom current address?<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('question_10', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_10]'))!!}
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">List any verifiable source and amount of income you txt to have considered.<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('question_11', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_11]'))!!}
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">If you were late financial difficulties in the future and coud't come up with the messy to pay rent, do you know someone would loan you the money? If so provide the person's name address and phone # so that we can use them as a reference for you.<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('question_12', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_12]'))!!}
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Have you been a party to lawsuits in the past ? if you please explain Why ??<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('question_13', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_13]'))!!}
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">We may run a credit check and criminal background check , is there anything negative we will find that you want comment on ? ?<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('question_14', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_14]'))!!}
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">How did you hear about this apartment ?<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('question_15', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_15]'))!!}
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Do you have email address we can reach you at?<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('question_16', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_16]'))!!}
													
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Do you know anybody is looking for an apartment? please provide us their name and number,if you refer a friend and you each end up renting seperate apartment from us then we will pay you referral award.<span class="required">
												* </span>
									</label>
									<div class="col-md-6">
										 {!!Form::text('question_17', null, array('class'=>'form-control', 'name'=>'customer_general_information[question_17]'))!!}
													
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	{!! Form::close() !!}
@endsection