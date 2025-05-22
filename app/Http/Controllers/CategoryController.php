<?php

namespace App\Http\Controllers;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $data = [
            'title' => 'Categories | Deedy Admin Panel',
        ];

        $categories = Category::with('parent')->get();

        if ($request->wantsJson()) {
            return response()->json([
                'success' => true,
                'message' => 'Category list fetched successfully.',
                'data' => $categories,
            ]);
        }

        return view('admin.pages.categories.index', compact('categories', 'data'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        $parentCategories = Category::all();
        $data = [
            'title' => 'Categories | Deedy Admin Panel',
        ];
        return view('admin.pages.categories.create_category', compact('parentCategories', 'data'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //

        $request->validate([
            'name' => 'required|string|max:255',
            'parent_id' => 'nullable|exists:categories,id',
            'category_image' => 'image|max:2048',
        ]);

        $imagePath = null;

        if ($request->hasFile('category_image')) {
            $imagePath = $request->file('category_image')->store('upload/category_images', 'public');
        }

        Category::create([
            'name' => $request->name,
            'parent_id' => $request->parent_id,
            'category_image' => $imagePath,
        ]);

        return redirect()->route('category.index')->with('success', 'Category created successfully.');
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
        $data = [
            'title' => 'Edit Category | Deedy Admin Panel',
        ];
        $category = Category::findOrFail($id);
        $parentCategories = Category::all();
        return view('admin.pages.categories.edit_category', compact('category', 'parentCategories', 'data'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            // Validate input
            $request->validate([
                'name' => 'required|string|max:255',
                'parent_id' => 'nullable|exists:categories,id',
                'category_image' => 'image|max:2048',
            ]);

            if ($request->parent_id == $id) {
                return redirect()->route('category.index')->with('failed', 'A category cannot be its own parent.');
            }

            $category = Category::findOrFail($id);

            // Keep old image unless new one is uploaded
            $imagePath = $category->category_image;

            if ($request->hasFile('category_image')) 
            {
                // Delete old image if it exists
                if ($imagePath && file_exists(public_path($imagePath))) 
                {
                    unlink(public_path($imagePath));
                }
                $file = $request->file('category_image');
                $filename = time() . '_' . uniqid() . '.' . $file->getClientOriginalExtension();
                $file->move(public_path('upload/category_images'), $filename);
            }
            $imagePath = 'upload/category_images/' . $filename;

            $category->update([
                'name' => $request->name,
                'parent_id' => $request->parent_id,
                'category_image' => $imagePath,
            ]);

            return redirect()->route('category.index')->with('success', 'Category updated successfully.');
        } catch (Exception $e) {
            // Log the actual error for debugging
            Log::error('Category update failed: ' . $e->getMessage());

            return redirect()->route('category.index')->with('failed', 'Something went wrong while updating the category.');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
        $category = Category::findOrFail($id);
        $category->delete();

        return redirect()->route('category.index')->with('success', 'Category deleted successfully.');
    }
}
