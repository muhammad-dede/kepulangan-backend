<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kepulangan extends Model
{
    use HasFactory;

    protected $table = 'kepulangan';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];

    public function area()
    {
        return $this->belongsToMany(Area::class, 'area_kepulangan', 'id_kepulangan', 'id_area');
    }

    public function layanan()
    {
        return $this->belongsToMany(Layanan::class, 'layanan_kepulangan', 'id_kepulangan', 'id_layanan');
    }
}
