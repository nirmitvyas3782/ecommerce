@extends('admin.layout.app')
@section('content')

<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="d-flex align-items-center min-vh-100">
                <div class="w-100 d-block bg-white shadow-lg rounded my-5">
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-block bg-register rounded-left"></div>
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <a href="index.html" class="d-block mb-5">
                                        <img src="{{ admin_img('logo-dark.png') }}" alt="app-logo" height="18" />
                                    </a>
                                </div>
                                <h1 class="h5 mb-1">Create an Account!</h1>
                                <p class="text-muted mb-4">Don't have an account? Create your own account, it takes less than a minute</p>
                                <form class="user">
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="First Name">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control form-control-user" id="exampleLastName" placeholder="Last Name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="Email Address">
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password">
                                        </div>
                                    </div>
                                    <a href="" class="btn btn-success btn-block"> Register Account </a>

                                    <div class="text-center mt-4">
                                        <h5 class="text-muted font-size-16">Sign up using</h5>
                                    
                                        <ul class="list-inline mt-3 mb-0">
                                            <li class="list-inline-item">
                                                <a href="javascript: void(0);" class="social-list-item border-primary text-primary"><i class="mdi mdi-facebook"></i></a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="javascript: void(0);" class="social-list-item border-danger text-danger"><i class="mdi mdi-google"></i></a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="javascript: void(0);" class="social-list-item border-info text-info"><i class="mdi mdi-twitter"></i></a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="javascript: void(0);" class="social-list-item border-secondary text-secondary"><i class="mdi mdi-github-circle"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                    
                                </form>

                                <div class="row mt-4">
                                    <div class="col-12 text-center">
                                        <p class="text-muted mb-0">Already have account?  <a href="/admin" class="text-muted font-weight-medium ml-1"><b>Sign In</b></a></p>
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