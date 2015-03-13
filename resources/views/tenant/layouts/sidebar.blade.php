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

            <li class="start {{Request::path() == 'admin' ? 'active' : ''}}">
                <a href="javascript:;">
                    <i class="icon-home"></i>
                    <span class="title">Dashboard</span>
                    {{--<span class="selected"></span>--}}
                </a>
            </li>
            <!-- BEGIN ANGULARJS LINK -->
            <li class="tooltips {{Request::path() == 'tenant/applications' ? 'active' : ''}}" data-container="body" data-placement="right" data-html="true">
                <a href="{{url('/tenant/applications')}}">
                    <i class="icon-paper-plane"></i>
                     <span class="title">
                     Applications </span>
                </a>
            </li>
            <li class="tooltips {{Request::path() == 'tenant/work-orders' ? 'active' : ''}}" data-container="body" data-placement="right" data-html="true">
                <a href="{{url('/tenant/work-orders')}}">
                    <i class="icon-paper-plane"></i>
                     <span class="title">
                    Work Order </span>
                </a>
            </li>
            <!-- END ANGULARJS LINK -->
        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
</div>