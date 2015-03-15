@extends('admin.app')

@section('content')
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
				<div class="tab-content">
					<div id="tab_1_1" class="tab-pane active">
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6">
									<label class="col-md-6 control-label">First Name</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->first_name}}
										</p>
									</div>
									<label class="col-md-6 control-label">Middle Name</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->middle_name}}
										</p>
									</div>
									<label class="col-md-6 control-label">Last Name </label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->last_name}}
										</p>
									</div>
									<label class="col-md-6 control-label">Email </label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->email}}
										</p>
									</div>
									<label class="col-md-6 control-label">Birth Date</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->dob}}
										</p>
									</div>
								</div>
								<div class="col-sm-6">

									<label class="col-md-6 control-label">Social Security</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->social_security}}
										</p>
									</div>
									<label class="col-md-6 control-label">Driver Licence </label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->driver_licence}}
										</p>
									</div>
									<label class="col-md-6 control-label">Any Other Name you used in Past </label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->past_name}}
										</p>
									</div>
									<label class="col-md-6 control-label">Home Phone</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->home_phone}}
										</p>
									</div>
									<label class="col-md-6 control-label">Cell Phone</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cell_phone}}
										</p>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div id="tab_1_2" class="tab-pane">
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6">
									<label class="col-md-6 control-label">All Other Perposel Occupants</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->occupant_name}}
										</p>
									</div>
									<label class="col-md-6 control-label">Occupant Relationship</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->occupant_relationship}}
										</p>
									</div>
								</div>
								<div class="col-sm-6">

									<label class="col-md-6 control-label">Occupant DOB</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->occupant_dob}}
										</p>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div id="tab_1_3" class="tab-pane">
						<div class="page-header"><h3>Current Residence History</h3></div>
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Street Address</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_address}}
										</p>
									</div>
									<label class="col-md-6 control-label">City </label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_city}}
										</p>
									</div>
									<label class="col-md-6 control-label">Last Rent Amount Paid</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_last_amount_paid}}
										</p>
									</div>
									<label class="col-md-6 control-label">Owner</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_owner}}
										</p>
									</div>
									<label class="col-md-6 control-label">Phone No</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_phone_no}}
										</p>
									</div>
									<label class="col-md-6 control-label">Reason for leaving</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_reason_for_leaving}}
										</p>
									</div>
								</div>
								<div class="col-sm-6">
									<label class="col-md-6 control-label">State</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_state}}
										</p>
									</div>
									<label class="col-md-6 control-label">Is/Was pent paid in full</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_rent_paid_full}}
										</p>
									</div>
									<label class="col-md-6 control-label">Did you give notice</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_give_notice}}
										</p>
									</div>
									<label class="col-md-6 control-label">Where you asked to move</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_asked_to_move}}
										</p>
									</div>
									<label class="col-md-6 control-label">Name in which your utilities are now billed</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_utilities}}
										</p>
									</div>
									<label class="col-md-6 control-label">Date of residency From</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_residence_from}}
										</p>
									</div>
									<label class="col-md-6 control-label">Date of residency To</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_residence_to}}
										</p>
									</div>
								</div>
							</div>

						</div>
						
						
						<!-- start previous residence -->
						<div class="page-header"><h3>Previous Residence History</h3></div>
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Street Address</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_address}}
										</p>
									</div>
									<label class="col-md-6 control-label">City </label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_city}}
										</p>
									</div>
									<label class="col-md-6 control-label">Last Rent Amount Paid</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_last_amount_paid}}
										</p>
									</div>
									<label class="col-md-6 control-label">Owner</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_owner}}
										</p>
									</div>
									<label class="col-md-6 control-label">Phone No</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_phone_no}}
										</p>
									</div>
									<label class="col-md-6 control-label">Reason for leaving</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_reason_for_leaving}}
										</p>
									</div>
								</div>
								<div class="col-sm-6">
									<label class="col-md-6 control-label">State</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_state}}
										</p>
									</div>
									<label class="col-md-6 control-label">Is/Was pent paid in full</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_rent_paid_full}}
										</p>
									</div>
									<label class="col-md-6 control-label">Did you give notice</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_give_notice}}
										</p>
									</div>
									<label class="col-md-6 control-label">Where you asked to move</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_asked_to_move}}
										</p>
									</div>
									<label class="col-md-6 control-label">Name in which your utilities are now billed</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_utilities}}
										</p>
									</div>
									<label class="col-md-6 control-label">Date of residency From</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_residence_from}}
										</p>
									</div>
									<label class="col-md-6 control-label">Date of residency To</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_residence_to}}
										</p>
									</div>
								</div>
							</div>

						</div>
						<!-- end previous residence -->
						
						<!-- start prior residence -->
						<div class="page-header"><h3>Prior Residence History</h3></div>
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Street Address</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_address}}
										</p>
									</div>
									<label class="col-md-6 control-label">City </label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_city}}
										</p>
									</div>
									<label class="col-md-6 control-label">Last Rent Amount Paid</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_last_amount_paid}}
										</p>
									</div>
									<label class="col-md-6 control-label">Owner</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_owner}}
										</p>
									</div>
									<label class="col-md-6 control-label">Phone No</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_phone_no}}
										</p>
									</div>
									<label class="col-md-6 control-label">Reason for leaving</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_reason_for_leaving}}
										</p>
									</div>
								</div>
								<div class="col-sm-6">
									<label class="col-md-6 control-label">State</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_state}}
										</p>
									</div>
									<label class="col-md-6 control-label">Is/Was pent paid in full</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_rent_paid_full}}
										</p>
									</div>
									<label class="col-md-6 control-label">Did you give notice</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_give_notice}}
										</p>
									</div>
									<label class="col-md-6 control-label">Where you asked to move</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_asked_to_move}}
										</p>
									</div>
									<label class="col-md-6 control-label">Name in which your utilities are now billed</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_utilities}}
										</p>
									</div>
									<label class="col-md-6 control-label">Date of residency From</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_residence_from}}
										</p>
									</div>
									<label class="col-md-6 control-label">Date of residency To</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_residence_to}}
										</p>
									</div>
								</div>
							</div>

						</div>
						<!-- end prior residence -->
						
						
					</div>
					<div id="tab_1_4" class="tab-pane">
						<!-- start Current Employment -->
						<div class="page-header"><h3>Current Employment History</h3></div>
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Company</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_emp_company}}
										</p>
									</div>
									<label class="col-md-6 control-label">Name of Supervisor</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_emp_supervisor}}
										</p>
									</div>
									<label class="col-md-6 control-label">Monthly Gross Pay</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_emp_gross_pay}}
										</p>
									</div>
									<label class="col-md-6 control-label">Date of Employment From</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_emp_employment_from}}
										</p>
									</div>
									<label class="col-md-6 control-label">Date of employment To</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_emp_employment_to}}
										</p>
									</div>
								</div>
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Street Address</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_emp_address}}
										</p>
									</div>
									<label class="col-md-6 control-label">Phone No</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_emp_phone_no}}
										</p>
									</div>
									<label class="col-md-6 control-label">Occupation</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cur_emp_occupation}}
										</p>
									</div>
								</div>
							</div>

						</div>
						<!-- end Current Employment -->
						
						<!-- start Previous Employment -->
						<div class="page-header"><h3>Previous Employment History</h3></div>
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Company</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_emp_company}}
										</p>
									</div>
									<label class="col-md-6 control-label">Name of Supervisor</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_emp_supervisor}}
										</p>
									</div>
									<label class="col-md-6 control-label">Monthly Gross Pay</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_emp_gross_pay}}
										</p>
									</div>
									<label class="col-md-6 control-label">Date of Employment From</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_emp_employment_from}}
										</p>
									</div>
									<label class="col-md-6 control-label">Date of employment To</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_emp_employment_to}}
										</p>
									</div>
								</div>
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Street Address</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_emp_address}}
										</p>
									</div>
									<label class="col-md-6 control-label">Phone No</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_emp_phone_no}}
										</p>
									</div>
									<label class="col-md-6 control-label">Occupation</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pre_emp_occupation}}
										</p>
									</div>
								</div>
							</div>

						</div>
						<!-- end Previous Employment -->
						
						<!-- start privious Employment -->
						<div class="page-header"><h3>Prior Employment History</h3></div>
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Company</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_emp_company}}
										</p>
									</div>
									<label class="col-md-6 control-label">Name of Supervisor</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_emp_supervisor}}
										</p>
									</div>
									<label class="col-md-6 control-label">Monthly Gross Pay</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_emp_gross_pay}}
										</p>
									</div>
									<label class="col-md-6 control-label">Date of Employment From</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_emp_employment_from}}
										</p>
									</div>
									<label class="col-md-6 control-label">Date of employment To</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_emp_employment_to}}
										</p>
									</div>
								</div>
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Street Address</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_emp_address}}
										</p>
									</div>
									<label class="col-md-6 control-label">Phone No</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_emp_phone_no}}
										</p>
									</div>
									<label class="col-md-6 control-label">Occupation</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->pri_emp_occupation}}
										</p>
									</div>
								</div>
							</div>

						</div>
						<!-- end Prior Employment -->
						
					</div>
					<div id="tab_1_5" class="tab-pane">
						<!-- start saving credit -->
						<div class="page-header"><h3>Saving Credit History</h3></div>
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Bank/Institution Name</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->sav_bank_name}}
										</p>
									</div>
								</div>
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Balance On Deposit or Balance Owed</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->sav_balance}}
										</p>
									</div>
								</div>
							</div>

						</div>
						<!-- end saving credit history -->
						<!-- start checking credit -->
						<div class="page-header"><h3>Cheking Credit History</h3></div>
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Bank/Institution Name</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->che_bank_name}}
										</p>
									</div>
								</div>
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Balance On Deposit or Balance Owed</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->che_balance}}
										</p>
									</div>
								</div>
							</div>

						</div>
						<!-- end checking credit history -->
						<!-- start credit credit -->
						<div class="page-header"><h3>Credit Credit History</h3></div>
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Bank/Institution Name</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cre_bank_name}}
										</p>
									</div>
								</div>
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Balance On Deposit or Balance Owed</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->cre_balance}}
										</p>
									</div>
								</div>
							</div>

						</div>
						<!-- end credit credit history -->
						<!-- start credit credit -->
						<div class="page-header"><h3>Auto Credit History</h3></div>
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Bank/Institution Name</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->aut_bank_name}}
										</p>
									</div>
								</div>
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Balance On Deposit or Balance Owed</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->aut_balance}}
										</p>
									</div>
								</div>
							</div>

						</div>
						<!-- end auto credit history -->
					</div>
					<div id="tab_1_6" class="tab-pane">
						<!-- start vehicle -->
						<div class="page-header"><h3>Vehicle</h3></div>
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Make</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->make}}
										</p>
									</div>
									<label class="col-md-6 control-label">Model</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->model}}
										</p>
									</div>
									<label class="col-md-6 control-label">Year</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->year}}
										</p>
									</div>
								</div>
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Color</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->color}}
										</p>
									</div>
									<label class="col-md-6 control-label">Licence</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->licence}}
										</p>
									</div>
								</div>
							</div>

						</div>
						<!-- vehicle -->
					</div>
					<div id="tab_1_7" class="tab-pane">
						<!-- start Doctor References  -->
						<div class="page-header"><h3>Doctor References</h3></div>
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Name</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->doc_name}}
										</p>
									</div>
									<label class="col-md-6 control-label">City</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->doc_city}}
										</p>
									</div>
									<label class="col-md-6 control-label">Zip Code </label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->doc_zip_code}}
										</p>
									</div>
								</div>
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Street Address </label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->doc_address}}
										</p>
									</div>
									<label class="col-md-6 control-label">State</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->doc_state}}
										</p>
									</div>
									<label class="col-md-6 control-label">Contact</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->doc_contact_no}}
										</p>
									</div>
								</div>
							</div>

						</div>
						<!-- Doctor References -->
						<!-- start Lawyer  References  -->
						<div class="page-header"><h3>Lawyer References</h3></div>
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Name</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->law_name}}
										</p>
									</div>
									<label class="col-md-6 control-label">City</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->law_city}}
										</p>
									</div>
									<label class="col-md-6 control-label">Zip Code </label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->law_zip_code}}
										</p>
									</div>
								</div>
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Street Address </label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->law_address}}
										</p>
									</div>
									<label class="col-md-6 control-label">State</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->law_state}}
										</p>
									</div>
									<label class="col-md-6 control-label">Contact</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->law_contact_no}}
										</p>
									</div>
								</div>
							</div>

						</div>
						<!-- Lawyer  References -->
						<!-- start Native References  -->
						<div class="page-header"><h3>Native References</h3></div>
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Name</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->nat_name}}
										</p>
									</div>
									<label class="col-md-6 control-label">City</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->nat_city}}
										</p>
									</div>
									<label class="col-md-6 control-label">Zip Code </label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->nat_zip_code}}
										</p>
									</div>
								</div>
								<div class="col-sm-6">
									<label class="col-md-6 control-label">Street Address </label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->nat_address}}
										</p>
									</div>
									<label class="col-md-6 control-label">State</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->nat_state}}
										</p>
									</div>
									<label class="col-md-6 control-label">Contact</label>
									<div class="col-md-6">
										<p class="form-control-static">
											{{$personalInformation->nat_contact_no}}
										</p>
									</div>
								</div>
							</div>

						</div>
						<!-- Native  References -->
					</div>
					<div id="tab_1_8" class="tab-pane">
						<!-- start Native References  -->
						<div class="page-header"><h3>General Information</h3></div>
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-12">
									<label class="col-md-12 control-label">Have you ever served a late rent notice?</label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_1}}
										</p>
									</div>
									<label class="col-md-12 control-label">Do any of the people who would be living in the apartment smoke?</label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_2}}
										</p>
									</div>
									<label class="col-md-12 control-label">How long do you think you would be txt from us ?</label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_3}}
										</p>
									</div>
								
								
									<label class="col-md-12 control-label">Have you ever filed for bankruptcy if so when?</label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_4}}
										</p>
									</div>
									<label class="col-md-12 control-label">When you would be able to move in ?</label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_5}}
										</p>
									</div>
									<label class="col-md-12 control-label">Have you ever been convicted txt ?</label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_6}}
										</p>
									</div>
									<label class="col-md-12 control-label">Have you ever been served txt notice if so when ?</label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_7}}
										</p>
									</div>
									<label class="col-md-12 control-label">How many pets do you have(list, type,breed, approx weight& age) ?</label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_8}}
										</p>
									</div>
									<label class="col-md-12 control-label">Have you had any recurring problem with your current apartment or landlord if yes please explain:</label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_9}}
										</p>
									</div>
									<label class="col-md-12 control-label">Why are you moving fom current address?</label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_10}}
										</p>
									</div>
									<label class="col-md-12 control-label">List any verifiable source and amount of income you txt to have considered</label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_11}}
										</p>
									</div>
									<label class="col-md-12 control-label">If you were late financial difficulties in the future and coud't come up with the messy to pay rent, do you know someone would loan you the money? If so provide the person's name address and phone # so that we can use them as a reference for you</label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_12}}
										</p>
									</div>
									<label class="col-md-12 control-label">Have you been a party to lawsuits in the past ? if you please explain Why ??</label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_13}}
										</p>
									</div>
									<label class="col-md-12 control-label">We may run a credit check and criminal background check , is there anything negative we will find that you want comment on ? ?</label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_14}}
										</p>
									</div>
									<label class="col-md-12 control-label">How did you hear about this apartment ?</label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_15}}
										</p>
									</div>
									<label class="col-md-12 control-label">Do you have email address we can reach you at? </label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_16}}
										</p>
									</div>
									<label class="col-md-12 control-label">Do you know anybody is looking for an apartment? please provide us their name and number,if you refer a friend and you each end up renting seperate apartment from us then we will pay you referral award</label>
									<div class="col-md-12">
										<p class="form-control-static">
											{{$personalInformation->question_17}}
										</p>
									</div>
								</div>
							</div>

						</div>
						<!-- Native  References -->
					</div>
				</div>
			</div>
		</div>
	</div>

@endsection