<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AntarArea extends Model
{
    use HasFactory;

    protected $table = 'antar_area';
    public $incrementing = false;
    public $timestamps = false;

    protected $guarded = [];

    public function from_area()
    {
        return $this->belongsTo(Area::class, 'from_area', 'id');
    }

    public function to_area()
    {
        return $this->belongsTo(Area::class, 'to_area', 'id');
    }
}
