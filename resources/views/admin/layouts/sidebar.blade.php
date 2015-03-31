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
            <li class="start {{Request::path() == '/admin' ? 'active' : ''}}">
                <a href="{{route('admin.dashboard.index')}}">
                    <i class="icon-home"></i>
                    <span class="title">Dashboard</span>
                </a>
            </li>
             <li class="{{strpos(Request::path(),'admin/applications') !== false  ? 'active' : ''}}" data-container="body" data-placement="right" data-html="true">
                <a href="{{url('/admin/applications')}}">
                    <i class="icon-paper-plane"></i>
                     <span class="title">
                     Applications </span>
                </a>
                <ul class="sub-menu">
                    {{--<li>{{Request::path() }}</li>--}}
                    <li class="{{Request::path() == 'admin/applications/draft' ? 'active' : ''}}">
                        <a href="{{route('admin.applications.draft')}}">
                            Draft Application</a>
                    </li>
                    <li class="{{Request::path() == 'admin/applications/submitted' ? 'active' : ''}}">
                        <a href="{{route('admin.applications.submitted')}}">
                            Submitted Application</a>
                    </li>
                    <li class="{{Request::path() == 'admin/applications/accepted' ? 'active' : ''}}">
                        <a href="{{route('admin.applications.accepted')}}">
                            Approved Application</a>
                    </li>
				</ul>
            </li>
            <li class="{{strpos(Request::path(),'admin/work-order') !== false  ? 'active' : ''}}" data-container="body" data-placement="right" data-html="true">
                <a href="{{url('/admin/work-order')}}">
                    <i class="icon-envelope"></i>
                    <span class="title">Work Order </span>
                </a>
                <ul class="sub-menu">
                    <li class="{{Request::path() == 'admin/work-orders' ? 'active' : ''}}">
                        <a href="{{URL::route('admin.workorders')}}">
                            <i class="icon-eye"></i>
                            Requests</a>
                    </li>
                    <li class="{{Request::path() == 'admin/work-orders/settings' ? 'active' : ''}}">
                        <a href="{{URL::route('admin.workorders.settings')}}">
                            <i class="icon-settings"></i>
                            Settings</a>
                    </li>
                </ul>
            </li>
            <li class="{{Request::path() == 'admin/general/settings' ? 'active' : ''}}">
                <a href="{{URL::route('admin.general.settings')}}">
                    <i class="icon-settings"></i>
                    Settings</a>
            </li>
            <li class="{{Request::path() == 'admin/form/settings' ? 'active' : ''}}">
                <a href="{{URL::route('admin.form.settings')}}">
                    <i class="icon-settings"></i>
                    Form Settings</a>
            </li>

            <li class="{{strpos(Request::path(),'admin/applications') !== false  ? 'active' : ''}}" data-container="body" data-placement="right" data-html="true">
                <a href="{{url('/admin/applications')}}">
                    <i class="icon-paper-plane"></i>
                     <span class="title">
                     Tenants </span>
                </a>
                <ul class="sub-menu">
                    {{--<li>{{Request::path() }}</li>--}}
                    <li class="{{Request::path() == 'admin/tenant/active' ? 'active' : ''}}">
                        <a href="{{route('admin.tenant.active')}}">
                            Tenants</a>
                    </li>
                    <li class="{{Request::path() == 'admin/tenant/pending' ? 'active' : ''}}">
                        <a href="{{route('admin.tenant.pending')}}">
                            Pending</a>
                    </li>
                    <li class="{{Request::path() == 'admin/tenant/canceled' ? 'active' : ''}}">
                        <a href="{{route('admin.tenant.canceled')}}">
                            Canceled</a>
                    </li>
                </ul>
            </li>

            <!-- END ANGULARJS LINK -->


        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
</div>