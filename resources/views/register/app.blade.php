<!DOCTYPE html>
<html lang="en">
<head>
    @include('register.layouts.head')
</head>
<body class="corporate">


    <div class="clearfix">
    </div>
    <!-- BEGIN CONTAINER -->
    @include('register.layouts.header')
    <div class="main register-main">
        <div class="container">
            <div class="page-content">
                @include('register.layouts.messages')
                @yield('content')
            </div>
        </div>
    </div>


@include('register.layouts.footer')
<!-- Scripts -->
@include('register.layouts.differedscript')
@yield('page-script')

</body>
</html>