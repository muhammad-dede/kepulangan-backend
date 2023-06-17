<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PihakKedua extends Model
{
    use HasFactory;

    protected $table = 'pihak_kedua';
    public $timestamps = false;

    protected $guarded = [];

    public function rujuk_rs_polri()
    {
        return $this->hasMany(RujukRsPolri::class, 'id_pihak_kedua', 'id');
    }

    public function bast_pihak_lain()
    {
        return $this->hasMany(BastPihakLain::class, 'id_pihak_kedua', 'id');
    }
}
