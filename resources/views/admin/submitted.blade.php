@extends('app')

@section('content')
    <!-- BEGIN PAGE CONTENT-->
    <div class="row">
        <div class="col-sm-12">
            <div class="note note-success">
                <h4>Load Submitted Application</h4>
                <!--<p>Description</p>-->
            </div>
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
            @foreach($submittedApplication as $submitted)
                <tr>
                    <td>{{$submitted->application_no}}</td>
                    <td>{{$submitted->applicant_email}}</td>
                    <td><a href="{{route('admin.applications.showapplication',['id'=>$submitted->application_no])}}">Load</a></td>
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>
    <!-- END PAGE CONTENT-->
@endsection