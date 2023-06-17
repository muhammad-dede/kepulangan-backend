<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Provinsi extends Model
{
    use HasFactory;

    protected $table = 'provinsi';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];

    public function kab_kota()
    {
        return $this->hasMany(KabKota::class, 'id_provinsi', 'id');
    }
}
