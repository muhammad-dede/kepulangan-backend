<?php

namespace App\Exports;

use App\Models\Kawasan;
use App\Models\Layanan;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class LaporanLayananExport implements FromView, ShouldAutoSize
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
        return view('excel.laporan-layanan', [
            'data_kawasan' => Kawasan::all(),
            'data_layanan' => Layanan::orderBy('id', 'asc')->get(),
            'start_date' => $this->start_date,
            'end_date' => $this->end_date,
        ]);
    }
}
