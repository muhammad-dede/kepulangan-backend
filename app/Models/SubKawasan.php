<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubKawasan extends Model
{
    use HasFactory;

    protected $table = 'sub_kawasan';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];

    public function kawasan()
    {
        return $this->belongsTo(Kawasan::class, 'id_kawasan', 'id');
    }

    public function negara()
    {
        return $this->hasMany(Negara::class, 'id_sub_kawasan', 'id');
    }
}
