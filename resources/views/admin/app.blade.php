<!DOCTYPE html>
<html lang="en">
<head>
	@include('admin.layouts.head')
</head>
<body class="page-header-fixed page-quick-sidebar-over-content page-style-square">

@if(Auth::user())
	@include('admin.layouts.header')
	<div class="clearfix">
	</div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		@include('admin.layouts.sidebar')
		<div class="page-content-wrapper">
			<div class="page-content">
				@include('admin.layouts.messages')
				@yield('content')
			</div>
		</div>
	</div>
@endif

@include('admin.layouts.footer')
<!-- Scripts -->
@include('admin.layouts.differedscript')
@yield('page-scripts')
</body>
</html>