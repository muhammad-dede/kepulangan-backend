<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AreaLayanan extends Model
{
    use HasFactory;

    protected $table = 'area_layanan';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];
}
