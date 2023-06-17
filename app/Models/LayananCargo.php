<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LayananCargo extends Model
{
    use HasFactory;

    protected $table = 'layanan_cargo';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];
}
