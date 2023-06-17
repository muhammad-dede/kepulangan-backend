<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Darat extends Model
{
    use HasFactory;

    protected $table = 'darat';
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

    public function bast_darat()
    {
        return $this->belongsTo(BastDarat::class, 'id_bast_darat', 'id');
    }
}
