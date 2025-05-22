@extends('admin.layout.home')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-8 d-block justify-content-center">
                                <h4 class="card-title">Application Settings</h4>
                                <p class="card-subtitle mb-4">
                                    Manage core configurations and global preferences that control the behavior and
                                    appearance of your application.
                                </p>
                            </div>
                        </div> <!-- end row -->
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="card mb-6">
                    <div class="card-header">
                        <h5>General Settings</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-12">
                                <ul class="nav nav-tabs" id="settingsTabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="general-tab" data-toggle="tab" href="#general"
                                            role="tab">General</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="email-tab" data-toggle="tab" href="#email"
                                            role="tab">Email</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="admin-appearance-tab" data-toggle="tab"
                                            href="#admin-appearance" role="tab">Admin Appearance</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="manage-users-tab" data-toggle="tab" href="#manage-users"
                                            role="tab">Manage Users</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#currencies">Currencies</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#products">Products</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#digital-products">Digital Products</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#shopping">Shopping</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#checkout">Checkout</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#customers">Customers</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#social-login">Social Links</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#google-analytics">Google Analytics</a>
                                    </li>
                                </ul>
                                <div class="tab-content p-3 border border-top-0">
                                    <div class="tab-pane fade" id="general" role="tabpanel">
                                        @include('admin.pages.settings.parts.general')
                                    </div>

                                    <div class="tab-pane fade" id="email" role="tabpanel">
                                        @include('admin.pages.settings.parts.email')
                                      
                                    </div>

                                    <div class="tab-pane fade show active" id="admin-appearance" role="tabpanel">
                                        @include('admin.pages.settings.parts.appearance')
                                    </div>

                                    <div class="tab-pane fade" id="manage-users" role="tabpanel">
                                        <h4>Manage Users</h4>
                                        <form>
                                            <!-- Your user management form -->
                                        </form>
                                    </div>

                                    <!-- Ecommerce Section -->
                                    <div class="tab-pane fade" id="ecom-general" role="tabpanel">
                                        <h4>Ecommerce - General</h4>
                                        <form>
                                            <!-- Ecommerce general form -->
                                        </form>
                                    </div>
                                    <div class="tab-pane fade" id="currencies" role="tabpanel">
                                        <h4>Currencies</h4>
                                        <form>
                                            <!-- Currency settings -->
                                        </form>
                                    </div>
                                    <div class="tab-pane fade" id="products" role="tabpanel">
                                        <h4>Products</h4>
                                        <form>
                                            <!-- Product settings -->
                                        </form>
                                    </div>
                                    <div class="tab-pane fade" id="product-search" role="tabpanel">
                                        <h4>Product Search</h4>
                                        <form>
                                            <!-- Product search form -->
                                        </form>
                                    </div>
                                    <div class="tab-pane fade" id="digital-products" role="tabpanel">
                                        <h4>Digital Products</h4>
                                        <form>
                                            <!-- Digital product form -->
                                        </form>
                                    </div>
                                    <div class="tab-pane fade" id="shopping" role="tabpanel">
                                        <h4>Shopping</h4>
                                        <form>
                                            <!-- Shopping config -->
                                        </form>
                                    </div>
                                    <div class="tab-pane fade" id="checkout" role="tabpanel">
                                        <h4>Checkout</h4>
                                        <form>
                                            <!-- Checkout options -->
                                        </form>
                                    </div>
                                    <div class="tab-pane fade" id="customers" role="tabpanel">
                                        <h4>Customers</h4>
                                        <form>
                                            <!-- Customer management -->
                                        </form>
                                    </div>
                                    <div class="tab-pane fade" id="social-login" role="tabpanel">
                                        <h4>Social Login</h4>
                                        <form>
                                            <!-- Social login settings -->
                                        </form>
                                    </div>
                                    <div class="tab-pane fade" id="google-analytics" role="tabpanel">
                                        <h4>Google Analytics</h4>
                                        <form>
                                            <!-- Analytics code -->
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>


            </div>
        </div>
    </div>
@endsection


