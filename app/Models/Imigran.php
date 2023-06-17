<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Imigran extends Model
{
    use HasFactory;

    protected $table = 'imigran';
    public $timestamps = false;

    protected $guarded = [];

    public function jenis_kelamin()
    {
        return $this->belongsTo(JenisKelamin::class, 'id_jenis_kelamin', 'id');
    }

    public function negara()
    {
        return $this->belongsTo(Negara::class, 'id_negara', 'id');
    }

    public function sub_kawasan()
    {
        return $this->belongsTo(SubKawasan::class, 'id_sub_kawasan', 'id');
    }

    public function kawasan()
    {
        return $this->belongsTo(Kawasan::class, 'id_kawasan', 'id');
    }

    public function kab_kota()
    {
        return $this->belongsTo(KabKota::class, 'id_kab_kota', 'id');
    }

    public function provinsi()
    {
        return $this->belongsTo(Provinsi::class, 'id_provinsi', 'id');
    }

    public function jabatan()
    {
        return $this->belongsTo(Jabatan::class, 'id_jabatan', 'id');
    }

    public function area()
    {
        return $this->belongsTo(Area::class, 'id_area', 'id');
    }

    public function layanan()
    {
        return $this->belongsTo(Layanan::class, 'id_layanan', 'id');
    }

    public function kepulangan()
    {
        return $this->belongsTo(Kepulangan::class, 'id_kepulangan', 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user', 'id');
    }

    public function pmi()
    {
        return $this->hasOne(Pmi::class, 'id_imigran', 'id');
    }

    public function jenazah()
    {
        return $this->hasOne(Jenazah::class, 'id_imigran', 'id');
    }

    public function darat()
    {
        return $this->hasOne(Darat::class, 'id_imigran', 'id');
    }

    public function udara()
    {
        return $this->hasOne(Udara::class, 'id_imigran', 'id');
    }

    public function rujuk_rs_polri()
    {
        return $this->hasOne(RujukRsPolri::class, 'id_imigran', 'id');
    }

    public function pulang_mandiri()
    {
        return $this->hasOne(PulangMandiri::class, 'id_imigran', 'id');
    }

    public function jemput_keluarga()
    {
        return $this->hasOne(JemputKeluarga::class, 'id_imigran', 'id');
    }

    public function jemput_pihak_lain()
    {
        return $this->hasOne(JemputPihakLain::class, 'id_imigran', 'id');
    }

    public function makan()
    {
        return $this->hasMany(Makan::class, 'id_imigran', 'id');
    }
}
