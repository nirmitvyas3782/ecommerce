<?php

namespace App\Http\Controllers\web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

use App\Models\Category;
use App\Models\Product;


class HomeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = ['title' => '| Deedy Supply Portal'];

        //$products = Product::all();
        
        $products = Product::limit(10)->get();

        $productsByMainCategory = [];
        
        $mainCategories = Category::where(function ($query) {
            $query->whereNull('parent_id')->orWhere('parent_id', '')->orWhere('parent_id', 0);})->get();

        foreach ($mainCategories as $mainCategory) {
            $productsByMainCategory[$mainCategory->name] = Product::where('category', 'like%', $mainCategory->name . '%')->get();
        }

        // Loop through the prices and check if the value is a range
        $priceRange = [];

        $minPrice = Product::min('product_price');
        $maxPrice = Product::max('product_price');


        foreach ($products as $product) 
        {
            $priceString = $product['product_price'];
            $priceArray = array_map('trim', explode(',', $priceString));
            $priceArray = array_map('intval', $priceArray);
            $minPrice = min($priceArray);
            $maxPrice = max($priceArray);

            if ($minPrice === $maxPrice) 
            {
                $formattedPrices[$product['id']] = 'Price: ₹' . number_format($minPrice);
            }
            else 
            {
                $formattedPrices[$product['id']] = '₹' . number_format($minPrice) . ' - ₹' . number_format($maxPrice);
            }

            $subCategoriesCount = [];

            foreach ($mainCategories as $subCategory) {
                $subCategoriesCount[$subCategory->name]= Product::where('category', 'like', '%'. $subCategory->name . '%')->count();
            }
            
        }
        return view('web.pages.index', compact('data', 'products', 'productsByMainCategory', 'formattedPrices','subCategoriesCount'));
    }

    public function productDetails(String $id)
    {
        $data = ['title' => 'Deedy Supply Portal'];

        $product = Product::findOrFail($id);

        $productsByMainCategory = [];
        $quantityRanges = [];
        $rangePrices = [];

        // If product has tiered pricing

        if ($product->quantity_range && $product->product_price) {
            $quantityRanges = explode(',', $product->quantity_range); // e.g., "500+", "400-499", ...
            $rangePrices = explode(',', $product->product_price);      // e.g., 2500, 2600, ...
        }
        
        return view('web.pages.product_detail', compact('data', 'product','quantityRanges', 'rangePrices'));
    }

    public function wishList()
    {
        return view('web.pages.wish_list');
    }

   
}
