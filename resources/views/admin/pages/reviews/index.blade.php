@extends('admin.layout.home')
@section('content')

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-8 d-block justify-content-center">
                            <h4 class="card-title">Product Review</h4>
                            <p class="card-subtitle mb-4">
                                The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page
                                that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                            </p>
                        </div>
                        <div class="col-lg-4">
                            <div class="text-lg-right mt-3 mt-lg-0">
                                <a href="{{ route('products.create') }}" class="btn btn-danger"><i class="mdi mdi-plus-circle mr-1"></i> Add New</a>
                            </div>
                        </div><!-- end col-->
                    </div> <!-- end row -->
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="datatable-buttons" class="table table-striped dt-responsive nowrap">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Position</th>
                                        <th>Office</th>
                                        <th>Age</th>
                                        <th>Start date</th>
                                        <th>Salary</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Tiger Nixon</td>
                                        <td>System Architect</td>
                                        <td>Edinburgh</td>
                                        <td>61</td>
                                        <td>2011/04/25</td>
                                        <td>$320,800</td>
                                    </tr>
                                    <tr>
                                        <td>Garrett Winters</td>
                                        <td>Accountant</td>
                                        <td>Tokyo</td>
                                        <td>63</td>
                                        <td>2011/07/25</td>
                                        <td>$170,750</td>
                                    </tr>
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