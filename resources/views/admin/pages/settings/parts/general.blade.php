<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">General Settings</h4>
                    <p class="text-muted">Please fill in the details below to update your shop's general settings. Make sure all required fields, including the shop name and address, are completed before saving your changes.</p>
                </div>
            </div>
        </div>
    </div>

    <form method="post" action="">
        @csrf
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
                        <div class="row">
                          <div class="col-sm-6">
                            <div class="form-group">
                              <label>Shop Name</label>
                              <input type="text" class="form-control" placeholder="Enter Shop name" name="shop_name">
                            </div>
                          </div>
                          <div class="col-sm-6">
                            <div class="form-group">
                              <label>Company</label>
                              <input type="text" class="form-control" placeholder="Enter Company name" name="shop_company">
                            </div>
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-sm-6">
                            <div class="form-group">
                              <label>Phone</label>
                              <input type="text" class="form-control" placeholder="Enter Phone Number" name="shop_phone">
                            </div>
                          </div>
                          <div class="col-sm-6">
                            <div class="form-group">
                              <label>Email</label>
                              <input type="text" class="form-control" placeholder="Enter Shop Email" name="shop_email">
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="form-label">Address</label>
                          <textarea name="address" class="form-control" rows="2"></textarea>
                        </div>

                        <!-- Submit -->
                        <div class="form-group mt-4">
                            <button type="submit" class="btn btn-primary"><i class="feather-save"></i><span class="p-2"><strong>Save Setting</strong></span></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>