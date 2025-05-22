<?php

namespace App\Http\Controllers\web;
use Illuminate\Support\Facades\Log;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\Cart;
use App\Models\Category;
use App\Models\Order;
use App\Models\OrderItem;

class OrderController extends Controller
{
    //
    public function orderSuccess()
    {
        // Assuming cart is already loaded via AppServiceProvider or helper
        $data = ['title' => 'Deedy Supply Portal'];
        // $mainCategories = Category::where(function ($query) {
        //     $query->whereNull('parent_id')->orWhere('parent_id', '')->orWhere('parent_id', 0);
        // })->get();
        return view('web.pages.checkout', compact('data'));
    }

    public function placeOrder(Request $request)
    {
        $data = ['title' => 'Deedy Supply Portal'];
        DB::beginTransaction();

        try {
            $cart = Cart::where('session_id', session()->getId())
                ->where('status', 'pending')
                ->with('items.product')
                ->first();

            if (!$cart || $cart->items->isEmpty()) {
                return redirect()->back()->with('error', 'Cart is empty.');
            }

            $order = Order::create([
                'user_id' => 1,
                'company_name' => $request->user_email,
                'user_phone' => $request->user_phone,
                'status' => 'processing',
                'total' => $cart->items->sum(fn($item) => $item->price * $item->quantity),
            ]);

            foreach ($cart->items as $item) {
                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $item->product_id,
                    'quantity' => $item->quantity,
                    'price' => $item->price,
                ]);
            }

            /// Delete cart items
            $cart->items()->delete();
            $cart->delete();

            DB::commit();

            return redirect()->route('order.success')->with('success', 'Order placed successfully!');

            
        } catch (\Exception $e) {
            DB::rollback();

            Log::error('Order placement failed', [
                'message' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
                'user_id' => auth()->id(),
                'session_id' => session()->getId(),
            ]);

            return redirect()
                ->back()
                ->with('error', 'Order failed: ' . $e->getMessage());
        }
    }
}
