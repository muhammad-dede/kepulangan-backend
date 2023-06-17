<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class LaporanBulananExport implements WithMultipleSheets
{
    use Exportable;

    private $start_date;
    private $end_date;

    public function __construct($start_date, $end_date)
    {
        $this->start_date = $start_date;
        $this->end_date = $end_date;
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public function sheets(): array
    {
        return [
            new LaporanMasalahExport($this->start_date, $this->end_date),
            new LaporanProvinsiExport($this->start_date, $this->end_date),
            new LaporanJenisKelaminExport($this->start_date, $this->end_date),
            new LaporanKepulanganPmiExport($this->start_date, $this->end_date),
            new LaporanKepulanganJenazahExport($this->start_date, $this->end_date),
            new LaporanLayananExport($this->start_date, $this->end_date),
        ];
    }
}
