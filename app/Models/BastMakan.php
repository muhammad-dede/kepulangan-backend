<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BastMakan extends Model
{
    use HasFactory;

    protected $table = 'bast_makan';
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

    public function makan()
    {
        return $this->hasMany(Makan::class, 'id_bast_makan', 'id');
    }
}
