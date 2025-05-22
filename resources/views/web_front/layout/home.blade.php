<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, maximum-scale=1"
    />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Deedy | Supply, Warehouse, Rental</title>

    <!-- CSS -->
    <link
      href="https://fonts.googleapis.com/css?family=Montserrat%3A500%2C700%7CRoboto+Condensed:700%7CRoboto%3A700&display=swap"
      rel="stylesheet"
    />
    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;500&display=swap"
      rel="stylesheet"
    />
    <link href="https://fonts.googleapis.com/css2?family=Passion+One:wght@400;700;900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/web_front/css/line-awesome.css" />
    <link type="text/css" rel="stylesheet" href="/web_front/css/style.css" />
    <link type="text/css" rel="stylesheet" href="/web_front/css/responsive.css" />
    <link rel="stylesheet" href="/web_front/css/bootstrap.min.css" />
    <!-- Swiper CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />

    <!-- Icon -->
    <link rel="icon" href="/img/favicon.png" sizes="32x32" />
  </head>

  <body class="ashade-smooth-scroll">

    <!-- Logo Section (Fixed at the top) -->
    <div class="logo-container ashade-logo">
        <img src="/web_front/img/deedy-logo.png" alt="Logo" class="logo" />
    </div>

    <div class="swiper mySwiper">
        @yield('content')
    </div>

     <!-- SCRIPTS -->
     <script src="/web_front/js/jquery.min.js"></script>
     <script src="/web_front/js/gsap.min.js"></script>
     <script src="/web_front/js/masonry.min.js"></script>
     <script src="/web_front/js/core.js"></script>
     <script src="/web_front/js/bootstrap.min.js"></script>
     <!-- Swiper JS -->
     <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
     
     <script>
       // Initialize off-screen state for all slide images
       function initializeImageStates() {
         document.querySelectorAll(".swiper-slide").forEach((slide) => {
           const leftImg = slide.querySelector(".left-col img");
           const rightImg = slide.querySelector(".right-col img");
     
           if (leftImg && rightImg) {
             gsap.set(leftImg, { x: -600, opacity: 0 });
             gsap.set(rightImg, { x: 600, opacity: 0 });
           }
         });
       }
     
       function animateSlide(slide) {
         const leftImg = slide.querySelector(".left-col img");
         const rightImg = slide.querySelector(".right-col img");
     
         if (leftImg && rightImg) {
           gsap.killTweensOf([leftImg, rightImg]); // Cancel ongoing animations
     
           gsap.fromTo(leftImg, 
             { x: -600, opacity: 0 }, 
             { x: 0, opacity: 1, duration: 0.6, ease: "power3.out" }
           );
     
           gsap.fromTo(rightImg, 
             { x: 600, opacity: 0 }, 
             { x: 0, opacity: 1, duration: 0.6, ease: "power3.out" }
           );
         }
       }
     
       function animateSlideOut(slide) {
         const leftImg = slide.querySelector(".left-col img");
         const rightImg = slide.querySelector(".right-col img");
     
         if (leftImg && rightImg) {
           gsap.killTweensOf([leftImg, rightImg]); // Cancel ongoing animations
     
           gsap.to(leftImg, { x: -600, opacity: 0, duration: 0.4, ease: "power2.in" });
           gsap.to(rightImg, { x: 600, opacity: 0, duration: 0.4, ease: "power2.in" });
         }
       }
     
       // Call this after DOM is fully loaded
       document.addEventListener("DOMContentLoaded", function () {
         initializeImageStates();
     
         const swiper = new Swiper(".mySwiper", {
           direction: "vertical",
           loop: true,
           speed: 1000,
           autoplay: {
             delay: 3000,
             disableOnInteraction: false,
           },
           effect: "slide",
           on: {
             init: function () {
               animateSlide(this.slides[this.activeIndex]);
             },
             slideChangeTransitionStart: function () {
               const previous = this.slides[this.previousIndex];
               animateSlideOut(previous);
             },
             slideChangeTransitionEnd: function () {
               const active = this.slides[this.activeIndex];
               animateSlide(active);
             },
           },
         });
         
       });
     </script>
  </body>
</html>