<!DOCTYPE html>
<html lang="en">
<head>
	@include('tenant.layouts.head')
</head>
<body class="page-header-fixed page-quick-sidebar-over-content page-style-square">

@if(Auth::user())
	@include('tenant.layouts.header')
	<div class="clearfix">
	</div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		@include('tenant.layouts.sidebar')
		<div class="page-content-wrapper">
			<div class="page-content">
				@include('tenant.layouts.messages')
				@yield('content')
			</div>
		</div>
	</div>
@endif

@include('layouts.footer')
<!-- Scripts -->
@include('tenant.layouts.differedscript')

</body>
</html>