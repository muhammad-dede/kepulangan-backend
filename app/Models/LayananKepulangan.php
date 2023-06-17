<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LayananKepulangan extends Model
{
    use HasFactory;

    protected $table = 'layanan_kepulangan';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];
}
