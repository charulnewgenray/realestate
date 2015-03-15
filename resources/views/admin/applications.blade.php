@extends('admin.app')

@section('content')
    <!-- BEGIN PAGE CONTENT-->
    <div class="row">
        <div class="col-md-12">
            <div class="note note-danger">
                <p>
                    NOTE: The below datatable is not connected to a real database so the filter and sorting is just simulated for demo purposes only.
                </p>
            </div>
            <!-- Begin: life time stats -->
            <div class="portlet">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-shopping-cart"></i>Application Listing
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-container">
                        <div class="table-actions-wrapper">
									<span>
									</span>
                            <select class="table-group-action-input form-control input-inline input-small input-sm">
                                <option value="">Select...</option>
                                <option value="Cancel">Cancel</option>
                                <option value="Cancel">Hold</option>
                                <option value="Cancel">On Hold</option>
                                <option value="Close">Close</option>
                            </select>
                            <button class="btn btn-sm yellow table-group-action-submit"><i class="fa fa-check"></i> Submit</button>
                        </div>
                        <table class="table table-striped table-bordered table-hover" id="datatable_ajax">
                            <thead>
                            <tr role="row" class="heading">
                                <th width="2%">
                                    <input type="checkbox" class="group-checkable">
                                </th>

                                <th width="15%">
                                    Customer Name
                                </th>
                                <th width="15%">
                                    Email
                                </th>
                                <th width="20%">
                                    Propety Name
                                </th>
                                <th width="15%">
                                    Date
                                </th>
                                <th width="10%">
                                    Status
                                </th>
                                <th width="10%">
                                    Actions
                                </th>
                            </tr>
                            <tr role="row" class="filter">
                                <td>
                                </td>

                                <td>
                                    <input type="text" class="form-control form-filter input-sm" name="customer_name" id="customer_name">
                                </td>
                                <td>
                                    <input type="text" class="form-control form-filter input-sm" name="email" id="email">
                                </td>
                                <td>
                                    <input type="text" class="form-control form-filter input-sm" name="property_name" id="property_name">
                                </td>
                                <td>
                                    <div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
                                        <input type="text" class="form-control form-filter input-sm" readonly name="order_date_from" placeholder="From">
											<span class="input-group-btn">
											<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
											</span>
                                    </div>
                                    <div class="input-group date date-picker" data-date-format="dd/mm/yyyy">
                                        <input type="text" class="form-control form-filter input-sm" readonly name="order_date_to" placeholder="To">
											<span class="input-group-btn">
											<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
											</span>
                                    </div>
                                </td>
                                <td>
                                    <select name="order_status" class="form-control form-filter input-sm">
                                        <option value="">Select...</option>
                                        <option value="pending">Pending</option>
                                        <option value="closed">Closed</option>
                                        <option value="hold">On Hold</option>
                                        <option value="fraud">Fraud</option>
                                    </select>
                                </td>
                                <td>
                                    <div class="margin-bottom-5">
                                        <button id="search" class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> Search</button>
                                    </div>
                                    <button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i> Reset</button>
                                </td>
                            </tr>
                            </thead>
                            <tbody>

                                    @foreach($applications as $key => $application)
                                        <tr role="row">
                                            <td>
                                                <div class="checker"><span><input type="checkbox" name="id[]" value="1"></span></div>
                                            </td>

                                            <td>
                                                {{$application->display_name}}
                                            </td>
                                            <td>
                                                {{$application->user_email}}
                                            </td>
                                            <td>
                                                {{$application->post_title}}
                                            </td>
                                            <td>
                                                {{$application->post_date}}
                                            </td>
                                            <td></td>
                                            <td><a href="show/{{$application->property_id}}" class="btn btn-xs default"><i class="fa fa-search"></i> View</a></td>
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