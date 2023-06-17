<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BastPihakLain extends Model
{
    use HasFactory;

    protected $table = 'bast_pihak_lain';
    public $timestamps = false;

    protected $guarded = [];

    public function pihak_kedua()
    {
        return $this->belongsTo(PihakKedua::class, 'id_pihak_kedua', 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user', 'id');
    }

    public function jemput_pihak_lain()
    {
        return $this->hasMany(JemputPihakLain::class, 'id_bast_pihak_lain', 'id');
    }
}
