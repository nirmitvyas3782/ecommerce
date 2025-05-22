<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Device extends Model
{
    //
    use HasFactory;

    protected $table = 'device'; // Custom table name
    protected $fillable = [
    'device_type',
    'device_name',
    'browser',
    'browser_version',
    'platform',
    'platform_version',
    'ip_address',
    'user_id',
    'user_type',
];


}
