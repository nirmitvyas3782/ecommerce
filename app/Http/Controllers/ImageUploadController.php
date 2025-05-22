<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class ImageUploadController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        //
        $data = [
            'title' => 'Image Gallary | Deedy Admin Panel',
        ];

        $foldersPath = public_path('upload');
        $folders = [];

        if (File::exists($foldersPath)) {
            $folders = array_filter(scandir($foldersPath), function ($item) use ($foldersPath) {
                return $item !== '.' && $item !== '..' && is_dir($foldersPath . '/' . $item);
            });
        }

        $selectedFolder = $request->get('folder');
        $images = [];

        if ($selectedFolder && in_array($selectedFolder, $folders)) {
            $folderPath = $foldersPath . '/' . $selectedFolder;
            $images = array_filter(scandir($folderPath), function ($file) use ($folderPath) {
                return is_file($folderPath . '/' . $file) && in_array(pathinfo($file, PATHINFO_EXTENSION), ['jpg', 'jpeg', 'png', 'gif', 'webp']);
            });
        }

        return view('admin.pages.image_upload.image_gallary', compact('data', 'folders', 'selectedFolder', 'images'));
    }

    /**
     * Create Folder in Public/Upload directory
     */

    public function createFolder(Request $request)
    {
        $request->validate([
            'folder_name' => 'required|string|max:100',
        ]);

        $folderName = preg_replace('/[^a-zA-Z0-9_\-]/', '_', $request->folder_name); // clean folder name
        $path = public_path('upload/' . $folderName);

        if (File::exists($path)) {
            return redirect()->back()->with('error', 'Folder already exists.');
        }

        File::makeDirectory($path, 0755, true);

        return redirect()->back()->with('success', 'Folder created successfully!');
    }

    /* Now Upload Images to selected folder */

    public function uploadImage(Request $request)
    {
        // Validate the request
        $request->validate([
            'image_upload' => 'required|array',
            'image_upload.*' => 'image|max:2048',
            'folder' => 'required|string',
        ]);

        // Sanitize folder name (optional)
        $folder = preg_replace('/[^a-zA-Z0-9_\-]/', '_', $request->folder);

        // Set the path where the image should be stored
        $path = public_path('upload/' . $folder);

        // Check if the folder exists
        if (!File::exists($path)) {
            Log::error('Folder does not exist: ' . $path);
            return redirect()->back()->with('error', 'Target folder does not exist.');
        }

        // Get the uploaded file
        // $file = $request->file('image_upload');
        // $fileName = $file->getClientOriginalName();

        // Try to move the file to the folder

        foreach ($request->file('image_upload') as $file) {
            $fileName = $file->getClientOriginalName();
        
            try {
                $file->move($path, $fileName);
            } catch (\Exception $e) {
                Log::error('File upload failed: ' . $e->getMessage());
                return redirect()->back()->with('error', 'File upload failed.');
            }
        }

        // Success: Redirect back with a success message
        return redirect()
            ->back()
            ->with('success', 'Image uploaded to "' . $folder . '" folder.');
    }

    public function imageInfo(Request $request)
    {
        $request->validate([
            'folder' => 'required|string',
            'file' => 'required|string',
        ]);

        $folder = $request->get('folder');
        $file = $request->get('file');
        $path = public_path("upload/{$folder}/{$file}");

        if (!File::exists($path)) {
            return back()->with('error', 'Image not found.');
        }

        $size = File::size($path); // in bytes
        $uploadDate = date('Y-m-d H:i:s', File::lastModified($path));

        // Load alt text from .json
        $altFile = $path . '.json';
        $altText = File::exists($altFile) ? json_decode(File::get($altFile), true)['alt'] ?? '' : '';

        return back()->with([
            'image_info' => [
                'file' => $file,
                'folder' => $folder,
                'size' => round($size / 1024), // in KB
                'upload_date' => $uploadDate,
                'alt' => $altText,
            ],
        ]);
    }

    public function updateAltText(Request $request)
    {
        $request->validate([
            'folder' => 'required|string',
            'file' => 'required|string',
            'alt' => 'nullable|string',
        ]);

        $filePath = public_path("upload/{$request->folder}/{$request->file}");
        if (!File::exists($filePath)) {
            return back()->with('error', 'Image not found.');
        }

        // Save alt text
        $altData = ['alt' => $request->alt];
        File::put($filePath . '.json', json_encode($altData));

        return back()->with('success', 'Alt text updated.');
    }

    public function deleteImage(Request $request)
    {
        $request->validate([
            'folder' => 'required|string',
            'file' => 'required|string',
        ]);

        $filePath = public_path("upload/{$request->folder}/{$request->file}");
        $altPath = $filePath . '.json';

        if (File::exists($filePath)) {
            File::delete($filePath);
        }
        if (File::exists($altPath)) {
            File::delete($altPath);
        }

        return back()->with('success', 'Image deleted.');
    }
}
