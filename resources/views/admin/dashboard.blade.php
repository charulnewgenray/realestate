@extends('admin.app')

@section('content')
    <div class="row">
        <div class="col-sm-12">
            <h4>Application History</h4>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="dashboard-stat blue-madison">
                <div class="visual">
                    <i class="fa fa-comments"></i>
                </div>
                <div class="details">
                    <div class="number">
                        1349
                    </div>
                    <div class="desc">
                        Draft Application
                    </div>
                </div>
                <a class="more" href="javascript:;">
                    View more <i class="m-icon-swapright m-icon-white"></i>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="dashboard-stat red-intense">
                <div class="visual">
                    <i class="fa fa-bar-chart-o"></i>
                </div>
                <div class="details">
                    <div class="number">
                        12,5M$
                    </div>
                    <div class="desc">
                        Submitted Application
                    </div>
                </div>
                <a class="more" href="javascript:;">
                    View more <i class="m-icon-swapright m-icon-white"></i>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="dashboard-stat green-haze">
                <div class="visual">
                    <i class="fa fa-shopping-cart"></i>
                </div>
                <div class="details">
                    <div class="number">
                        549
                    </div>
                    <div class="desc">
                        Approved Application
                    </div>
                </div>
                <a class="more" href="javascript:;">
                    View more <i class="m-icon-swapright m-icon-white"></i>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="dashboard-stat purple-plum">
                <div class="visual">
                    <i class="fa fa-globe"></i>
                </div>
                <div class="details">
                    <div class="number">
                        +89%
                    </div>
                    <div class="desc">
                        Completed Application
                    </div>
                </div>
                <a class="more" href="javascript:;">
                    View more <i class="m-icon-swapright m-icon-white"></i>
                </a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <h4>Tenant History</h4>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="dashboard-stat blue-madison">
                <div class="visual">
                    <i class="fa fa-comments"></i>
                </div>
                <div class="details">
                    <div class="number">
                        1349
                    </div>
                    <div class="desc">
                        Tenants
                    </div>
                </div>
                <a class="more" href="javascript:;">
                    View more <i class="m-icon-swapright m-icon-white"></i>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="dashboard-stat green-haze">
                <div class="visual">
                    <i class="fa fa-shopping-cart"></i>
                </div>
                <div class="details">
                    <div class="number">
                        549
                    </div>
                    <div class="desc">
                        Pending Tenants
                    </div>
                </div>
                <a class="more" href="javascript:;">
                    View more <i class="m-icon-swapright m-icon-white"></i>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="dashboard-stat purple-plum">
                <div class="visual">
                    <i class="fa fa-globe"></i>
                </div>
                <div class="details">
                    <div class="number">
                        +89%
                    </div>
                    <div class="desc">
                        Canceled Tenants
                    </div>
                </div>
                <a class="more" href="javascript:;">
                    View more <i class="m-icon-swapright m-icon-white"></i>
                </a>
            </div>
        </div>

    </div>
@endsection