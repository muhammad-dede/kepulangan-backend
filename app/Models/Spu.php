<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Spu extends Model
{
    use HasFactory;

    protected $table = 'spu';
    public $timestamps = false;

    protected $guarded = [];

    public function bast_udara()
    {
        return $this->belongsTo(BastUdara::class, 'id_bast_udara', 'id');
    }

    public function provinsi()
    {
        return $this->belongsTo(Provinsi::class, 'id_provinsi', 'id');
    }

    public function spu_tiket()
    {
        return $this->hasMany(SpuTiket::class, 'id_spu', 'id');
    }
}
