<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\City;
use App\Models\State;
use App\Models\Country;
use App\Models\Vendor;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Response;

class VendorController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $data = [
            'title' => 'Vendors | Deedy Admin Panel',
        ];

        $vendors = Vendor::all();
        return view('admin.pages.vendors.index', compact('vendors', 'data'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        $countries = Country::all();

        return view('admin.pages.vendors.create_vendor', compact('countries'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        $request->validate([
            'name' => 'required|string|max:255',
            'slug' => 'required|string|max:255|unique:vendors',
            'company_name' => 'required|string|max:255',
            'vendor_code' => 'required|string|max:100',
            'email' => 'required|email|unique:vendors',
            'phone' => 'required|string|max:15',
            'alternate_phone' => 'nullable|string|max:15',
            'address' => 'required|string',
            'city' => 'required|string|max:100',
            'state' => 'required|string|max:100',
            'country' => 'required|string|max:100',
            'pin_code' => 'required|string|max:10',
            'gst_number' => 'nullable|string|max:15',
            'pan_number' => 'nullable|string|max:10',
            'business_type' => 'required|string|max:100',
            'industry' => 'required|string|max:100',
            'website' => 'nullable|url',
            'profile_photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'meta' => 'nullable|string',
            'rental_radius' => 'required',
            'status' => 'nullable'
        ]);
       
        // Handle the profile photo upload if any
        $profilePhotoPath = null;
        if ($request->hasFile('profile_photo')) {
            $profilePhotoPath = $request->file('profile_photo')->store('profile_photos', 'public');
        }

         // Step 4: Store the data
         $vendor = Vendor::create([
            'name' => $request->name,
            'slug' => $request->slug,
            'company_name' => $request->company_name,
            'vendor_code' => $request->vendor_code,
            'email' => $request->email,
            'phone' => $request->phone,
            'alternate_phone' => $request->alternate_phone,
            'address' => $request->address,
            'city' => $request->city,
            'state' => $request->state,
            'country' => $request->country,
            'pincode' => $request->pin_code,
            'gst_number' => $request->gst_number,
            'pan_number' => $request->pan_number,
            'business_type' => $request->business_type,
            'industry' => $request->industry,
            'website' => $request->website,
            'profile_photo' => $profilePhotoPath,
            'status' => 'Active',
            'meta' => $request->meta,
            'rental_radius' => $request->rental_radius
        ]);

        if($vendor)
        {
             // Step 5: Return a success response
            return response()->json([
                'status' => 'success',
                'message' => 'Vendor created successfully',
                'data' => $vendor
            ], 201);

        }
        else
        {
            return response()->json([
                'status' => 'success',
                'message' => 'Failed to create Vendor',
            ], 501);

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
        $vendor = Vendor::findOrFail($id);
        $cities = City::where('state_id', $vendor->state)->get();
        $states = State::where('country_id', $vendor->country)->get();
        $countries = Country::all();

        return view('admin.pages.vendors.edit_vendor', compact('vendor', 'cities', 'states', 'countries'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
        $vendor = Vendor::findOrFail($id);  
        
        //
        $request->validate([
            'name' => 'required|string|max:255',
            'slug' => 'required|string|max:255',
            'company_name' => 'required|string|max:255',
            'vendor_code' => 'required|string|max:100',
            'email' => 'required|email',
            'phone' => 'required|string|max:15',
            'alternate_phone' => 'nullable|string|max:15',
            'address' => 'required|string',
            'city' => 'required|string|max:100',
            'state' => 'required|string|max:100',
            'country' => 'required|string|max:100',
            'pin_code' => 'required|string|max:10',
            'gst_number' => 'nullable|string|max:15',
            'pan_number' => 'nullable|string|max:10',
            'business_type' => 'required|string|max:100',
            'industry' => 'required|string|max:100',
            'website' => 'nullable|url',
            'profile_photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'meta' => 'nullable|string',
            'rental_radius' => 'required',
            'status' => 'nullable'
        ]);
       
        // Handle the profile photo upload if any
        $profilePhotoPath = null;

        if ($request->hasFile('profile_photo')) {

            if ($vendor->id && $vendor->profile_photo) {
                // Delete the old photo if it exists
                Storage::disk('public')->delete($vendor->profile_photo);
            }

            $profilePhotoPath = $request->file('profile_photo')->store('profile_photos', 'public');
             // Save the new path to the vendor
        }
        $vendor->update([
            'name' => $request->name,
            'slug' => $request->slug,
            'company_name' => $request->company_name,
            'vendor_code' => $request->vendor_code,
            'email' => $request->email,
            'phone' => $request->phone,
            'alternate_phone' => $request->alternate_phone,
            'address' => $request->address,
            'city' => $request->city,
            'state' => $request->state,
            'country' => $request->country,
            'pincode' => $request->pin_code,
            'gst_number' => $request->gst_number,
            'pan_number' => $request->pan_number,
            'business_type' => $request->business_type,
            'industry' => $request->industry,
            'website' => $request->website,
            'profile_photo' => $profilePhotoPath,
            'status' => 'Active',
            'meta' => $request->meta,
            'rental_radius' => $request->rental_radius
        ]);

        return redirect()->route('vendor.index')->with('success', 'Vendor updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
         //
         $vendor = Vendor::findOrFail($id);
         $vendor->delete();
 
         return redirect()->route('vendor.index')->with('success', 'Vendor deleted successfully.');
    }

    public function getStates($country_id)
    {
        $states = State::where('country_id', $country_id)->pluck('name', 'id');
        return response()->json($states);
    }

    public function getCities($state_id)
    {
        $cities = City::where('state_id', $state_id)->pluck('city', 'id');
        return response()->json($cities);
    }

    
}
