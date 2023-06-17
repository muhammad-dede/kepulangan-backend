<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Udara extends Model
{
    use HasFactory;

    protected $table = 'udara';
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

    public function bast_udara()
    {
        return $this->belongsTo(BastUdara::class, 'id_bast_udara', 'id');
    }
}
