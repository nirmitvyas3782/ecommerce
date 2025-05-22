@extends('web.layout.home')

@section('content')
    <section class="home-slider position-relative mb-50">
        <div class="home-slide-cover">
            <div class="hero-slider-1 style-4 dot-style-1 dot-style-1-position-1">
                <div class="single-hero-slider rectangle single-animation-wrap"
                    style="background-image: url('{{ asset($banner->meta_value) }}')">
                </div>
            </div>
            <div class="slider-arrow hero-slider-1-arrow"></div>
        </div>
    </section>

    <div class="container">
        <div class="sec-title mb-4">
            <h3 style="text-align: center;">Featured Categories</h3>
        </div>
        <div class="row">
            @foreach ($mainCategories as $category)
                <div class="col-md-3 col-sm-3 mb-4">
                    <div class="card h-100 text-center border-0 shadow-sm">
                        <figure class="img-hover-scale overflow-hidden">
                            <img src="{{ asset($category->category_image) }}" class="card-img-top img-fluid"
                                alt="{{ $category->name }}" style="height: 300px; object-fit: cover;">
                        </figure>
                        <div class="card-body">
                            <h5 class="card-title">{{ $category->name }}</h5>
                            <div class="mb-10 card-count">
                                <p>Total ({{ $subCategoriesCount[$category->name] }}) {{ $category->name }}</p>
                            </div>
                            <a href="{{ route('catgory.page.index', ['name' => $category->name]) }}"
                                class="btn btn-sm btn-primary">View Products</a>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
        <!--End category slider-->
        
        <section class="pb-5 background-color section-padding-custom">
            <div class="container">
                <div class="section-title wow animate__animated animate__fadeIn">
                    <h3 class="">Popular Products</h3>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 wow animate__animated animate__fadeIn" data-wow-delay=".4s">
                        <div class="tab-content" id="myTabContent-1">
                            <div class="tab-pane fade show active" id="tab-one-1" role="tabpanel"
                                aria-labelledby="tab-one-1">
                                <div class="carausel-4-columns-cover arrow-center position-relative">
                                    <div class="slider-arrow slider-arrow-2 carausel-4-columns-arrow"
                                        id="carausel-4-columns-arrows"></div>

                                    <div class="carausel-4-columns carausel-arrow-center" id="carausel-4-columns">
                                        @forelse ($products as $product)
                                            <div class="product-cart-wrap">
                                                <div class="product-img-action-wrap">
                                                    <div class="product-img product-img-zoom">
                                                        <a href="shop-product-right.html">
                                                            <img class="default-img"
                                                                src="{{ asset('upload/product_images') . '/' . $product->image_name }}"
                                                                alt="" />
                                                        </a>
                                                    </div>
                                                    <div class="product-badges product-badges-position product-badges-mrg">
                                                        <span class="hot">Save 15%</span>
                                                    </div>
                                                </div>
                                                <div class="product-content-wrap">
                                                    <div class="product-category">
                                                        <a href="shop-grid-right.html">{{ $product->category }}</a>
                                                    </div>
                                                    <h2>
                                                        <a href="shop-product-right.html">{{ $product->product_name }}</a>
                                                    </h2>
                                                    <div class="product-rate d-inline-block">
                                                        <div class="product-rating" style="width: 80%"></div>
                                                    </div>
                                                    <div class="product-price mt-10">
                                                        @if (isset($formattedPrices[$product['id']]))
                                                            <span>{{ $formattedPrices[$product['id']] }}</span>
                                                        @else
                                                            Price not available
                                                        @endif
                                                    </div>
                                                    <div class="sold mt-15 mb-15">
                                                        <div class="progress mb-5">
                                                            <div class="progress-bar" role="progressbar" style="width: 50%"
                                                                aria-valuemin="0" aria-valuemax="100"></div>
                                                        </div>
                                                        <span class="font-xs text-heading">
                                                            Sold: 90/120</span>
                                                    </div>
                                                    <form method="POST" class="add-to-cart-form" action="{{ route('cart.add') }}">
                                                    @csrf
                                                        <a href="{{ route('shop.product_detail', $product->id) }}" class="btn w-100">Buy Now</a>
                                                        {{-- <button type="submit" class="btn w-100 hover-up"><i class="fi-rs-shopping-cart mr-5"></i>Add To Cart</a> --}}
                                                    </form>
                                                </div>
                                            </div>
                                        @empty
                                            <div class="product-img-action-wrap">
                                                <p> There is no popular product
                                            </div>
                                        @endforelse
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!--End tab-content-->
                    </div>
                    <!--End Col-lg-9-->
                </div>
            </div>
        </section>
        <section class="text-center mt-50 ">
            <h2 class="title style-3 mb-40">What We Provide?</h2>
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 mb-24">
                        <div class="featured-card">
                            <img src="assets/imgs/theme/icons/icon-1.svg" alt="" />
                            <h4>Best Prices & Offers</h4>
                            <p>
                                There are many variations of passages of Lorem Ipsum
                                available, but the majority have suffered alteration in
                                some form
                            </p>
                            <a href="#">Read more</a>
                        </div>
                    </div>
                    <div class="col-sm-4 mb-24">
                        <div class="featured-card">
                            <img src="assets/imgs/theme/icons/icon-2.svg" alt="" />
                            <h4>Wide Assortment</h4>
                            <p>
                                There are many variations of passages of Lorem Ipsum
                                available, but the majority have suffered alteration in
                                some form
                            </p>
                            <a href="#">Read more</a>
                        </div>
                    </div>
                    <div class="col-sm-4 mb-24">
                        <div class="featured-card">
                            <img src="assets/imgs/theme/icons/icon-3.svg" alt="" />
                            <h4>Free Delivery</h4>
                            <p>
                                There are many variations of passages of Lorem Ipsum
                                available, but the majority have suffered alteration in
                                some form
                            </p>
                            <a href="#">Read more</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-24">
                        <div class="featured-card">
                            <img src="assets/imgs/theme/icons/icon-4.svg" alt="" />
                            <h4>Easy Returns</h4>
                            <p>
                                There are many variations of passages of Lorem Ipsum
                                available, but the majority have suffered alteration in
                                some form
                            </p>
                            <a href="#">Read more</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-24">
                        <div class="featured-card">
                            <img src="assets/imgs/theme/icons/icon-5.svg" alt="" />
                            <h4>100% Satisfaction</h4>
                            <p>
                                There are many variations of passages of Lorem Ipsum
                                available, but the majority have suffered alteration in
                                some form
                            </p>
                            <a href="#">Read more</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-24">
                        <div class="featured-card">
                            <img src="assets/imgs/theme/icons/icon-6.svg" alt="" />
                            <h4>Great Daily Deal</h4>
                            <p>
                                There are many variations of passages of Lorem Ipsum
                                available, but the majority have suffered alteration in
                                some form
                            </p>
                            <a href="#">Read more</a>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    @endsection
