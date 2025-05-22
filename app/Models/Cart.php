<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    //
    protected $fillable = ['user_id', 'session_id', 'guest_email', 'total', 'status'];

    public function items()
    {
        return $this->hasMany(CartItem::class)->with('product');
    }
}
