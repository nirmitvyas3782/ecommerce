 <!-- ========== Left Sidebar Start ========== -->
 <div class="vertical-menu">

    <div data-simplebar class="h-100">

        <!-- LOGO -->
        <div class="navbar-brand-box">
            <a href="index.html" class="logo">
                <span>
                    <img src="{{ admin_img('logo-dark.png')}}" alt="" height="15">
                </span>
                <i>
                    <img src="{{ admin_img('logo-small.png')}}" alt="" height="24">
                </i>
            </a>
        </div>

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">
                <li class="menu-title">Menu</li>

                <li>
                    <a href="{{ route('dashboard.index') }}"><i class="feather-home"></i><span class="badge badge-pill badge-success float-right">1</span><span>Dashboard</span></a>
                </li>
                
                <li class="menu-title">Content</li>

                <li>
                    <a href="{{ route('image_gallary.index') }}"><i class="feather-image"></i><span>Image Gallary</span></a>
                </li>
                <li>
                    <a href="{{ route('content.index') }}"><i class="feather-image"></i><span>Contents</span></a>
                </li>
                
                <li class="menu-title">Products</li>

                <li>
                    <a href="{{ route('product.index') }}"><i class="fab fa-product-hunt"></i><span>Products</span></a>
                </li>
                <li>
                    <a href="{{ route('category.index') }}"><i class="fas fa-list"></i><span>Categories</span></a>
                </li>

                <li class="menu-title">eCommerce</li>

                <li>
                    <a href="#"><i class="feather-shopping-bag"></i><span>Orders</span></a>
                </li>
                <li>
                    <a href="#"><i class="fas fa-star-half-alt"></i><span>Product Reivews</span></a>
                </li>
                <li>
                    <a href="#"><i class="far fa-user"></i><span>Users</span></a>
                </li>

                <li class="menu-title">Others</li>        

                <li>
                    <a href="#"><i class="feather-activity"></i><span>Activity Log</span></a>
                </li>
                
                <li class="menu-title">Log Out</li>  
                
                <li>
                    <a href="#"><i class="feather-log-out"></i><span>Log Out</span></a>
                </li>
            </ul>
        </div>
        <!-- Sidebar -->
    </div>
</div>
<!-- Left Sidebar End -->