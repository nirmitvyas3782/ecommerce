@extends('admin.layout.app')
@section('content')

<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="d-flex align-items-center min-vh-100">
                <div class="w-100 d-block bg-white shadow-lg rounded my-5">
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-block bg-login rounded-left"></div>
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <a href="index.html" class="d-block mb-5">
                                        <img src="{{ admin_img('logo-dark.png') }}" alt="app-logo" height="18" />
                                    </a>
                                </div>
                                <h1 class="h5 mb-1">Reset Password</h1>
                                <p class="text-muted mb-4">Enter your email address and we'll send you an email with instructions to reset your password.</p>
                                <form>
                                    <div class="form-group">
                                        <label for="exampleInputEmail">Email Address</label>
                                        <input type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="Email Address">
                                    </div>
                                    <a href="" class="btn btn-success btn-block"> Log In </a>
                                    
                                </form>

                                <div class="row mt-5">
                                    <div class="col-12 text-center">
                                        <p class="text-muted">Already have account?  <a href="/admin" class="text-muted font-weight-medium ml-1"><b>Sign In</b></a></p>
                                        <p class="text-muted mb-0">Don't have an account? <a href="/admin/register" class="text-muted font-weight-medium ml-1"><b>Sign Up</b></a></p>
                                    </div> <!-- end col -->
                                </div>
                                <!-- end row -->
                            </div> <!-- end .padding-5 -->
                        </div> <!-- end col -->
                    </div> <!-- end row -->
                </div> <!-- end .w-100 -->
            </div> <!-- end .d-flex -->
        </div> <!-- end col-->
    </div> <!-- end row -->
</div>
<!-- end container -->

@endsection