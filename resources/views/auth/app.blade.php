<!DOCTYPE html>
<html lang="en">
<head>
    @include('auth.head')
</head>
<body class="login">
    <div class="logo">
        <a href="index.html">
            <img src="/assets/admin/layout/img/logo-big.png" alt=""/>
        </a>
    </div>
    <div class="content">
        @if (count($errors) > 0)
            <div class="alert alert-danger">
                <strong>Whoops!</strong> There were some problems with your input.<br><br>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        @yield('content')
    </div>
@include('auth.footer')
</body>
</html>