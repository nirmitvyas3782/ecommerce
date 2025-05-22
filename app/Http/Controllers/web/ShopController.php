<?php

namespace App\Http\Controllers\web;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\PopularSearch;

class ShopController extends Controller
{
    //
    public function index(Request $request)
    {
        $data = ['title' => 'Shop | Deedy Supply Portal'];

        $search = $request->query('search');
        $keyword = trim($request->input('search'));

        $query = Product::query();

        if ($search) {
            $query->where('product_name', 'like', '%' . $search . '%');
        }

        if (!empty($keyword)) {
            $hasProducts = Product::where('product_name', 'LIKE', '%' . $keyword . '%')->exists();

            if ($hasProducts) {
                // Only update count if products exist
                PopularSearch::updateOrCreate(['term' => $keyword], ['count' => DB::raw('count + 1')]);
            }
        }

        $products = $query->get();
        $products = $query->paginate(12)->appends($request->query());

        $mainCategories = Category::where(function ($query) {
            $query->whereNull('parent_id')->orWhere('parent_id', '')->orWhere('parent_id', 0);
        })->get();

        $productsByMainCategory = [];
        $productsByMainCategoryCount = [];

        foreach ($mainCategories as $mainCategory) {
            $productsByMainCategory[$mainCategory->name] = Product::where('category', 'like', $mainCategory->name . '%')->get();
        }

        foreach ($mainCategories as $mainCategory) {
            $productsByMainCategoryCount[$mainCategory->name] = Product::where('category', 'like', $mainCategory->name . '%')->count();
        }

        $priceRange = [];
        $formattedPrices = [];

        foreach ($products as $product) {
            // Check if the price contains a comma (i.e., it's a range)
            if (strpos($product['product_price'], ',') !== false) {
                // If it's a range, split the string and find the min and max prices
                $priceArray = explode(', ', $product['product_price']);
                $minPrice = min($priceArray);
                $maxPrice = max($priceArray);

                // Store the formatted price range
                $formattedPrices[$product['id']] = '₹' . number_format($minPrice) . ' - ₹' . number_format($maxPrice);
            } else {
                // Otherwise, just display the single price
                $formattedPrices[$product['id']] = 'Price: ₹' . number_format($product['product_price']);
            }
        }

        return view('web.pages.shop', compact('data', 'products', 'formattedPrices', 'mainCategories', 'productsByMainCategoryCount', 'search'));
    }
}
