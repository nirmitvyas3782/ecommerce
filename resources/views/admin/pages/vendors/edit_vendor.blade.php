@extends('admin.layout.home')
@section('content')
    <div class="container-fluid">

        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Register Vendor</h4>
                        <p class="text-muted">Please fill in the details below to register a new vendor. Ensure that all the
                            required fields are completed before submitting the form.</p>
                    </div>
                </div>
            </div>
        </div>
        @if ($errors->any())
            <div>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        <form action="{{ route('vendor.update', $vendor->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="row gy-4">

                <!-- Identity + Contact -->
                <div class="col-md-6">
                    <div class="card shadow-sm">
                        <div class="card-header fw-semibold">Vendor Details</div>
                        <div class="card-body">

                            <div class="mb-3">
                                <label class="form-label">Full Name *</label>
                                <input type="text" name="name" class="form-control" required value="{{ old('name', $vendor->name) }}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Company Name</label>
                                <input type="text" name="company_name" class="form-control" value="{{ old('company_name', $vendor->company_name) }}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Vendor Code *</label>
                                <input type="text" name="vendor_code" class="form-control" required value="{{ old('vendor_code', $vendor->vendor_code) }}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Slug *</label>
                                <input type="text" name="slug" class="form-control" required value="{{ old('slug', $vendor->slug) }}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email *</label>
                                <input type="email" name="email" class="form-control" required value="{{ old('email', $vendor->email) }}">
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Phone</label>
                                    <input type="text" name="phone" class="form-control" value="{{ old('phone', $vendor->phone) }}">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Alternate Phone</label>
                                    <input type="text" name="alternate_phone" class="form-control" value="{{ old('alternate_phone', $vendor->alternate_phone) }}">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <textarea name="address" class="form-control" rows="2">{{ old('address', $vendor->address) }}</textarea>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">City</label>
                                    <select class="form-control" id="city" name="city">
                                        <option>Select City</option>
                                        @foreach($cities as $city)
                                            <option value="{{ $city->id }}" {{ $vendor->city == $city->id ? 'selected' : '' }}>
                                                {{ $city->city }}
                                            </option>
                                        @endforeach
                                    </select>

                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">State</label>
                                    <select class="form-control" id="state" name="state">
                                        <option>Select State</option>
                                        @foreach($states as $state)
                                            <option value="{{ $state->id }}" {{ $vendor->state == $state->id ? 'selected' : '' }}>
                                                {{ $state->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Country</label>
                                    <select class="form-control select2" id="country" name="country">
                                        <option>Select Country</option>
                                        @foreach($countries as $country)
                                            <option value="{{ $country->id }}" {{ $vendor->country == $country->id ? 'selected' : '' }}>
                                                {{ $country->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Zip Code</label>
                                    <input type="text" name="pin_code" class="form-control" value="{{ old('pincode', $vendor->pincode) }}">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Business + Bank -->
                <div class="col-md-6">
                    <div class="card shadow-sm mb-3">
                        <div class="card-header fw-semibold">Business & Financial Info</div>
                        <div class="card-body">

                            <div class="mb-3">
                                <label class="form-label">Business Type</label>
                                <input type="text" name="business_type" class="form-control" value="{{ old('business_type', $vendor->business_type) }}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Industry</label>
                                <input type="text" name="industry" class="form-control" value="{{ old('industry', $vendor->industry) }}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Website</label>
                                <input type="url" name="website" class="form-control" value="{{ old('website', $vendor->website) }}">
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">GST Number</label>
                                    <input type="text" name="gst_number" class="form-control" value="{{ old('gst_number', $vendor->gst_number) }}">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">PAN Number</label>
                                    <input type="text" name="pan_number" class="form-control" value="{{ old('pan_number', $vendor->pan_number) }}">
                                </div>
                            </div>

                            <hr>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Rental Radius</label>
                                    <input type="text" name="rental_radius" class="form-control" value="{{ old('rental_radius', $vendor->rental_radius) }}">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Documents Upload -->
                <div class="col-md-12">
                    <div class="card shadow-sm">
                        <div class="card-header fw-semibold">Upload Documents</div>
                        <div class="card-body row g-3">

                            <div class="col-md-3">
                                <label class="form-label">Profile Photo</label>
                                <input type="file" class="dropify" name="profile_photo" data-default-file="{{ asset('storage') . '/' . old('profile_photo', $vendor->profile_photo) }}" />
                            </div>

                            <div class="col-md-3">
                                <label class="form-label">GST Document</label>
                                <input type="file" class="dropify" name="gst_document" />
                            </div>

                            <div class="col-md-3">
                                <label class="form-label">PAN Document</label>
                                <input type="file" class="dropify" name="pan_document" />
                            </div>

                            <div class="col-md-3">
                                <label class="form-label">Business License</label>
                                <input type="file" class="dropify" name="business_license" />
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Submit -->
                <div class="col-md-12 text-end mt-3 mb-5">
                    <button type="submit" class="btn btn-primary" id="saveVendor">Update Vendor</button>
                </div>
            </div>
        </form>
    </div>
@endsection

@section('styles')
    <link href="{{ asset_admin_plugin('dropify/dropify.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset_admin_plugin('select2/select2.min.css') }}" rel="stylesheet" type="text/css" />
     

@endsection

@section('scripts')
    <script src="{{ asset_admin_plugin('dropify/dropify.min.js') }}"></script>
    <script src="{{ asset_admin_plugin('select2/select2.min.js') }}"></script>
    <!-- Sweet Alerts Js-->
    

    <!-- Init js-->
    <script src="{{ asset_admin_js('fileuploads-demo.js') }}"></script>
    <script>
        $(document).ready(function() {
            $('#country').select2();
            $('#city').select2();
            $('#state').select2();
        });
    </script>
@endsection
