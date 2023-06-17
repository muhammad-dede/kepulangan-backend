<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AreaKepulangan extends Model
{
    use HasFactory;

    protected $table = 'area_kepulangan';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];
}
