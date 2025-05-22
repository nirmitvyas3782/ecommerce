<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Deedy - Admin Panel</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="MyraStudio" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- App css -->
        <link href="{{ asset('admin/css/bootstrap.min.css') }} " rel="stylesheet" type="text/css" />
        <link href="{{ asset('admin/css/icons.min.css') }} " rel="stylesheet" type="text/css" />
        <link href="{{ asset('admin/css/theme.min.css') }} " rel="stylesheet" type="text/css" />

    </head>
    <body>

    <div class="bg-primary">
        @yield('content')
    </div>
        <script src="{{ asset('admin/js/jquery.min.js') }} "></script>
        <script src="{{ asset('admin/js/bootstrap.bundle.min.js') }} "></script>
        <script src="{{ asset('admin/js/metismenu.min.js') }} "></script>
        <script src="{{ asset('admin/js/waves.js') }} "></script>
        <script src="{{ asset('admin/js/simplebar.min.js') }} "></script>
        <!-- App js -->
        <script src="{{ asset('admin/js/theme.js') }} "></script>
    </body>