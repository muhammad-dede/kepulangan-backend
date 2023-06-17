<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LayananGroup extends Model
{
    use HasFactory;

    protected $table = 'layanan_group';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];
}
