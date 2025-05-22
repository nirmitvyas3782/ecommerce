@extends('web.layouts.app')

@section('content')
<section class="about-section py-5 bg-light">
    <div class="container">
        <div class="row align-items-center mb-5">
            <div class="col-md-7">
                <h1 class="display-4 fw-bold mb-3 text-primary">About Us</h1>
                <p class="lead mb-4">
                    Welcome to <span class="fw-bold text-dark">Deedy</span> – where design meets functionality, and spaces are transformed with purpose and personality.
                </p>
                <p>
                    At Deedy, we specialize in supplying high-quality furniture, statement lighting, versatile props, and curated décor solutions that elevate any environment. Whether it's for a commercial space, an event, a photoshoot, or a bespoke interior project, our pieces are selected and sourced to inspire and impress.
                </p>
            </div>
            <div class="col-md-5 text-center">
                <img src="{{ asset('images/about-hero.jpg') }}" alt="Deedy About Us" class="img-fluid rounded shadow">
            </div>
        </div>

        <div class="row mb-5">
            <div class="col-md-6 mb-4 mb-md-0">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body">
                        <h3 class="card-title text-secondary mb-3">Who We Are</h3>
                        <p class="card-text">
                            Deedy was founded on a simple belief: great design should be accessible, functional, and unforgettable. With a keen eye for style and a passion for detail, our team brings together years of experience in the interiors, events, and design industries to offer products that are both practical and aesthetically striking.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body">
                        <h3 class="card-title text-secondary mb-3">What We Offer</h3>
                        <ul class="list-unstyled fs-5">
                            <li><span class="text-primary fw-bold">Furniture</span> – From timeless classics to modern essentials, our collection blends form and comfort for every setting.</li>
                            <li class="mt-2"><span class="text-primary fw-bold">Lighting</span> – Illuminate your space with fixtures that do more than shine – they set the mood and make a statement.</li>
                            <li class="mt-2"><span class="text-primary fw-bold">Props & Decor</span> – Whether it’s a bold centerpiece or a subtle accent, our props add depth and character to any scene.</li>
                            <li class="mt-2"><span class="text-primary fw-bold">Custom Sourcing</span> – Looking for something unique? Our network of trusted partners allows us to source and supply specialty pieces tailored to your needs.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mb-5">
            <div class="col-md-4 mb-4 mb-md-0">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body">
                        <h4 class="text-primary mb-2">Curated Selection</h4>
                        <p>We handpick every item with style, durability, and versatility in mind.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4 mb-md-0">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body">
                        <h4 class="text-primary mb-2">Creative Collaboration</h4>
                        <p>We work closely with designers, stylists, and creators to bring visions to life.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body">
                        <h4 class="text-primary mb-2">Reliable Service</h4>
                        <p>Professional, responsive, and always on schedule – we take pride in seamless logistics and customer support.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center mt-5">
            <div class="col-md-10 text-center">
                <h2 class="fw-bold mb-3 text-secondary">Let's Create Together</h2>
                <p class="fs-5 mb-4">
                    At Deedy, we’re more than just suppliers – we’re creative partners in your project’s success. Whether you're staging a set, designing an office, or creating an unforgettable event, we're here to help you source the perfect pieces with confidence and creativity.
                </p>
                <a href="{{ route('contact') }}" class="btn btn-primary btn-lg shadow">Let’s bring your vision to life</a>
            </div>
        </div>
    </div>
</section>
@endsection