<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LayananMasalah extends Model
{
    use HasFactory;

    protected $table = 'layanan_masalah';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];
}
