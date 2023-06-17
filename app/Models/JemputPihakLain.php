<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JemputPihakLain extends Model
{
    use HasFactory;

    protected $table = 'jemput_pihak_lain';
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

    public function bast_pihak_lain()
    {
        return $this->belongsTo(BastPihakLain::class, 'id_bast_pihak_lain', 'id');
    }
}
