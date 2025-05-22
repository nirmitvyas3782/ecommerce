<?php

namespace App\Http\Controllers\web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Category;
use App\Models\Product;

class CartController extends Controller
{
    //

    public function addToCart(Request $request)
    {
        $product = Product::findOrFail($request->product_id);

        $quantity = $request->input('quantity');
        $price = $request->input('price');
        // $quantity = max((int) $request->quantity_range, 1);

        $cart = $this->getOrCreateCart();

        // Check if item already in cart
        $existingItem = $cart->items()->where('product_id', $product->id)->first();

        if ($existingItem) {
            $existingItem->quantity += $quantity;
            $existingItem->save();
        } else {
            $cart->items()->create([
                'product_id' => $product->id,
                'quantity' => $quantity,
                'price' => $price, // store current price
            ]);
        }

        // Recalculate the total
        $this->updateCartTotal($cart);

        return redirect()->back()->with('success', 'Cart updated successfully!');
        
    }

    public function viewCart()
    {
        $data = ['title' => 'Deedy Supply Portal'];

        $cart = $this->getOrCreateCart()->load('items.product');

        // Extract items and calculate total
        $cartItems = $cart->items;
        
        $cartTotal = $cartItems->sum(function ($item) {
            return $item->price * $item->quantity;
        });
        
        return view('web.pages.cart', compact('cart', 'data', 'cartItems', 'cartTotal'));
    }

    public function removeFromCart(Request $request)
    {
        $cart = $this->getOrCreateCart();

        // Find the cart item that belongs to this cart and product
        $item = CartItem::where('id', $request->product_id)->where('cart_id', $cart->id)->first();

        if ($item) {
            $item->delete();
            $this->updateCartTotal($cart);

            return response()->json(['success' => 'Product removed successfully!']);
        }

        return response()->json(['error' => 'Item not found in your cart.'], 404);
    }

    public function updateCart(Request $request)
    {
        // Get the current cart
        $cart = $this->getOrCreateCart();

        // Loop through each product's quantity input
        foreach ($request->input('quantity', []) as $itemId => $qty) {
            $item = CartItem::where('id', $itemId)->where('cart_id', $cart->id)->first();

            if ($item) {
                $item->quantity = max((int) $qty, 1); // Don't allow 0 or negative quantities
                $item->save();
            }
        }

        // Update total cart amount
        $this->updateCartTotal($cart);

        return redirect()->back()->with('success', 'Cart updated successfully!');
    }

    private function getOrCreateCart()
    {
        if (auth()->check()) {
            return Cart::firstOrCreate(['user_id' => auth()->id(), 'status' => 'pending'], ['total' => 0]);
        }

        return Cart::firstOrCreate(['session_id' => session()->getId(), 'status' => 'pending'], ['total' => 0]);
    }

    private function updateCartTotal(Cart $cart)
    {
        $total = 0;

        foreach ($cart->items as $item) {
            $total += $item->price * $item->quantity;
        }

        $cart->total = $total; // Update the cart total
        $cart->save(); // Save the updated cart
    }
}
