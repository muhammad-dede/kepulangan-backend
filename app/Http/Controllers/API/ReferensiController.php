<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Area;
use App\Models\Group;
use App\Models\Jabatan;
use App\Models\JenisKelamin;
use App\Models\KabKota;
use App\Models\Negara;
use App\Models\Provinsi;
use Illuminate\Http\Request;

use function PHPUnit\Framework\isEmpty;

class ReferensiController extends Controller
{
    public function area()
    {
        $data = Area::with(['antar_area.from_area', 'antar_area.to_area', 'layanan', 'layanan.group', 'layanan.masalah', 'layanan.kepulangan', 'layanan.cargo', 'kepulangan'])->orderBy('id', 'asc')->get();
        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    public function group()
    {
        $data = Group::orderBy('id', 'asc')->get();
        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    public function jenis_kelamin()
    {
        $data = JenisKelamin::orderBy('id', 'asc')->get();
        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    public function negara()
    {
        $data = Negara::with(['sub_kawasan', 'sub_kawasan.kawasan'])->orderBy('nama', 'asc')->get();
        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    public function provinsi()
    {
        $data = Provinsi::orderBy('nama', 'asc')->get();
        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    public function kab_kota(Request $request)
    {
        if ($request->get('id_provinsi')) {
            $data = KabKota::where('id_provinsi', $request->get('id_provinsi'))->orderBy('nama', 'asc')->get();
        } else {
            $data = KabKota::with(['provinsi'])->orderBy('nama', 'asc')->get();
        }
        return response()->json([
            'message' => 'Success',
            'total' => $data->count(),
            'data' => $data,
        ], 200);
    }

    public function jabatan()
    {
        $data = Jabatan::orderBy('id', 'asc')->get();
        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }
}
