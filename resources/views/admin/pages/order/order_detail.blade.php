@extends('admin.layout.home')
@section('content')

<div class="container mt-4">
    <h2 class="mb-4">Order Details</h2>
    <div class="row">
        <!-- Order & Customer Info -->
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header bg-primary text-white">
                    <strong>Order #{{ $data['order']->id }}</strong>
                </div>
                <div class="card-body">
                    <p><strong>Customer Name:</strong> {{ $data['order']->customer_name ?? 'N/A' }}</p>
                    <p><strong>Email:</strong> {{ $data['order']->customer_email ?? 'N/A' }}</p>
                    <p><strong>Status:</strong> 
                        <span class="badge bg-info text-dark">{{ ucfirst($data['order']->status) }}</span>
                    </p>
                    <p><strong>Order Date:</strong> {{ $data['order']->created_at->format('d M Y, H:i') }}</p>
                    <p><strong>Total Amount:</strong> <span class="fw-bold text-success">₹{{ number_format($data['order']->total, 2) }}</span></p>
                </div>
            </div>
        </div>
        <!-- Shipping/Other Info (optional, remove if not needed) -->
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header bg-secondary text-white">
                    <strong>Shipping Details</strong>
                </div>
                <div class="card-body">
                    <p><strong>Address:</strong> {{ $data['order']->shipping_address ?? 'N/A' }}</p>
                    <p><strong>Phone:</strong> {{ $data['order']->customer_phone ?? 'N/A' }}</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Order Items Table -->
    <div class="card">
        <div class="card-header bg-dark text-white">
            <strong>Order Items</strong>
        </div>
        <div class="card-body p-0">
            <table class="table table-striped mb-0">
                <thead class="table-light">
                    <tr>
                        <th>#</th>
                        <th>Product</th>
                        <th>Qty</th>
                        <th>Unit Price</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($data['orderItems'] as $index => $item)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <td>{{ $item->product->product_name ?? 'N/A' }}</td>
                            <td>{{ $item->quantity }}</td>
                            <td>₹{{ number_format($item->price, 2) }}</td>
                            <td>₹{{ number_format($item->quantity * $item->price, 2) }}</td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="5" class="text-center">No items found for this order.</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>

@endsection