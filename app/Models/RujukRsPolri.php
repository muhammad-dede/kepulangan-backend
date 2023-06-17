<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RujukRsPolri extends Model
{
    use HasFactory;

    protected $table = 'rujuk_rs_polri';
    public $timestamps = false;

    protected $guarded = [];

    public function kepulangan()
    {
        return $this->belongsTo(Kepulangan::class, 'id_kepulangan', 'id');
    }

    public function imigran()
    {
        return $this->belongsTo(Imigran::class, 'id_imigran', 'id');
    }

    public function pihak_kedua()
    {
        return $this->belongsTo(PihakKedua::class, 'id_pihak_kedua', 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user', 'id');
    }
}
