<?php

namespace App\Http\Controllers\API;

use App\Exports\LaporanBulananExport;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class ExcelController extends Controller
{
    public function laporan_bulanan(Request $request)
    {
        if ($request->get('start_date') && $request->get('end_date')) {

            $start_date_format = Carbon::parse($request->get('start_date'))->format('d-m-Y');
            $end_date_format = Carbon::parse($request->get('end_date'))->format('d-m-Y');

            return Excel::download(new LaporanBulananExport($request->get('start_date'), $request->get('end_date')), 'Laporan Bulanan Periode ' . $start_date_format . ' - ' . $end_date_format . '.xlsx');
        }
        return abort(404);
    }
}
