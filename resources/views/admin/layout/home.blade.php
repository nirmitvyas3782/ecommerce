<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>{{ $data['title'] }}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="MyraStudio" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">
    @yield('styles')
    <!-- App css -->
    <link href="{{ asset_admin_plugin('switchery/switchery.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset_admin_css('bootstrap.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset_admin_css('icons.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset_admin_css('theme.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset_admin_css('custom.css') }}" rel="stylesheet" type="text/css" />
</head>

<body>

    <div id="layout-wrapper">
        @include('admin.parts.sidebar')
        <div class="main-content">
            @include('admin.parts.header')
            <div class="page-content">
                @yield('content')
            </div>
            @include('admin.parts.footer')
        </div>
    </div>

    <!-- Overlay-->
    <div class="menu-overlay"></div>

    <!-- jQuery  -->
    <script src="{{ asset_admin_js('jquery.min.js') }}"></script>
    <script src="{{ asset_admin_js('bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset_admin_js('metismenu.min.js') }}"></script>
    <script src="{{ asset_admin_js('waves.js') }}"></script>
    <script src="{{ asset_admin_js('simplebar.min.js') }}"></script>
    
    <!-- App js -->
    <!-- Page-specific JS -->
    @yield('scripts')
    <script src="{{ asset_admin_plugin('switchery/switchery.min.js') }}"></script>

    <script src="{{ asset_admin_js('theme.js') }}"></script>
    <script>
        // Switchery
        $('[data-toggle="switchery"]').each(function(idx, obj) {
            new Switchery($(this)[0], $(this).data());
        });
    </script>
     
</body>
