<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Makan extends Model
{
    use HasFactory;

    protected $table = 'makan';
    public $timestamps = false;

    protected $guarded = [];

    public function imigran()
    {
        return $this->belongsTo(Imigran::class, 'id_imigran', 'id');
    }

    public function bast_makan()
    {
        return $this->belongsTo(BastMakan::class, 'id_bast_makan', 'id');
    }
}
