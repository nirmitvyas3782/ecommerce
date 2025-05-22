<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Price extends Model
{
    //
    use HasFactory;

    protected $table = 'product_price';
    protected $fillable = ['product_id', 'quantity_range', 'price'];

    public function products()
    {
        return $this->belongsTo(Product::class);
    }
}
