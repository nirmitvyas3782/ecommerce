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

        <form enctype="multipart/form-data" id="vendorForm">
            <div class="row gy-4">

                <!-- Identity + Contact -->
                <div class="col-md-6">
                    <div class="card shadow-sm">
                        <div class="card-header fw-semibold">Vendor Details</div>
                        <div class="card-body">

                            <div class="mb-3">
                                <label class="form-label">Full Name *</label>
                                <input type="text" name="name" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Company Name</label>
                                <input type="text" name="company_name" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Vendor Code *</label>
                                <input type="text" name="vendor_code" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Slug *</label>
                                <input type="text" name="slug" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email *</label>
                                <input type="email" name="email" class="form-control" required>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Phone</label>
                                    <input type="text" name="phone" class="form-control">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Alternate Phone</label>
                                    <input type="text" name="alternate_phone" class="form-control">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <textarea name="address" class="form-control" rows="2"></textarea>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">City</label>
                                    <select class="form-control" id="city" name="city">
                                        <option>Select City</option>
                                    </select>

                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">State</label>
                                    <select class="form-control" id="state" name="state">
                                        <option>Select State</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Country</label>
                                    <select class="form-control select2" id="country" name="country">
                                        <option>Select Country</option>
                                        @foreach ($countries as $country)
                                            <option value="{{ $country->id }}">{{ $country->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Zip Code</label>
                                    <input type="text" name="pin_code" class="form-control">
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
                                <input type="text" name="business_type" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Industry</label>
                                <input type="text" name="industry" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Website</label>
                                <input type="url" name="website" class="form-control">
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">GST Number</label>
                                    <input type="text" name="gst_number" class="form-control">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">PAN Number</label>
                                    <input type="text" name="pan_number" class="form-control">
                                </div>
                            </div>

                            <hr>

                            <div class="mb-3">
                                <label class="form-label">Bank Account Name</label>
                                <input type="text" name="bank_account_name" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Account Number</label>
                                <input type="text" name="bank_account_number" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Bank Name</label>
                                <input type="text" name="bank_name" class="form-control">
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">IFSC Code</label>
                                    <input type="text" name="bank_ifsc" class="form-control">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Branch</label>
                                    <input type="text" name="bank_branch" class="form-control">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Rental Radius</label>
                                    <input type="text" name="rental_radius" class="form-control">
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
                                <input type="file" class="dropify" name="profile_photo" />
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
                    <button type="button" class="btn btn-primary" id="saveVendor">Save Vendor</button>
                </div>
                <!-- Spinner (hidden initially) -->
                <div id="spinner" style="display: none;">
                    <i class="fa fa-spinner fa-spin"></i> Saving...
                </div>
            </div>
        </form>
    </div>
@endsection

@section('styles')
    <link href="{{ asset_admin_plugin('dropify/dropify.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset_admin_plugin('select2/select2.min.css') }}" rel="stylesheet" type="text/css" />
     <!-- Sweet Alerts css -->
     <link href="{{ asset_admin_plugin('sweetalert2/sweetalert2.min.css') }}" rel="stylesheet" type="text/css" />

@endsection

@section('scripts')
    <script src="{{ asset_admin_plugin('dropify/dropify.min.js') }}"></script>
    <script src="{{ asset_admin_plugin('select2/select2.min.js') }}"></script>
    <!-- Sweet Alerts Js-->
    <script src="{{ asset_admin_plugin('sweetalert2/sweetalert2.min.js') }}"></script>

    <!-- Init js-->
    <script src="{{ asset_admin_js('fileuploads-demo.js') }}"></script>
    <script>
        $(document).ready(function() {
            $('#country').select2();
            $('#city').select2();
            $('#state').select2();
        });
    </script>
    <script>
        $(document).ready(function() {

            $('#country').on('change', function() {

                const countryId = $('#country option:selected').val();
                $('#state').empty().append('<option value="">Loading...</option>').trigger('change');
                $('#city').empty().append('<option value="">Select City</option>').trigger('change');



                if (countryId) {
                    $.ajax({
                        url: '/admin/get-states/' + countryId,
                        type: 'GET',
                        success: function(data) {
                            $('#state').empty().append(
                            '<option value="">Select State</option>');
                            $.each(data, function(id, name) {
                                $('#state').append(
                                    `<option value="${id}">${name}</option>`);
                            });
                            $('#state').trigger('change');
                        }
                    });
                }
            });

            $('#state').on('change', function() {
                let stateId = $(this).val();
                $('#city').empty().append('<option value="">Loading...</option>').trigger('change');



                if (stateId) {
                    $.ajax({
                        url: '/admin/get-cities/' + stateId,
                        type: 'GET',
                        success: function(data) {
                            $('#city').empty().append('<option value="">Select City</option>');
                            $.each(data, function(id, name) {
                                $('#city').append(
                                    `<option value="${id}">${name}</option>`);
                            });
                            $('#city').trigger('change');
                        }
                    });
                }
            });


        });
    </script>
    <script>
        $(document).ready(function() {

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            // Listen for Save Vendor Button Click
            $('#saveVendor').on('click', function(event) {
                
                event.preventDefault();
                // Show the spinner
                $('#spinner').show();

                // Get the form data
                let formData = new FormData($('#vendorForm')[0]);
                
                console.log(formData);
                // Send the AJAX request to the server
                $.ajax({
                    url: '/admin/vendor/create', // Replace with the correct URL
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        // On successful request
                        console.log('Vendor saved successfully');

                        // Hide the spinner after 2 seconds
                        setTimeout(function() {
                            $('#spinner').hide();
                        }, 2000);

                        // SweetAlert Success Message
                        Swal.fire({
                            icon: 'success',
                            title: 'Success!',
                            text: 'Vendor saved successfully!',
                        });
                        
                    },
                    error: function(xhr, status, error) {
                        // On error
                        console.log('Error saving vendor:', error);

                    }
                });
            });
        });
    </script>
@endsection
