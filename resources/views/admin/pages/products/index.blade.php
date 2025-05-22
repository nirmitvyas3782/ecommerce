@extends('admin.layout.home')
@section('content')

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-8 d-block justify-content-center">
                            <h4 class="card-title">Product List</h4>
                            <p class="card-subtitle mb-4">
                                Easily view, manage, and interact with your products using helpful table tools and quick-action buttons.
                            </p>
                        </div>
                        <div class="col-lg-4">
                            <div class="text-lg-right mt-3 mt-lg-0">
                                <a href="{{ route('product.create') }}" class="btn btn-danger"><i class="mdi mdi-plus-circle mr-1"></i> Add New</a>
                            </div>
                        </div><!-- end col-->
                    </div> <!-- end row -->
                </div>
            </div>
                @if (session('success'))
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        {{ session('success') }}
                    </div>
                @endif

                @if (session('failed'))
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        {{ session('failed') }}
                    </div>
                @endif
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="datatable-buttons" class="table table-striped nowrap">
                                <thead>
                                    <tr>
                                        <th>Product Image</th>
                                        <th>Product Name</th>
                                        <th>Vendor Code</th>
                                        <th>Quantity Range</th>
                                        <th>Price Range</th>
                                        <th>Materials</th>
                                        <th>Created at</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        
                                        @forelse ($products as $product)
                                        <td><img src="{{ asset('upload/product_images').'/'.$product->image_name }}" width="60"/></td>
                                        <td>{{ $product->product_name }}</td>
                                        <td>{{ $product->vendor_code }}</td>
                                        <td>{{ $product->quantity_range }}</td>
                                        <td>{{ $product->product_price}}</td>
                                        <td>{{ $product->material }}</td>
                                        <td>{{ $product->created_at->format('Y-m-d') }}</td>
                                    </tr>
                                    @empty
                                        <tr>
                                            <td colspan="6" class="text-center">No vendors found.</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div> <!-- end row -->
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

@section('scripts')
<!-- third party js -->
<script src="{{ asset_admin_plugin('datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset_admin_plugin('datatables/dataTables.bootstrap4.js') }}"></script>
<script src="{{ asset_admin_plugin('datatables/dataTables.responsive.min.js') }}"></script>
<script src="{{ asset_admin_plugin('datatables/responsive.bootstrap4.min.js') }}"></script>
<script src="{{ asset_admin_plugin('datatables/dataTables.buttons.min.js') }}"></script>
<script src="{{ asset_admin_plugin('datatables/buttons.bootstrap4.min.js') }}"></script>
<script src="{{ asset_admin_plugin('datatables/buttons.html5.min.js') }}"></script>
<script src="{{ asset_admin_plugin('datatables/buttons.flash.min.js') }}"></script>
<script src="{{ asset_admin_plugin('datatables/buttons.print.min.js') }}"></script>
<script src="{{ asset_admin_plugin('datatables/dataTables.keyTable.min.js') }}"></script>
<script src="{{ asset_admin_plugin('datatables/dataTables.select.min.js') }}"></script>
<script src="{{ asset_admin_plugin('datatables/pdfmake.min.js') }}"></script>
<script src="{{ asset_admin_plugin('datatables/vfs_fonts.js') }}"></script>
<script src="{{ asset_admin_js('datatables-demo.js') }} "></script>
@endsection

@section('styles')

 <!-- Plugins css -->
 <link href="{{ asset_admin_plugin('datatables/dataTables.bootstrap4.css') }}" rel="stylesheet" type="text/css" />
 <link href="{{ asset_admin_plugin('datatables/responsive.bootstrap4.css') }}" rel="stylesheet" type="text/css" />
 <link href="{{ asset_admin_plugin('datatables/buttons.bootstrap4.css') }}" rel="stylesheet" type="text/css" />
 <link href="{{ asset_admin_plugin('datatables/select.bootstrap4.css') }}" rel="stylesheet" type="text/css" />

@endsection