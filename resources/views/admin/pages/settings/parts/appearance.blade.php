<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Site Appearance Settings</h4>
                    <p class="text-muted">Customize the appearance of the website using the settings below. Adjust theme colors, layout preferences, and other display options as needed before saving your changes.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <!-- Main Form -->
        <div class="col-lg-6">
            <div class="card">
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul class="mb-0">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <div class="card-body">
                    
                    
                    
                    
                    <!-- Submit -->
                    <div class="form-group mt-4">
                        <button type="submit" class="btn btn-primary"><i class="feather-save"></i><span class="p-2"><strong>Save Setting</strong></span></button>
                    </div>
                </div>
            </div>
        </div>
    </div>




</div>