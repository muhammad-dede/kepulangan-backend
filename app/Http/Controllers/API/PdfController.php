<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Alamat;
use App\Models\BastDarat;
use App\Models\BastMakan;
use App\Models\BastPihakLain;
use App\Models\BastUdara;
use App\Models\Imigran;
use App\Models\JemputKeluarga;
use App\Models\PulangMandiri;
use App\Models\RujukRsPolri;
use App\Models\Spu;
use App\Models\User;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Http\Request;

class PdfController extends Controller
{
    private $alamat;

    public function __construct()
    {
        $this->alamat = Alamat::where('utama', 1)->first();
    }

    public function imigran(Request $request, $id_imigran)
    {
        $imigran = Imigran::findOrFail($id_imigran);
        if ($imigran) {

            $pdf = Pdf::loadView('pdf.imigran', [
                'imigran' => $imigran,
            ])->setPaper('a4', 'potrait');

            if ($request->get('download') == "true") {
                $export = $pdf->download("Biodata-" . $imigran->nama . ".pdf");
            } else {
                $export = $pdf->stream("Biodata-" . $imigran->nama . ".pdf");
            }

            return $export;
        }

        return abort(404);
    }

    public function laporan_imigran(Request $request)
    {
        if ($request->get('start_date') && $request->get('end_date') && $request->get('id_user')) {
            $data = Imigran::whereBetween('tanggal_kedatangan', [$request->get('start_date'), $request->get('end_date')])->get();

            $pdf = Pdf::loadView('pdf.laporan-imigran', [
                'data' => $data,
                'alamat' => $this->alamat,
                'user' => User::findOrFail($request->get('id_user')),
                'start_date' => Carbon::parse($request->get('start_date'))->isoFormat('dddd, D MMMM Y'),
                'end_date' => Carbon::parse($request->get('end_date'))->isoFormat('dddd, D MMMM Y'),
            ])->setPaper('a4', 'potrait');

            if ($request->get('download') == "true") {
                $export = $pdf->download("Laporan-" . Carbon::parse($request->get('start_date'))->isoFormat('d-m-Y') . "-" . Carbon::parse($request->get('end_date'))->isoFormat('d-m-Y') . ".pdf");
            } else {
                $export = $pdf->stream("Laporan-" . Carbon::parse($request->get('start_date'))->isoFormat('d-m-Y') . "-" . Carbon::parse($request->get('end_date'))->isoFormat('d-m-Y') . ".pdf");
            }

            return $export;
        }

        return abort(404);
    }

    public function bast_darat(Request $request, $id_bast_darat)
    {
        $bast_darat = BastDarat::findOrFail($id_bast_darat);
        if ($bast_darat) {
            $pdf = Pdf::loadView('pdf.bast-darat', [
                'bast_darat' => $bast_darat,
                'alamat' => $this->alamat,
            ])->setPaper('a4', 'potrait');

            if ($request->get('download') == "true") {
                $export = $pdf->download("Berita-Acara-Serah-Terima-PMI-" . $bast_darat->purchase_order . ".pdf");
            } else {
                $export = $pdf->stream("Berita-Acara-Serah-Terima-PMI-" . $bast_darat->purchase_order . ".pdf");
            }

            return $export;
        }
        return abort(404);
    }

    public function bast_udara(Request $request, $id_bast_udara)
    {
        $bast_udara = BastUdara::findOrFail($id_bast_udara);
        if ($bast_udara) {
            $pdf = Pdf::loadView('pdf.bast-udara', [
                'bast_udara' => $bast_udara,
                'alamat' => $this->alamat,
            ])->setPaper('a4', 'potrait');

            if ($request->get('download') == "true") {
                $export = $pdf->download("Berita-Acara-Serah-Terima-PMI-" . $bast_udara->purchase_order . ".pdf");
            } else {
                $export = $pdf->stream("Berita-Acara-Serah-Terima-PMI-" . $bast_udara->purchase_order . ".pdf");
            }

            return $export;
        }
        return abort(404);
    }

    public function spu(Request $request, $id_spu)
    {
        $spu = Spu::findOrFail($id_spu);
        if ($spu) {
            $pdf = Pdf::loadView('pdf.spu', [
                'spu' => $spu,
                'alamat' => $this->alamat,
            ])->setPaper('a4', 'potrait');

            if ($request->get('download') == "true") {
                $export = $pdf->download("Surat-Pengantar-Udara-" . $spu->bast_udara->purchase_order . ".pdf");
            } else {
                $export = $pdf->stream("Surat-Pengantar-Udara-" . $spu->bast_udara->purchase_order . ".pdf");
            }

            return $export;
        }
        return abort(404);
    }

    public function rujuk_rs_polri(Request $request, $id_rujuk_rs_polri)
    {
        $rujuk_rs_polri = RujukRsPolri::findOrFail($id_rujuk_rs_polri);
        if ($rujuk_rs_polri) {
            $pdf = Pdf::loadView('pdf.rujuk-rs-polri', [
                'rujuk_rs_polri' => $rujuk_rs_polri,
                'alamat' => $this->alamat,
            ])->setPaper('a4', 'potrait');

            if ($request->get('download') == "true") {
                $export = $pdf->download("Berita-Acara-Serah-Terima-PMI-" . $rujuk_rs_polri->imigran->nama . ".pdf");
            } else {
                $export = $pdf->stream("Berita-Acara-Serah-Terima-PMI-" . $rujuk_rs_polri->imigran->nama . ".pdf");
            }

            return $export;
        }
        return abort(404);
    }

    public function pulang_mandiri(Request $request, $id_pulang_mandiri)
    {
        $pulang_mandiri = PulangMandiri::findOrFail($id_pulang_mandiri);
        if ($pulang_mandiri) {
            $pdf = Pdf::loadView('pdf.pulang-mandiri', [
                'pulang_mandiri' => $pulang_mandiri
            ])->setPaper('a4', 'potrait');

            if ($request->get('download') == "true") {
                $export = $pdf->download("Surat-Permohonan-Izin-Pulang-Secara-Mandiri-" . $pulang_mandiri->imigran->nama . ".pdf");
            } else {
                $export = $pdf->stream("Surat-Permohonan-Izin-Pulang-Secara-Mandiri-" . $pulang_mandiri->imigran->nama . ".pdf");
            }

            return $export;
        }
        return abort(404);
    }

    public function jemput_keluarga(Request $request, $id_jemput_keluarga)
    {
        $jemput_keluarga = JemputKeluarga::findOrFail($id_jemput_keluarga);
        if ($jemput_keluarga) {
            $pdf = Pdf::loadView('pdf.jemput-keluarga', [
                'jemput_keluarga' => $jemput_keluarga
            ])->setPaper('a4', 'potrait');

            if ($request->get('download') == "true") {
                $export = $pdf->download("Surat-Pernyataan-Penjemputan-" . $jemput_keluarga->imigran->nama . ".pdf");
            } else {
                $export = $pdf->stream("Surat-Pernyataan-Penjemputan-" . $jemput_keluarga->imigran->nama . ".pdf");
            }

            return $export;
        }
        return abort(404);
    }

    public function bast_pihak_lain(Request $request, $id_bast_pihak_lain)
    {
        $bast_pihak_lain = BastPihakLain::findOrFail($id_bast_pihak_lain);
        if ($bast_pihak_lain) {
            $pdf = Pdf::loadView('pdf.bast-pihak-lain', [
                'bast_pihak_lain' => $bast_pihak_lain,
                'alamat' => $this->alamat,
            ])->setPaper('a4', 'potrait');

            if ($request->get('download') == "true") {
                $export = $pdf->download("Berita-Acara-Serah-Terima-PMI-" . $bast_pihak_lain->pihak_kedua->nama . ".pdf");
            } else {
                $export = $pdf->stream("Berita-Acara-Serah-Terima-PMI-" . $bast_pihak_lain->pihak_kedua->nama . ".pdf");
            }

            return $export;
        }
        return abort(404);
    }

    public function bast_makan(Request $request, $id_bast_makan)
    {
        $bast_makan = BastMakan::findOrFail($id_bast_makan);
        if ($bast_makan) {
            $pdf = Pdf::loadView('pdf.bast-makan', [
                'bast_makan' => $bast_makan,
                'alamat' => $this->alamat,
            ])->setPaper('a4', 'potrait');

            if ($request->get('download') == "true") {
                $export = $pdf->download("Berita-Acara-Serah-Terima-Makan-" . $bast_makan->purchase_order . ".pdf");
            } else {
                $export = $pdf->stream("Berita-Acara-Serah-Terima-Makan-" . $bast_makan->purchase_order . ".pdf");
            }

            return $export;
        }
        return abort(404);
    }
}
