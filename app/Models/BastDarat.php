<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BastDarat extends Model
{
    use HasFactory;

    protected $table = 'bast_darat';
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

    public function darat()
    {
        return $this->hasMany(Darat::class, 'id_bast_darat', 'id');
    }
}
