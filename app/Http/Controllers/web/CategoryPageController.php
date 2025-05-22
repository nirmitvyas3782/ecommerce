<?php

namespace App\Http\Controllers\web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Product;
use App\Models\Material;

class CategoryPageController extends Controller
{
    //

    public function index(string $param)
    {
        $data = ['title' => 'Category Page'];

        $category = Category::where('name', $param)->firstOrFail();
        $subCategories = Category::where('parent_id', $category->id)->get();

        $mainCategories = Category::where(function ($query) {
            $query->whereNull('parent_id')->orWhere('parent_id', '')->orWhere('parent_id', 0);
        })->get();

        $products = Product::where('category', 'like', $category->name . '%')
            ->limit(10)
            ->get();

        $subCategoriesCount = [];
        foreach ($subCategories as $subCategory) {
            $subCategoriesCount[$subCategory->name] = Product::where('category', 'like', '%' . $subCategory->name . '%')->count();
        }

        return view('web.pages.categories', compact('data', 'subCategories', 'category', 'products', 'subCategoriesCount', 'mainCategories'));
    }

    public function getProductByCategory(string $name, string $subCategory, Request $request)
    {
        $data = ['title' => 'Products By Category'];

        $filter = $request->query('filter');
        $category = Category::where('name', $subCategory)->firstOrFail();

        $query = Product::query();

        // Filter by category
        $query->where('category', 'like', '%' . $category->name . '%');

        // Apply material filter if present
        if ($filter) {
            $query->where('material', 'like', '%' . $filter . '%');
        }

        $products = $query->paginate(12)->appends($request->query());

        $productsCount = $query->count();

        $formattedPrices = [];
        foreach ($products as $product) {
            $priceString = $product['product_price'];
            $priceArray = array_map('trim', explode(',', $priceString));
            $priceArray = array_map('intval', $priceArray);
            $minPrice = min($priceArray);
            $maxPrice = max($priceArray);

            if ($minPrice === $maxPrice) {
                $formattedPrices[$product['id']] = 'Price: ₹' . number_format($minPrice);
            } else {
                $formattedPrices[$product['id']] = '₹' . number_format($minPrice) . ' - ₹' . number_format($maxPrice);
            }
        }

        return view('web.pages.category_page', compact('data', 'category', 'name', 'products', 'formattedPrices', 'productsCount'));
    }
}
