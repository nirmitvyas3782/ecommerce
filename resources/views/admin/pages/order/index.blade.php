@extends('admin.layout.home')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-8 d-block justify-content-center">
                                <h4 class="card-title">Order List</h4>
                                <p class="card-subtitle mb-4">
                                    You can view the list of orders here. You can also edit or delete any order from this
                                    list.
                                </p>
                            </div>
                        </div> <!-- end row -->
                    </div>
                </div>
                @if (session('success'))
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        {{ session('success') }}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                @endif

                @if (session('failed'))
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        {{ session('failed') }}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                @endif
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="datatable-buttons" class="table table-striped nowrap">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Customer Phone</th>
                                            <th>Order Total</th>
                                            <th>Order Status</th>
                                            <th>Created At</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse($orders as $order)
                                            <tr>
                                                <td>{{ $order->id }}</td>
                                                <td>{{ $order->user_phone }}</td>
                                                <td>{{ $order->total }}</td>
                                                <td>{{ $order->status }}</td>
                                                <td>{{ $order->created_at->format('Y-m-d') }}</td>
                                                <td>
                                                    <a href="{{ route('order.show', $order->id) }}"
                                                        class="btn btn-sm btn-primary">View</a>

                                                    @if ($order->status === 'processing')
                                                        <form action="{{ route('orders.updateStatus', $order->id) }}"
                                                            method="POST" class="d-inline">
                                                            @csrf
                                                            <button type="submit" class="btn btn-success btn-sm">Update
                                                                Status to Completed</button>
                                                        </form>
                                                    @endif
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="4" class="text-center">No categories found.</td>
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

@section('styles')
    <!-- Plugins css -->
    <link href="{{ asset_admin_plugin('datatables/dataTables.bootstrap4.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset_admin_plugin('datatables/responsive.bootstrap4.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset_admin_plugin('datatables/buttons.bootstrap4.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset_admin_plugin('datatables/select.bootstrap4.css') }}" rel="stylesheet" type="text/css" />
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
