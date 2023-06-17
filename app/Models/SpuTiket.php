<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SpuTiket extends Model
{
    use HasFactory;

    protected $table = 'spu_tiket';
    public $timestamps = false;

    protected $guarded = [];

    public function spu()
    {
        return $this->belongsTo(Spu::class, 'id_spu', 'id');
    }
}
