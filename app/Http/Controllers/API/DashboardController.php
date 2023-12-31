<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Imigran;
use App\Models\Layanan;
use App\Models\Pmi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function total_layanan(Request $request)
    {
        $layanan = Layanan::withCount(['imigran AS total']);

        if ($request->id_layanan) {
            $data = $layanan->whereIn('id', $request->id_layanan)->get();
        } else {
            $data = $layanan->get();
        }

        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    public function total_jenis_kelamin($id_layanan)
    {
        $data = Imigran::select(DB::raw('jenis_kelamin.nama AS label, COUNT(*) AS value'))
            ->join('jenis_kelamin', 'jenis_kelamin.id', '=', 'imigran.id_jenis_kelamin')
            ->groupBy('imigran.id_jenis_kelamin')
            ->where('id_layanan', $id_layanan)
            ->get();

        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    public function total_masalah($id_layanan)
    {
        $data = Pmi::select(DB::raw('masalah.nama AS label, COUNT(*) AS value'))
            ->join('masalah', 'masalah.id', '=', 'pmi.id_masalah')
            ->groupBy('pmi.id_masalah')
            ->whereHas('imigran', function ($query) use ($id_layanan) {
                $query->where('id_layanan', $id_layanan);
            })->get();

        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    public function total_negara($id_layanan)
    {
        $data = Imigran::select(DB::raw('negara.nama AS label, COUNT(*) AS value'))
            ->join('negara', 'negara.id', '=', 'imigran.id_negara')
            ->groupBy('imigran.id_negara')
            ->where('id_layanan', $id_layanan)
            ->get();

        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    public function total_provinsi($id_layanan)
    {
        $data = Imigran::select(DB::raw('provinsi.nama AS label, COUNT(*) AS value'))
            ->join('provinsi', 'provinsi.id', '=', 'imigran.id_provinsi')
            ->groupBy('imigran.id_provinsi')
            ->where('id_layanan', $id_layanan)
            ->get();

        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    public function total_kab_kota($id_layanan)
    {
        $data = Imigran::select(DB::raw('kab_kota.nama AS label, COUNT(*) AS value'))
            ->join('kab_kota', 'kab_kota.id', '=', 'imigran.id_kab_kota')
            ->groupBy('imigran.id_kab_kota')
            ->where('id_layanan', $id_layanan)
            ->get();

        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }
}
