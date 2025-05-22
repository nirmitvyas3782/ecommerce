@extends('web_front.layout.home')

@section('content')

<div class="swiper-wrapper">
    <!-- Slide 1 -->
    
    <div class="swiper-slide slide-1 d-flex align-items-center">
      <div class="container-fluid h-100">
        
        <div class="row h-100">
          <div class="bg-text">SUPPLY</div>
          <div
            class="col-md-4 d-flex align-items-center justify-content-center text-white left-col"
          >
            <img src="/web_front/img/slider/chair-1.png" class="slide-img" alt="Chair 1" />
          </div>
          <div
            class="col-md-4 d-flex flex-column align-items-center justify-content-center text-center content center-col"
          >
            <h1 class="slide-title">SUPPLY</h1>
            <p class="slide-text">
              Get high-quality, ready-to-use furniture imported from leading international brands. Perfect for those seeking premium designs with global appeal, delivered directly to your doorstep.
            </p>
            <hr class="slide-divider">
            <a href="{{ route('home.index') }}" class="btn btn-light mt-3 btn-lg rounded-pill">Learn More</a>
          </div>
          <div
            class="col-md-4 d-flex align-items-center justify-content-center right-col"
          >
            <img src="/web_front/img/slider/chair-1.png" class="slide-img" alt="Chair 2" />
          </div>
        </div>
      </div>
    </div>

    <!-- Slide 2 -->
    <div class="swiper-slide slide-2 d-flex align-items-center">
      <div class="container-fluid h-100">
        <div class="row h-100">
          <div class="bg-text small-text">MAKE IN INDIA</div>
          <div
            class="col-md-4 d-flex align-items-center justify-content-center left-col"
          >
            <img src="/web_front/img/slider/chair-2.png" class="slide-img" alt="Chair 3" />
          </div>
          <div
            class="col-md-4 d-flex flex-column align-items-center justify-content-center text-center content center-col"
          >
            <h1 class="slide-title">MAKE IN INDIA</h1>
            <p class="slide-text">
              Support local craftsmanship with our 'Make in India' collection. Our furniture is locally sourced, designed, and manufactured to provide exceptional quality, affordability, and style while promoting sustainability.
            </p>
            <hr class="slide-divider">
            <a href="#" class="btn btn-light mt-3 btn-lg rounded-pill">Learn More</a>
          </div>
          <div
            class="col-md-4 d-flex align-items-center justify-content-center right-col"
          >
            <img src="/web_front/img/slider/chair-2.png" class="slide-img" alt="Chair 4" />
          </div>
        </div>
      </div>
    </div>

    <!-- Slide 3 -->
    <div class="swiper-slide slide-3 d-flex align-items-center">
      <div class="container-fluid h-100">
        <div class="row h-100">
          <div class="bg-text">CUSTOMIZE</div>
          <div
            class="col-md-4 d-flex align-items-center justify-content-center left-col"
          >
            <img src="/web_front/img/slider/chair-3.png" class="slide-img" alt="Chair 5" />
          </div>
          <div
            class="col-md-4 d-flex flex-column align-items-center justify-content-center text-center content center-col"
          >
            <h1 class="slide-title">CUSTOMIZE</h1>
            <p class="slide-text">
              Bring your vision to life with our custom furniture solutions. Whether it’s a unique design, color, or material, we’ll work with you to create furniture that perfectly fits your space and style.
            </p>
            <hr class="slide-divider">
            <a href="#" class="btn btn-light mt-3 btn-lg rounded-pill">Learn More</a>
          </div>
          <div
            class="col-md-4 d-flex align-items-center justify-content-center text-white right-col"
          >
            <img src="/web_front/img/slider/chair-3.png" class="slide-img" alt="Chair 6" />
          </div>
        </div>
      </div>
    </div>
  </div>

@endsection