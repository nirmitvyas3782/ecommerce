<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class City extends Model
{
    //
    //
    use HasFactory;

    protected $table = 'cities'; // Custom table name
    protected $fillable = ['city', 'state_id'];

    public function state() {
        return $this->belongsTo(State::class);
    }
}
