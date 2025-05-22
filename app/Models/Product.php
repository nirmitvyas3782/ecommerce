<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class Product extends Model
{
    //
    use HasFactory;
    
    
    protected $table = 'products';

    protected $fillable = ['product_name', 'image_name', 'vendor_code', 'description', 'quantity_range', 'product_price', 'category', 'material'];
    
}
