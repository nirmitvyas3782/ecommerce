<header class="header-area header-style-1 header-height-2">
    <div class="mobile-promotion">
        <span>Grand opening, <strong>up to 15%</strong> off all items. Only
            <strong>3 days</strong> left</span>
    </div>

    <div class="header-middle header-middle-ptb-1 d-none d-lg-block">
        <div class="container">
            <div class="header-wrap">
                <div class="logo logo-width-1">
                    <a href="index.html"><img src="/web/imgs/theme/logo.svg" alt="logo" /></a>
                </div>
                <div class="header-right">

                    <div class="search-style-2">
                        <form action="{{ route('shop.index') }}" method="GET">
                            {{-- <select class="select-active" name="category">
                                <option>All Categories</option>
                                @foreach ($mainCategories as $category)
                                    <option value="{{ $category->name }}">{{ $category->name }}</option>
                                @endforeach
                            </select> --}}
                            <input type="text" placeholder="Search for items..." value="{{ request('search') }}"
                                name="search" id="searchInput" autocomplete="off" />
                            {{-- <button type="submit" class="btn-brand"><i class="fi-rs-search"></i></button> --}}
                        </form>
                    </div>

                    <!-- Popup Search bar -->

                    <div class="search-popup" id="searchPopup" style="display: none;">
                        <div class="card shadow rounded p-3"
                            style="position: absolute; top: 88px; left: 410px; right: 0; z-index: 999; width: 1200px">
                            <div>
                                <h5 class="mb-20">Popular Searches</h5>
                                <div class="d-flex flex-wrap gap-2 mb-3">
                                    @foreach($popularSearch as $popular)
                                        <span class="badge bg-light text-dark popular_search" style="cursor:pointer;" data-query="{{ $popular }}">{{ $popular }}</span>
                                    @endforeach
                                    <!-- Add more -->
                                </div>
                            </div>

                            <div>
                                <h5 class="mb-20">Recent Searches</h5>
                                <div class="d-flex flex-wrap gap-2 mb-3" id="recentSearchContainer">
                                    <!-- Add more -->
                                </div>
                            </div>

                            <h5 class="mt-3 mb-25">Top Selling Products</h5>
                            <div class="row product-grid">
                                @forelse($productsForHeader as $product)
                                    <div class="col-sm-4 col-12">
                                        <div class="product-cart-wrap mb-30">
                                            <div class="product-img-action-wrap">
                                                <div class="product-img product-img-zoom">
                                                    <a href="{{ route('shop.product_detail', $product->id) }}">
                                                        <img class="default-img"
                                                            src="{{ asset('upload/product_images') . '/' . $product->image_name }}"
                                                            alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-badges product-badges-position product-badges-mrg">
                                                    <span class="hot">Hot</span>
                                                </div>
                                            </div>
                                            <div class="product-content-wrap">
                                                <div class="product-category">
                                                    <a href="shop-grid-right.html">{{ $product->category }}</a>
                                                </div>
                                                <h2><a
                                                        href="{{ route('shop.product_detail', $product->id) }}">{{ $product->product_name }}</a>
                                                </h2>
                                                <div class="product-rate-cover">
                                                    <div class="product-rate d-inline-block">
                                                        <div class="product-rating" style="width: 90%"></div>
                                                    </div>
                                                    <span class="font-small ml-5 text-muted"> (4.0)</span>
                                                </div>
                                                <div class="product-card-bottom">
                                                    <div class="product-price">
                                                        @if (isset($productFormattedPrices[$product['id']]))
                                                            <span>{{ $productFormattedPrices[$product['id']] }}</span>
                                                        @else
                                                            Price not available
                                                        @endif
                                                    </div>
                                                    <div class="add-cart">
                                                        <a class="add" href="shop-cart.html"><i
                                                                class="fi-rs-shopping-cart mr-5"></i>Add </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @empty
                                    <p>No products found for "{{ $search }}".</p>
                                @endforelse
                            </div>
                        </div>
                    </div>
                    <!-- Popup Search bar -->


                    <div class="header-action-right">
                        <div class="header-action-2">
                            <div class="header-action-icon-2">
                                {{-- <a href="shop-compare.html">
                                    <img class="svgInject" alt="Nest"
                                        src="/web/imgs/theme/icons/icon-compare.svg" />
                                    <span class="pro-count blue">3</span>
                                </a>
                                <a href="shop-compare.html"><span class="lable ml-0">Compare</span></a> --}}
                            </div>
                            <div class="header-action-icon-2">
                                {{-- <a href="shop-wishlist.html">
                                    <img class="svgInject" alt="Nest" src="/web/imgs/theme/icons/icon-heart.svg" />
                                    <span class="pro-count blue">6</span>
                                </a>
                                <a href="shop-wishlist.html"><span class="lable">Wishlist</span></a> --}}
                            </div>
                            <div class="header-action-icon-2">
                                <a class="mini-cart-icon" href="shop-cart.html">
                                    <img alt="Nest" src="/web/imgs/theme/icons/icon-cart.svg" />
                                    <span class="pro-count blue">2</span>
                                </a>
                                <a href="shop-cart.html"><span class="lable">Cart</span></a>


                                <div class="cart-dropdown-wrap cart-dropdown-hm2">
                                    @forelse ($cartItems as $item)
                                        @php
                                            $itemSubtotal = $item->price * $item->quantity;
                                            // $subtotal += $itemSubtotal;
                                        @endphp
                                        <ul>
                                            <li>
                                                <div class="shopping-cart-img">
                                                    <a href="{{ route('shop.product_detail', $item->product->id) }}"><img
                                                            alt="Nest"
                                                            src="{{ asset('upload/product_images' . '/' . $item->product->image_name) }}" /></a>
                                                </div>
                                                <div class="shopping-cart-title">
                                                    <h4>
                                                        <a
                                                            href="shop-product-right.html">{{ $item->product->product_name }}</a>
                                                    </h4>
                                                    <h4><span>{{ $item->quantity }} ×
                                                        </span>₹{{ number_format($itemSubtotal, 2) }}</h4>
                                                </div>
                                                <div class="shopping-cart-delete">
                                                    <a href="#"><i class="fi-rs-cross-small"></i></a>
                                                </div>
                                            </li>
                                        </ul>
                                    @empty
                                        <p>Your cart is empty.</p>
                                    @endforelse
                                    <div class="shopping-cart-footer">
                                        <div class="shopping-cart-total">
                                            <h4>Total <span>₹{{ number_format($cartTotal, 2) }}</span></h4>
                                        </div>
                                        <div class="shopping-cart-button">
                                            <a href="{{ route('cart.view') }}" class="outline">View cart</a>
                                            <a href="shop-checkout.html">Checkout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="header-action-icon-2">
                                {{-- <a href="page-account.html">
                                    <img class="svgInject" alt="Nest" src="/web/imgs/theme/icons/icon-user.svg" />
                                </a>
                                <a href="page-account.html"><span class="lable ml-0">Account</span></a>
                                <div class="cart-dropdown-wrap cart-dropdown-hm2 account-dropdown">
                                    <ul>
                                        <li>
                                            <a href="page-account.html"><i class="fi fi-rs-user mr-10"></i>My
                                                Account</a>
                                        </li>
                                        <li>
                                            <a href="page-account.html"><i class="fi fi-rs-location-alt mr-10"></i>Order
                                                Tracking</a>
                                        </li>
                                        <li>
                                            <a href="page-account.html"><i class="fi fi-rs-label mr-10"></i>My
                                                Voucher</a>
                                        </li>
                                        <li>
                                            <a href="shop-wishlist.html"><i class="fi fi-rs-heart mr-10"></i>My
                                                Wishlist</a>
                                        </li>
                                        <li>
                                            <a href="page-account.html"><i
                                                    class="fi fi-rs-settings-sliders mr-10"></i>Setting</a>
                                        </li>
                                        <li>
                                            <a href="page-login.html"><i class="fi fi-rs-sign-out mr-10"></i>Sign
                                                out</a>
                                        </li>
                                    </ul>
                                </div> --}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-bottom header-bottom-bg-color sticky-bar">
        <div class="container">
            <div class="header-wrap header-space-between position-relative">
                <div class="logo logo-width-1 d-block d-lg-none">
                    <a href="index.html"><img src="/web/imgs/deedy-logo.png" alt="logo" /></a>
                </div>
                <div class="header-action-right d-block d-lg-none">
                    <div class="header-action-2">
                        {{-- <div class="header-action-icon-2">
                            <a href="shop-wishlist.html">
                                <img alt="Nest" src="/web/imgs/theme/icons/icon-heart.svg" />
                                <span class="pro-count white">4</span>
                            </a>
                        </div> --}}
                        <div class="header-action-icon-2">
                            <a class="mini-cart-icon" href="#">
                                <img alt="Nest" src="/web/imgs/theme/icons/icon-cart.svg" />
                                <span class="pro-count white">2</span>
                            </a>
                            <div class="cart-dropdown-wrap cart-dropdown-hm2">
                                <ul>
                                    <li>
                                        <div class="shopping-cart-img">
                                            <a href="shop-product-right.html"><img alt="Nest"
                                                    src="/web/imgs/shop/thumbnail-3.jpg" /></a>
                                        </div>
                                        <div class="shopping-cart-title">
                                            <h4>
                                                <a href="shop-product-right.html">Plain Striola Shirts</a>
                                            </h4>
                                            <h3><span>1 × </span>$800.00</h3>
                                        </div>
                                        <div class="shopping-cart-delete">
                                            <a href="#"><i class="fi-rs-cross-small"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="shopping-cart-img">
                                            <a href="shop-product-right.html"><img alt="Nest"
                                                    src="/web/imgs/shop/thumbnail-4.jpg" /></a>
                                        </div>
                                        <div class="shopping-cart-title">
                                            <h4>
                                                <a href="shop-product-right.html">Macbook Pro 2024</a>
                                            </h4>
                                            <h3><span>1 × </span>$3500.00</h3>
                                        </div>
                                        <div class="shopping-cart-delete">
                                            <a href="#"><i class="fi-rs-cross-small"></i></a>
                                        </div>
                                    </li>
                                </ul>
                                <div class="shopping-cart-footer">
                                    <div class="shopping-cart-total">
                                        <h4>Total <span>$383.00</span></h4>
                                    </div>
                                    <div class="shopping-cart-button">
                                        <a href="shop-cart.html">View cart</a>
                                        <a href="shop-checkout.html">Checkout</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<div class="mobile-header-active mobile-header-wrapper-style">
    <div class="mobile-header-wrapper-inner">
        <div class="mobile-header-top">
            <div class="mobile-header-logo">
                <a href="index.html"><img src="/web/imgs/deedy-logo.png" alt="logo" /></a>
            </div>
            <div class="mobile-menu-close close-style-wrap close-style-position-inherit">
                <button class="close-style search-close">
                    <i class="icon-top"></i>
                    <i class="icon-bottom"></i>
                </button>
            </div>
        </div>
        <div class="mobile-header-content-area">
            <div class="mobile-search search-style-3 mobile-header-border">
                <form action="#">
                    <input type="text" placeholder="Search for items…" />
                    <button type="submit"><i class="fi-rs-search"></i></button>
                </form>
            </div>
            <div class="mobile-menu-wrap mobile-header-border">
                <!-- mobile menu start -->
                <nav>
                    <ul class="mobile-menu font-heading">
                        <li class="menu-item-has-children">
                            <a href="index.html">Home</a>
                            <ul class="dropdown">
                                <li><a href="index.html">Home 1</a></li>
                                <li><a href="index-2.html">Home 2</a></li>
                                <li><a href="index-3.html">Home 3</a></li>
                                <li><a href="index-4.html">Home 4</a></li>
                                <li><a href="index-5.html">Home 5</a></li>
                                <li><a href="index-6.html">Home 6</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="shop-grid-right.html">shop</a>
                            <ul class="dropdown">
                                <li>
                                    <a href="shop-grid-right.html">Shop Grid – Right Sidebar</a>
                                </li>
                                <li>
                                    <a href="shop-grid-left.html">Shop Grid – Left Sidebar</a>
                                </li>
                                <li>
                                    <a href="shop-list-right.html">Shop List – Right Sidebar</a>
                                </li>
                                <li>
                                    <a href="shop-list-left.html">Shop List – Left Sidebar</a>
                                </li>
                                <li><a href="shop-fullwidth.html">Shop - Wide</a></li>
                                <li class="menu-item-has-children">
                                    <a href="#">Single Product</a>
                                    <ul class="dropdown">
                                        <li>
                                            <a href="shop-product-right.html">Product – Right Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="shop-product-left.html">Product – Left Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="shop-product-full.html">Product – No sidebar</a>
                                        </li>
                                        <li>
                                            <a href="shop-product-vendor.html">Product – Vendor Infor</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="shop-filter.html">Shop – Filter</a></li>
                                {{-- <li><a href="shop-wishlist.html">Shop – Wishlist</a></li> --}}
                                <li><a href="shop-cart.html">Shop – Cart</a></li>
                                <li><a href="shop-checkout.html">Shop – Checkout</a></li>
                                <li><a href="shop-compare.html">Shop – Compare</a></li>
                                <li class="menu-item-has-children">
                                    <a href="#">Shop Invoice</a>
                                    <ul class="dropdown">
                                        <li>
                                            <a href="shop-invoice-1.html">Shop Invoice 1</a>
                                        </li>
                                        <li>
                                            <a href="shop-invoice-2.html">Shop Invoice 2</a>
                                        </li>
                                        <li>
                                            <a href="shop-invoice-3.html">Shop Invoice 3</a>
                                        </li>
                                        <li>
                                            <a href="shop-invoice-4.html">Shop Invoice 4</a>
                                        </li>
                                        <li>
                                            <a href="shop-invoice-5.html">Shop Invoice 5</a>
                                        </li>
                                        <li>
                                            <a href="shop-invoice-6.html">Shop Invoice 6</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">Vendors</a>
                            <ul class="dropdown">
                                <li><a href="vendors-grid.html">Vendors Grid</a></li>
                                <li><a href="vendors-list.html">Vendors List</a></li>
                                <li>
                                    <a href="vendor-details-1.html">Vendor Details 01</a>
                                </li>
                                <li>
                                    <a href="vendor-details-2.html">Vendor Details 02</a>
                                </li>
                                <li>
                                    <a href="vendor-dashboard.html">Vendor Dashboard</a>
                                </li>
                                <li><a href="vendor-guide.html">Vendor Guide</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">Mega menu</a>
                            <ul class="dropdown">
                                <li class="menu-item-has-children">
                                    <a href="#">Women's Fashion</a>
                                    <ul class="dropdown">
                                        <li><a href="shop-product-right.html">Dresses</a></li>
                                        <li>
                                            <a href="shop-product-right.html">Blouses & Shirts</a>
                                        </li>
                                        <li>
                                            <a href="shop-product-right.html">Hoodies & Sweatshirts</a>
                                        </li>
                                        <li>
                                            <a href="shop-product-right.html">Women's Sets</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Men's Fashion</a>
                                    <ul class="dropdown">
                                        <li><a href="shop-product-right.html">Jackets</a></li>
                                        <li>
                                            <a href="shop-product-right.html">Casual Faux Leather</a>
                                        </li>
                                        <li>
                                            <a href="shop-product-right.html">Genuine Leather</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Technology</a>
                                    <ul class="dropdown">
                                        <li>
                                            <a href="shop-product-right.html">Gaming Laptops</a>
                                        </li>
                                        <li>
                                            <a href="shop-product-right.html">Ultraslim Laptops</a>
                                        </li>
                                        <li><a href="shop-product-right.html">Tablets</a></li>
                                        <li>
                                            <a href="shop-product-right.html">Laptop Accessories</a>
                                        </li>
                                        <li>
                                            <a href="shop-product-right.html">Tablet Accessories</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="blog-category-fullwidth.html">Blog</a>
                            <ul class="dropdown">
                                <li>
                                    <a href="blog-category-grid.html">Blog Category Grid</a>
                                </li>
                                <li>
                                    <a href="blog-category-list.html">Blog Category List</a>
                                </li>
                                <li>
                                    <a href="blog-category-big.html">Blog Category Big</a>
                                </li>
                                <li>
                                    <a href="blog-category-fullwidth.html">Blog Category Wide</a>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Single Product Layout</a>
                                    <ul class="dropdown">
                                        <li><a href="blog-post-left.html">Left Sidebar</a></li>
                                        <li>
                                            <a href="blog-post-right.html">Right Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="blog-post-fullwidth.html">No Sidebar</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">Pages</a>
                            <ul class="dropdown">
                                <li><a href="page-about.html">About Us</a></li>
                                <li><a href="page-contact.html">Contact</a></li>
                                <li><a href="page-account.html">My Account</a></li>
                                <li><a href="page-login.html">Login</a></li>
                                <li><a href="page-register.html">Register</a></li>
                                <li>
                                    <a href="page-forgot-password.html">Forgot password</a>
                                </li>
                                <li>
                                    <a href="page-reset-password.html">Reset password</a>
                                </li>
                                <li>
                                    <a href="page-purchase-guide.html">Purchase Guide</a>
                                </li>
                                <li>
                                    <a href="page-privacy-policy.html">Privacy Policy</a>
                                </li>
                                <li><a href="page-terms.html">Terms of Service</a></li>
                                <li><a href="page-404.html">404 Page</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">Language</a>
                            <ul class="dropdown">
                                <li><a href="#">English</a></li>
                                <li><a href="#">French</a></li>
                                <li><a href="#">German</a></li>
                                <li><a href="#">Spanish</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <!-- mobile menu end -->
            </div>
            <div class="mobile-header-info-wrap">
                <div class="single-mobile-header-info">
                    <a href="page-contact.html"><i class="fi-rs-marker"></i> Our location
                    </a>
                </div>
                <div class="single-mobile-header-info">
                    <a href="page-login.html"><i class="fi-rs-user"></i>Log In / Sign Up
                    </a>
                </div>
                <div class="single-mobile-header-info">
                    <a href="#"><i class="fi-rs-headphones"></i>(+01) - 2345 - 6789
                    </a>
                </div>
            </div>
            <div class="mobile-social-icon mb-50">
                <h6 class="mb-15">Follow Us</h6>
                <a href="#"><img src="/web/imgs/theme/icons/icon-facebook-white.svg" alt="" /></a>
                <a href="#"><img src="/web/imgs/theme/icons/icon-twitter-white.svg" alt="" /></a>
                <a href="#"><img src="/web/imgs/theme/icons/icon-instagram-white.svg" alt="" /></a>
                <a href="#"><img src="/web/imgs/theme/icons/icon-pinterest-white.svg" alt="" /></a>
                <a href="#"><img src="/web/imgs/theme/icons/icon-youtube-white.svg" alt="" /></a>
            </div>
            <div class="site-copyright">
                Copyright 2024 © Nest. All rights reserved. Powered by AliThemes.
            </div>
        </div>
    </div>
</div>
<!--End header-->
