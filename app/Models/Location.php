<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Location extends Model
{
    //
    use HasFactory;
    protected $table = 'location';
    protected $fillable = [
        'user_id',
        'user_type',
        'user_location',
        'user_lat',
        'user_lon',
        'user_ip',
    ];
}
