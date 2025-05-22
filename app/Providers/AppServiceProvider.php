<?php

namespace App\Providers;

use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use App\Models\Product;
use App\Models\Cart;
use App\Models\Category;
use App\Models\ContentMeta;
use App\Models\Material;
use App\Models\PopularSearch;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
        view()->composer('*', function ($view) {
            $cartItems = [];
            $cartTotal = 0;

            if (auth()->check()) {
                $cart = Cart::where('user_id', auth()->id())
                    ->where('status', 'pending')
                    ->with('items.product')
                    ->first();
            } else {
                $cart = Cart::where('session_id', session()->getId())
                    ->where('status', 'pending')
                    ->with('items.product')
                    ->first();
            }

            if ($cart) {
                $cartItems = $cart->items;
                $cartTotal = $cartItems->sum(function ($item) {
                    return $item->price * $item->quantity;
                });
            }

            $mainCategories = Category::where(function ($query) {
                $query->whereNull('parent_id')->orWhere('parent_id', '')->orWhere('parent_id', 0);
            })
                ->groupBy('id')
                ->get();

            $productsForHeader = Product::inRandomOrder()->limit(3)->get();

            foreach ($productsForHeader as $product) {
                // Check if the price contains a comma (i.e., it's a range)
                if (strpos($product['product_price'], ',') !== false) {
                    // If it's a range, split the string and find the min and max prices
                    $priceArray = explode(', ', $product['product_price']);

                    $minPrice = min($priceArray);
                    $maxPrice = max($priceArray);
                    // Store the formatted price range
                    $productFormattedPrices[$product['id']] = '₹' . number_format($minPrice) . ' - ₹' . number_format($maxPrice);
                } else {
                    // Otherwise, just display the single price
                    $productFormattedPrices[$product['id']] = 'Price: ₹' . number_format($product['product_price']);
                }

                $subCategoriesCount = [];
                foreach ($mainCategories as $subCategory) {
                    $subCategoriesCount[$subCategory->name] = Product::where('category', 'like', '%' . $subCategory->name . '%')->count();
                }
            }
            $popularSearch = PopularSearch::orderByDesc('count')->take(5)->pluck('term');
            $banner = ContentMeta::where('content_id', 1)->first();
            $banner_footer = ContentMeta::where('content_id', 2)->first();
            $materials = Material::all();

            $view->with(compact('cartItems', 'cartTotal', 'mainCategories', 'banner', 'banner_footer', 'productsForHeader', 'productFormattedPrices','materials', 'popularSearch'));
        });
    }
}
