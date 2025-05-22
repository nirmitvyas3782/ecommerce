<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Email Settings</h4>
                    <p class="text-muted">Please fill in the details below to configure your email settings. Ensure all
                        required fields, such as sender address and SMTP details, are completed before saving your
                        changes.</p>
                </div>
            </div>
        </div>
    </div>

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
            <form>
                <h5 class="mb-2">Email</h5>
                <table class="table table-bordered email-settings-table">
                    <thead>
                        <tr>
                            <th>Template</th>
                            <th>Description</th>
                            <th>Operations</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Email template header</td>
                            <td>Template for header of emails</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Email template footer	</td>
                            <td>Template for footer of emails</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" /></td>
                        </tr>
                    </tbody>
                </table>

                <h5 class="mb-2">ACL</h5>
                <table class="table table-bordered email-settings-table">
                    <thead>
                        <tr>
                            <th>Template</th>
                            <th>Description</th>
                            <th>Operations</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Reset password</td>
                            <td>Send email to user when requesting reset password</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                    </tbody>
                </table>


                <h5 class="mb-2">Contact</h5>
                <table class="table table-bordered email-settings-table">
                    <thead>
                        <tr>
                            <th>Template</th>
                            <th>Description</th>
                            <th>Operations</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Send notice to administrator</td>
                            <td>Email template to send notice to administrator when system get new contact</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Send confirmation to sender</td>
                            <td>Email template for confirming the sender that the message has been sent successfully</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                    </tbody>
                </table>

                <h5 class="mb-2">Ecommerce</h5>
                <table class="table table-bordered email-settings-table">
                    <thead>
                        <tr>
                            <th>Template</th>
                            <th>Description</th>
                            <th>Operations</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Welcome</td>
                            <td>Send email to user when they registered an account on our site</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Confirm email</td>
                            <td>Send email to user when they register an account to verify their email</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Reset password</td>
                            <td>Send email to user when they request to reset password</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Order Confirmation</td>
                            <td>Send email confirmation to customer when an order placed</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Order Cancellation</td>
                            <td>Send to customer when they cancels an order</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Order cancellation (by Admin)</td>
                            <td>Send to customer when admin cancels an order</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Order cancellation (will be sent to admins)</td>
                            <td>Send to admin when customer cancels an order</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Delivering confirmation</td>
                            <td>Send to customer when order is delivering</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Notice About New Order</td>
                            <td>Send to adminstrator when new order is placed</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Order confirmation</td>
                            <td>Send to customer when they order was confirmed by admins</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Incomplete order</td>
                            <td>Send to custom to remind them about incomplete orders</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Account deletion confirmation</td>
                            <td>Send confirmation email to user when they request to delete their account</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Account deletion completed</td>
                            <td>Send email to user when their account was deleted</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Order return request status updated</td>
                            <td>Send to customer when their order return request status was updated</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Payment Proof Upload Notification</td>
                            <td>Notify admin when customer uploads payment proof</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Product File Updated</td>
                            <td>Notify customer when the product files are updated</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                    </tbody>
                </table>

                <h5 class="mb-2">Marketplace</h5>
                <table class="table table-bordered email-settings-table">
                    <thead>
                        <tr>
                            <th>Template</th>
                            <th>Description</th>
                            <th>Operations</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Notice about new order</td>
                            <td>Send email to the store owner when an order is placed</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Verify vendor</td>
                            <td>Send email to the admin when a vendor registers</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Vendor account approved</td>
                            <td>Send email to vendor when their account is approved</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Vendor account rejected</td>
                            <td>Send email to vendor when their account is rejected</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" /></td>
                        </tr>
                        <tr>
                            <td>Pending product approval</td>
                            <td>Send email to the admin when a vendor posts their products</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" /></td>
                        </tr>
                        <tr>
                            <td>Product approved</td>
                            <td>Send email to vendor when their product is approved</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" /></td>
                        </tr>
                        <tr>
                            <td>Withdrawal approved</td>
                            <td>Send email to vendor when their withdrawal request is approved</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Welcome vendor</td>
                            <td>Send email to vendor after they register</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Contact Store</td>
                            <td>Send email to the store owner when a customer contacts the store</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" /></td>
                        </tr>
                        <tr>
                            <td>Vendor account blocked</td>
                            <td>Send email to vendor when their account is blocked</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#FF5B5B" /></td>
                        </tr>
                        <tr>
                            <td>Vendor account unblocked</td>
                            <td>Send email to vendor when their account is unblocked</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" /></td>
                        </tr>
                        <tr>
                            <td>Order cancellation (to vendor)</td>
                            <td>Send to seller (vendor) when a customer cancels an order</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#FFB64D" /></td>
                        </tr>
                    </tbody>
                </table>
                <h5 class="mb-2">Newsletter</h5>
                <table class="table table-bordered email-settings-table">
                    <thead>
                        <tr>
                            <th>Template</th>
                            <th>Description</th>
                            <th>Operations</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Email send to user</td>
                            <td>Template for sending email to subscriber</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" checked /></td>
                        </tr>
                        <tr>
                            <td>Email send to admin</td>
                            <td>Template for sending email to admin</td>
                            <td><input type="checkbox" data-toggle="switchery" data-color="#37BC9B" /></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
