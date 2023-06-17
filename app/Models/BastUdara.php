<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BastUdara extends Model
{
    use HasFactory;

    protected $table = 'bast_udara';
    public $timestamps = false;

    protected $guarded = [];

    public function penyedia_jasa()
    {
        return $this->belongsTo(PenyediaJasa::class, 'id_penyedia_jasa', 'id');
    }

    public function alamat()
    {
        return $this->belongsTo(Alamat::class, 'id_alamat', 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user', 'id');
    }

    public function udara()
    {
        return $this->hasMany(Udara::class, 'id_bast_udara', 'id');
    }

    public function spu()
    {
        return $this->hasOne(Spu::class, 'id_bast_udara', 'id');
    }
}
