<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Negara extends Model
{
    use HasFactory;

    protected $table = 'negara';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];

    public function sub_kawasan()
    {
        return $this->belongsTo(SubKawasan::class, 'id_sub_kawasan', 'id');
    }
}
