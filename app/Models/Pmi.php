<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pmi extends Model
{
    use HasFactory;

    protected $table = 'pmi';
    public $timestamps = false;

    protected $guarded = [];

    public function imigran()
    {
        return $this->belongsTo(Imigran::class, 'id_imigran', 'id');
    }

    public function group()
    {
        return $this->belongsTo(Group::class, 'id_group', 'id');
    }

    public function masalah()
    {
        return $this->belongsTo(Masalah::class, 'id_masalah', 'id');
    }
}
