@extends('admin.layout.home')
@section('content')

<div class="container-fluid">

    <div class="row">
        <div class="col-lg-6 col-xl-3">
            <div class="card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Total Order Value</h6>
                            <span class="h3 mb-0"> ₹{{ number_format($totalOrderValue, 2) }} </span>
                        </div>
                    </div> <!-- end row -->

                    <div id="sparkline1" class="mt-3"></div>
                </div> <!-- end card-body-->
            </div> <!-- end card-->
        </div> <!-- end col-->
        
        <div class="col-lg-6 col-xl-3">
            <div class="card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Order Received</h6>
                            <span class="h3 mb-0"> {{ $totalOrder }} </span>
                        </div>
                    </div> <!-- end row -->

                    <div id="sparkline2" class="mt-3"></div>
                </div> <!-- end card-body-->
            </div> <!-- end card-->
        </div> <!-- end col-->

        <div class="col-lg-6 col-xl-3">
            <div class="card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Total Products</h6>
                            <span class="h3 mb-0"> {{ $totalProducts }} </span>
                        </div>
                        <div class="col-auto">
                            @if($percentageChange >= 0)
                                <span class="badge badge-soft-success">
                                    +{{ number_format($percentageChange, 1) }}%
                                </span>
                            @else
                                <span class="badge badge-soft-danger">
                                    {{ number_format($percentageChange, 1) }}%
                                </span>
                            @endif
                        </div>
                    </div> <!-- end row -->

                    <div id="sparkline3" class="mt-3"></div>
                </div> <!-- end card-body-->
            </div> <!-- end card-->
        </div> <!-- end col-->

        <div class="col-lg-6 col-xl-3">
            <div class="card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Daily Visits</h6>
                            <span class="h3 mb-0"> {{ $totalVisits }} </span>
                        </div>
                        <div class="col-auto">
                            <span class="badge badge-soft-success">+{{ number_format($visitPercentageChange,1) }}%</span>
                        </div>
                    </div> <!-- end row -->

                    <div id="sparkline4" class="mt-3"></div>
                </div> <!-- end card-body-->
            </div> <!-- end card-->
        </div> <!-- end col-->
    </div>
    <!-- end row-->

    <div class="row">
        <div class="col-xl-4 col-lg-5">
            <div class="card">
                <div class="card-body">
    
                    <h4 class="card-title">All Time Best Products</h4>
                    <p class="card-subtitle mb-4">From date of 1st Jan 2019 to continue</p>

                    <div id="morris-donut-example" class="morris-chart"></div>
    
                </div> <!-- end card-body-->
            </div> <!-- end card-->

        </div> <!-- end col-->

        <div class="col-xl-8 col-lg-7">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Sales Analytics</h4>
                    <p class="card-subtitle mb-4">From date of 1st Jan 2019 to continue</p>

                    <div id="morris-bar-example" class="morris-chart"></div>

                </div>
            </div>
        </div> <!-- end col-->
    </div>
    <!-- end row-->

    <div class="row">
        <div class="col-xl-6">
            <div class="card">
                <div class="card-body">
    
                    <h4 class="card-title">Recent Customers</h4>
                    <p class="card-subtitle mb-4">Transaction period from 21 July to 25 Aug</p>
                    
                    <div class="table-responsive">
                        <table class="table table-centered table-striped table-nowrap">
                            <thead>
                                <tr>
                                    <th>Customer</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Location</th>
                                    <th>Create Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="table-user">
                                        <img src="{{ admin_img('users/avatar-4.jpg') }}" alt="table-user" class="mr-2 avatar-xs rounded-circle">
                                        <a href="javascript:void(0);" class="text-body font-weight-semibold">Paul J. Friend</a>
                                    </td>
                                    <td>
                                        937-330-1634
                                    </td>
                                    <td>
                                        pauljfrnd@jourrapide.com
                                    </td>
                                    <td>
                                        New York
                                    </td>
                                    <td>
                                        07/07/2018
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="table-user">
                                        <img src="{{ admin_img('users/avatar-3.jpg') }}" alt="table-user" class="mr-2 avatar-xs rounded-circle">
                                        <a href="javascript:void(0);" class="text-body font-weight-semibold">Bryan J. Luellen</a>
                                    </td>
                                    <td>
                                        215-302-3376
                                    </td>
                                    <td>
                                        bryuellen@dayrep.com
                                    </td>
                                    <td>
                                        New York
                                    </td>
                                    <td>
                                        09/12/2018
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-user">
                                        <img src="{{ admin_img('users/avatar-8.jpg') }}" alt="table-user" class="mr-2 avatar-xs rounded-circle">
                                        <a href="javascript:void(0);" class="text-body font-weight-semibold">Kathryn S. Collier</a>
                                    </td>
                                    <td>
                                        828-216-2190
                                    </td>
                                    <td>
                                        collier@jourrapide.com
                                    </td>
                                    <td>
                                        Canada
                                    </td>
                                    <td>
                                        06/30/2018
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-user">
                                        <img src="{{ admin_img('users/avatar-1.jpg') }}" alt="table-user" class="mr-2 avatar-xs rounded-circle">
                                        <a href="javascript:void(0);" class="text-body font-weight-semibold">Timothy Kauper</a>
                                    </td>
                                    <td>
                                        (216) 75 612 706
                                    </td>
                                    <td>
                                        thykauper@rhyta.com
                                    </td>
                                    <td>
                                        Denmark
                                    </td>
                                    <td>
                                        09/08/2018
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-user">
                                        <img src="{{ admin_img('users/avatar-5.jpg')}}" alt="table-user" class="mr-2 avatar-xs rounded-circle">
                                        <a href="javascript:void(0);" class="text-body font-weight-semibold">Zara Raws</a>
                                    </td>
                                    <td>
                                        (02) 75 150 655
                                    </td>
                                    <td>
                                        austin@dayrep.com
                                    </td>
                                    <td>
                                        Germany
                                    </td>
                                    <td>
                                        07/15/2018
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </div>

                </div> <!-- end card-body-->
            </div> <!-- end card-->
        </div> <!-- end col -->
        
        <div class="col-xl-6">
            <div class="card">
                <div class="card-body">
    
                    <h4 class="card-title">Account Transactions</h4>
                    <p class="card-subtitle mb-4">Transaction period from 21 July to 25 Aug</p>
                    
                    <div class="table-responsive">
                        <table class="table table-borderless table-hover table-centered table-nowrap mb-0">
                            <tbody>
                                <tr>
                                    <td>
                                        <h5 class="font-size-15 mb-1 font-weight-normal">4257 **** **** 7852</h5>
                                        <span class="text-muted font-size-12">11 April 2019</span>
                                    </td>
                                    <td>
                                        <h5 class="font-size-15 mb-1 font-weight-normal">$79.49</h5>
                                        <span class="text-muted font-size-12">Amount</span>
                                    </td>
                                    <td>
                                        <h5 class="font-size-17 mb-1 font-weight-normal"><i class="fab fa-cc-visa"></i></h5>
                                        <span class="text-muted font-size-12">Card</span>
                                    </td>
                                    <td>
                                        <h5 class="font-size-15 mb-1 font-weight-normal">Helen Warren</h5>
                                        <span class="text-muted font-size-12">Pay</span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <h5 class="font-size-15 mb-1 font-weight-normal">4265 **** **** 0025</h5>
                                        <span class="text-muted font-size-12">28 Jan 2019</span>
                                    </td>
                                    <td>
                                        <h5 class="font-size-15 mb-1 font-weight-normal">$1254.00</h5>
                                        <span class="text-muted font-size-12">Amount</span>
                                    </td>
                                    <td>
                                        <h5 class="font-size-17 mb-1 font-weight-normal"><i class="fab fa-cc-stripe"></i></h5>
                                        <span class="text-muted font-size-12">Card</span>
                                    </td>
                                    <td>
                                        <h5 class="font-size-15 mb-1 font-weight-normal">Kayla Lambie</h5>
                                        <span class="text-muted font-size-12">Pay</span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <h5 class="font-size-15 mb-1 font-weight-normal">5570 **** **** 8547</h5>
                                        <span class="text-muted font-size-12">08 Dec 2018</span>
                                    </td>
                                    <td>
                                        <h5 class="font-size-15 mb-1 font-weight-normal">$784.25</h5>
                                        <span class="text-muted font-size-12">Amount</span>
                                    </td>
                                    <td>
                                        <h5 class="font-size-17 mb-1 font-weight-normal"><i class="fab fa-cc-amazon-pay"></i></h5>
                                        <span class="text-muted font-size-12">Card</span>
                                    </td>
                                    <td>
                                        <h5 class="font-size-15 mb-1 font-weight-normal">Hugo Lavarack</h5>
                                        <span class="text-muted font-size-12">Pay</span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <h5 class="font-size-15 mb-1 font-weight-normal">7845 **** **** 5214</h5>
                                        <span class="text-muted font-size-12">03 Dec 2018</span>
                                    </td>
                                    <td>
                                        <h5 class="font-size-15 mb-1 font-weight-normal">$485.24</h5>
                                        <span class="text-muted font-size-12">Amount</span>
                                    </td>
                                    <td>
                                        <h5 class="font-size-17 mb-1 font-weight-normal"><i class="fab fa-cc-visa"></i></h5>
                                        <span class="text-muted font-size-12">Card</span>
                                    </td>
                                    <td>
                                        <h5 class="font-size-15 mb-1 font-weight-normal">Amber Scurry</h5>
                                        <span class="text-muted font-size-12">Pay</span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <h5 class="font-size-15 mb-1 font-weight-normal">4257 **** **** 7852</h5>
                                        <span class="text-muted font-size-12">12 Nov 2018</span>
                                    </td>
                                    <td>
                                        <h5 class="font-size-15 mb-1 font-weight-normal">$8964.04</h5>
                                        <span class="text-muted font-size-12">Amount</span>
                                    </td>
                                    <td>
                                        <h5 class="font-size-17 mb-1 font-weight-normal"><i class="fab fa-cc-visa"></i></h5>
                                        <span class="text-muted font-size-12">Card</span>
                                    </td>
                                    <td>
                                        <h5 class="font-size-15 mb-1 font-weight-normal">Caitlyn Gibney</h5>
                                        <span class="text-muted font-size-12">Pay</span>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>

                </div> <!-- end card-body-->
            </div> <!-- end card-->
        </div> <!-- end col -->
    </div>
    <!-- end row-->

</div> <!-- container-fluid -->
@endsection

@section('scripts')
    <script src="{{ asset_admin_plugin('jquery-sparkline/jquery.sparkline.min.js') }}"></script>
    <script src="{{ asset_admin_plugin('morris-js/morris.min.js') }}"></script>
    <script src="{{ asset_admin_plugin('raphael/raphael.min.js') }}"></script>
    <script src="{{ asset_admin_js('dashboard-demo.js') }}"></script>

@endsection