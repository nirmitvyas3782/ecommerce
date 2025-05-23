<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class State extends Model
{
    //
    //
    use HasFactory;

    protected $table = 'states'; // Custom table name
    protected $fillable = ['name','country_id'];

    public function country() {
        return $this->belongsTo(Country::class);
    }

    public function cities() {
        return $this->hasMany(City::class);
    }
}
