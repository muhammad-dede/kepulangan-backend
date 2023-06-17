<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Area extends Model
{
    use HasFactory;

    protected $table = 'area';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];

    public function antar_area()
    {
        return $this->hasOne(AntarArea::class, 'from_area', 'id');
    }

    public function layanan()
    {
        return $this->belongsToMany(Layanan::class, 'area_layanan', 'id_area', 'id_layanan');
    }

    public function kepulangan()
    {
        return $this->belongsToMany(Kepulangan::class, 'area_kepulangan', 'id_area', 'id_kepulangan');
    }
}
