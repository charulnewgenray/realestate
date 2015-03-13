<!DOCTYPE html>
<html lang="en">
<head>
	@include('layouts.head')
</head>
<body class="page-header-fixed page-quick-sidebar-over-content page-style-square">

@if(Auth::user())
	@include('layouts.header')
	<div class="clearfix">
	</div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		@include('layouts.sidebar')
		<div class="page-content-wrapper">
			<div class="page-content">
				@include('layouts.messages')
				@yield('content')
			</div>
		</div>
	</div>
@endif

@include('layouts.footer')
<!-- Scripts -->
@include('layouts.differedscript')

</body>
</html>