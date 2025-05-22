<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\File;
use App\Models\Product;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //

        $products = Product::all();
        $data = [
            'title' => 'Products | Deedy Admin Panel',
        ];
        return view('admin.pages.products.index', compact('products', 'data'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        $data = [
            'title' => 'Upload Product | Deedy Admin Panel',
        ];
        return view('admin.pages.products.create_product', compact('data'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'upload_product' => 'required|file|mimes:xlsx,xls'
        ]);
    
        DB::beginTransaction();
    
        try {
            $data = Excel::toArray([], $request->file('upload_product'));
            $rows = $data[0] ?? [];
    
            if (count($rows) < 2) {
                return back()->with('error', 'Excel file is empty or missing data.');
            }
    
            // Extract headers
            $headers = array_map(fn($h) => strtolower(str_replace(' ', '_', trim($h))), $rows[0]);
            unset($rows[0]);
    
            $products = [];
    
            foreach ($rows as $index => $rowData) {
                // Stop processing if the entire row is empty
                if (empty(array_filter($rowData, fn($cell) => trim($cell) !== ''))) {
                    break;
                }
                $row = array_combine($headers, $rowData);
    
                if (!isset($row['vendor_code']) || !isset($row['image_name'])) {
                    DB::rollBack();
                    return back()->with('error', "Missing vendor_code or image_name on row " . ($index));
                }
                
                $imageBaseName = trim($row['image_name']);
                $imageExtensions = ['jpg', 'jpeg', 'png', 'webp']; // Add or adjust as needed
                $imagePath = null;

                foreach ($imageExtensions as $ext) {
                    $possiblePath = public_path("upload/product_images/{$imageBaseName}.{$ext}");
                    if (File::exists($possiblePath)) {
                        $imagePath = "upload/product_images/{$imageBaseName}.{$ext}";
                        break;
                    }
                }
                
                if (!$imagePath) {
                    DB::rollBack();
                    return back()->with('error', "Image not found with any supported extension: {$imageBaseName} on row " . ($index + 2));
                }
                // Combine categories into a single string
                $categoryParts = [
                    trim($row['main_category'] ?? ''),
                    trim($row['sub_category'] ?? ''),
                    trim($row['sub_sub_category'] ?? ''),
                ];

                // Filter out empty values and join with ' > '
                $combinedCategory = implode(', ', array_filter($categoryParts));

                $products[] = [
                    'product_name' => trim($row['product_name'] ?? ''),
                    'image_name' => trim($row['image_name']).".".$ext,
                    'vendor_code' => trim($row['vendor_code']),
                    'description' => trim($row['product_description'] ?? ''),
                    'quantity_range' => trim($row['quantity_range'] ?? ''),
                    'product_price' => trim($row['product_price'] ?? ''),
                    'category' => $combinedCategory,
                    'material' => trim($row['materials'] ?? ''),
                ];
            }
            
            // Fetch existing image_names from the database
            $existingImageNames = Product::pluck('image_name')->toArray();

            // Filter only new rows by image_name
            $products = array_filter($products, function ($product) use ($existingImageNames) {
                return !in_array($product['image_name'], $existingImageNames);
            });

            // Stop if there are no new rows
            if (empty($products)) {
                DB::rollBack();
                return back()->with('error', 'No new products to import. All image names already exist.');
            }


            Product::insert($products);
    
            DB::commit();
            return back()->with('success', 'Products imported successfully.');
        } catch (\Exception $e) {
            DB::rollBack();
            \Log::error($e);
            return back()->with('error', 'An error occurred: ' . $e->getMessage());
        }

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
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

    public function getVendorById(string $id) {}
}
