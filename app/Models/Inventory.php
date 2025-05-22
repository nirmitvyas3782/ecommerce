<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Inventory extends Model
{
    //
    protected $table = 'inventory'; // or whatever the correct table is

    protected $fillable = ['product_id', 'quantity'];
    
    public function products()
    {
        return $this->belongsToMany(Product::class, 'inventory');
    }
}
