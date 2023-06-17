<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Masalah extends Model
{
    use HasFactory;

    protected $table = 'masalah';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];

    public function layanan()
    {
        return $this->belongsToMany(Layanan::class, 'layanan_masalah', 'id_masalah', 'id_layanan');
    }
}
