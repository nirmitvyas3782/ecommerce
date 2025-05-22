<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;

class ViewOrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $data = [
            'title' => 'Order List | Deedy Admin Panel',
        ];
        $orders = Order::all();
        return view('admin.pages.order.index', compact('data', 'orders'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        // Fetch the order by ID
        $order = Order::findOrFail($id);

        // Fetch related order items
        $orderItems = OrderItem::where('order_id', $id)->get();
        $products = Product::whereIn('id', $orderItems->pluck('product_id'))->get();

        $data = [
            'title' => 'Order Details | Deedy Admin Panel',
            'order' => $order,
            'orderItems' => $orderItems,
        ];

        return view('admin.pages.order.order_detail', compact('data'));
    }

    public function updateStatus(Request $request, $id)
    {
        $order = Order::findOrFail($id);
        if ($order->status === 'processing') {
            $order->status = 'completed';
            $order->save();
        }
        return redirect()->back()->with('success', 'Order status updated!');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
