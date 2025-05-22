@extends('admin.layout.home')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Bulk Upload Product</h4>
                        <p class="text-muted">Select File from below to upload bulk products.</p>
                    </div>
                </div>
            </div>
        </div>
        @if (session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif

        @if (session('error'))
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
        @endif

        @if ($errors->any())
            <div class="alert alert-danger">
                <ul class="mb-0">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        <form method="POST" enctype="multipart/form-data" action="{{ route('product.store') }}">
            @csrf
            <div class="row">
                <!-- Left Column -->
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">Product Details</h5>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label>Upload your file (File Type Allowed : .xsls)</label>
                                <input type="file" class="dropify" name="upload_product"
                                    data-allowed-file-extensions="xls xlsx" />
                            </div>
                            <div class="form-group">
                                <button class="btn btn-lg btn-danger" type="submit"><i class="fas fa-upload"></i> Upload
                                    Now</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
@endsection

@section('styles')
    <link href="{{ asset_admin_plugin('dropify/dropify.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset_admin_plugin('sweetalert2/sweetalert2.min.css') }}" rel="stylesheet" type="text/css" />
@endsection

@section('scripts')
    <script src="{{ asset_admin_plugin('dropify/dropify.min.js') }}"></script>
    <script src="{{ asset_admin_plugin('sweetalert2/sweetalert2.min.js') }}"></script>
    <script src="{{ asset_admin_js('fileuploads-demo.js') }}"></script>

    <script>
        $('.dropify').dropify({
            messages: {
                'default': 'Drag and drop an Excel file here or click',
                'replace': 'Drag and drop or click to replace',
                'remove': 'Remove',
                'error': 'Oops, something went wrong.'
            },
            error: {
                'fileExtension': 'Only Excel files are allowed (xls, xlsx).'
            }
        });
    </script>
@endsection
