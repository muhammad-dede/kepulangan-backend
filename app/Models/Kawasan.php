<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kawasan extends Model
{
    use HasFactory;

    protected $table = 'kawasan';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];

    public function sub_kawasan()
    {
        return $this->hasMany(SubKawasan::class, 'id_kawasan', 'id');
    }
}
