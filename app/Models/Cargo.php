<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cargo extends Model
{
    use HasFactory;

    protected $table = 'cargo';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];

    public function layanan()
    {
        return $this->belongsToMany(Layanan::class, 'layanan_cargo', 'id_cargo', 'id_layanan');
    }
}
