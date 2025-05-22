<?php

namespace App\Http\Controllers\web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PageController extends Controller
{
    //
    public function about()
    {
        $data =[
            'title' => 'About Us | Deedy Supply Portal',
        ];
        return view('web.pages.about', compact('data'));
    }
}
