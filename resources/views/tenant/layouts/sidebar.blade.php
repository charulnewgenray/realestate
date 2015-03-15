<div class="page-sidebar-wrapper">
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <ul class="page-sidebar-menu" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
            <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
            <li class="sidebar-toggler-wrapper">
                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                <div class="sidebar-toggler">
                </div>
                <!-- END SIDEBAR TOGGLER BUTTON -->
            </li>
            <!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->
            <li class="sidebar-search-wrapper">
                <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                <!-- DOC: Apply "sidebar-search-bordered" class the below search form to have bordered search box -->
                <!-- DOC: Apply "sidebar-search-bordered sidebar-search-solid" class the below search form to have bordered & solid search box -->
                <form class="sidebar-search " action="extra_search.html" method="POST">
                    <a href="javascript:;" class="remove">
                        <i class="icon-close"></i>
                    </a>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search...">
							<span class="input-group-btn">
							<a href="javascript:;" class="btn submit"><i class="icon-magnifier"></i></a>
							</span>
                    </div>
                </form>
                <!-- END RESPONSIVE QUICK SEARCH FORM -->
            </li>
            <li class="start {{Request::path() == 'admin' ? 'active' : ''}}">
                <a href="javascript:;">
                    <i class="icon-home"></i>
                    <span class="title">Dashboard</span>
                    {{--<span class="selected"></span>--}}
                </a>
            </li>
            <!-- BEGIN ANGULARJS LINK -->
            <li class="tooltips {{Request::path() == 'admin/applications' ? 'active' : ''}}" data-container="body" data-placement="right" data-html="true" data-original-title="Applications">
                <a href="{{url('/admin/applications')}}">
                    <i class="icon-pencil"></i>
                     <span class="title">
                     Applications </span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="{{route('tenant.applications.draft')}}">
                            Draft Application</a>
                    </li>
                    <li>
                        <a href="{{route('tenant.applications.submitted')}}">
                            Submitted Application</a>
                    </li>
                </ul>
            </li>
            <li class="{{strpos(Request::path(),'tenant/work-order') !== false  ? 'active' : ''}}" data-container="body" data-placement="right" data-html="true">
                <a href="{{url('/admin/work-order')}}">
                    <i class="icon-envelope"></i>
                    <span class="title">Work Order </span>
                </a>
                <ul class="sub-menu">
                    <li class="{{Request::path() == 'tenant/work-order' ? 'active' : ''}}">
                        <a  href="{{URL::route('tenant.workorders.new')}}">
                            <i class="icon-speech"></i>
                            New Request</a>
                    </li>
                    <li class="{{Request::path() == 'tenant/work-orders' ? 'active' : ''}}">
                        <a href="{{URL::route('tenant.workorders')}}">
                            <i class="icon-eye"></i>
                            Requests</a>
                    </li>
                </ul>
            </li>
            <!-- END ANGULARJS LINK -->
        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
</div>