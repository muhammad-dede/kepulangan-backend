<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Layanan extends Model
{
    use HasFactory;

    protected $table = 'layanan';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];

    public function area()
    {
        return $this->belongsToMany(Area::class, 'area_layanan', 'id_layanan', 'id_area');
    }

    public function group()
    {
        return $this->belongsToMany(Group::class, 'layanan_group', 'id_layanan', 'id_group');
    }

    public function masalah()
    {
        return $this->belongsToMany(Masalah::class, 'layanan_masalah', 'id_layanan', 'id_masalah');
    }

    public function kepulangan()
    {
        return $this->belongsToMany(Kepulangan::class, 'layanan_kepulangan', 'id_layanan', 'id_kepulangan');
    }

    public function cargo()
    {
        return $this->belongsToMany(Cargo::class, 'layanan_cargo', 'id_layanan', 'id_cargo');
    }

    public function imigran()
    {
        return $this->hasMany(Imigran::class, 'id_layanan', 'id');
    }
}
