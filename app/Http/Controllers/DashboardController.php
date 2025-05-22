<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\Product;
use App\Models\Device;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $data = [
            'title' => 'Dashboard | Deedy Admin Panel',
        ];
        $totalProducts = Product::all()->count();
        $previousTotalProducts = Product::whereDate('created_at', Carbon::yesterday())->count();
        
        $percentageChange = 0;

        if($previousTotalProducts > 0)
        {
            $percentageChange = (($totalProducts - $previousTotalProducts) / $previousTotalProducts) * 100;
        }

        $totalVisits = Device::all()->count();
        $previousTotalVisits = Device::whereDate('created_at', Carbon::yesterday())->count();

        $visitPercentageChange = 0;

        if($previousTotalVisits > 0)
        {
            $visitPercentageChange = (($totalVisits - $previousTotalVisits) / $previousTotalVisits) * 100;
        }

        return view('admin.pages.dashboard.index', compact('data', 'totalProducts', 'percentageChange', 'totalVisits','visitPercentageChange'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
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
}
