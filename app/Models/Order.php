<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    //
    protected $fillable = ['user_id', 'status', 'total', 'user_email', 'user_phone'];

    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }

}
