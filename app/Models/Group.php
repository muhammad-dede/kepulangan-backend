<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    use HasFactory;

    protected $table = 'group';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];

    public function layanan()
    {
        return $this->belongsToMany(Layanan::class, 'layanan_group', 'id_group', 'id_layanan');
    }
}
