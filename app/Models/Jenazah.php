<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jenazah extends Model
{
    use HasFactory;

    protected $table = 'jenazah';
    public $timestamps = false;

    protected $guarded = [];

    public function imigran()
    {
        return $this->belongsTo(Imigran::class, 'id_imigran', 'id');
    }

    public function cargo()
    {
        return $this->belongsTo(Cargo::class, 'id_cargo', 'id');
    }
}
