<?php

namespace App\Exports;

use App\Models\Cargo;
use App\Models\Kawasan;
use App\Models\Kepulangan;
use App\Models\Layanan;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class LaporanKepulanganJenazahExport implements FromView, ShouldAutoSize
{
    use Exportable;

    private $start_date;
    private $end_date;

    public function __construct($start_date, $end_date)
    {
        $this->start_date = $start_date;
        $this->end_date = $end_date;
    }

    public function view(): View
    {
        return view('excel.laporan-kepulangan-jenazah', [
            'data_kawasan' => Kawasan::all(),
            'data_layanan' => Layanan::whereHas('cargo')->get(),
            'data_kepulangan' => Kepulangan::whereHas('layanan', function ($query) {
                $query->whereHas('cargo');
            })->get(),
            'data_cargo' => Cargo::all(),
            'start_date' => $this->start_date,
            'end_date' => $this->end_date,
        ]);
    }
}
