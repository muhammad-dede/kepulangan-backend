<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Provinsi</title>
</head>

<body>
    <table>
        <tr>
            <th colspan="6" style="text-align: center; vertical-align: middle;">
                <b>LAPORAN PELAYANAN BERDASARKAN PROVINSI</b>
            </th>
        </tr>
        <tr>
            <th colspan="6" style="text-align: center; vertical-align: middle;">
                <b>Periode {{ \Carbon\Carbon::parse($start_date)->isoFormat('D MMMM Y') }} s/d
                    {{ \Carbon\Carbon::parse($end_date)->isoFormat('D MMMM Y') }}
                </b>
            </th>
        </tr>
    </table>
    <table>
        <thead>
            <tr>
                <th rowspan="2"
                    style="background-color: #BFBFBF; border: 1px solid black;
border-collapse: collapse; text-align: center; vertical-align: middle;">
                    <b>No</b>
                </th>
                <th rowspan="2"
                    style="background-color: #BFBFBF; border: 1px solid black;
border-collapse: collapse; text-align: center; vertical-align: middle;">
                    <b>Provinsi</b>
                </th>
                <th colspan="{{ $data_kawasan->count() }}"
                    style="background-color: #BFBFBF; border: 1px solid black;
border-collapse: collapse; text-align: center; vertical-align: middle;">
                    <b>Kawasan</b>
                </th>
                <th rowspan="2"
                    style="background-color: #BFBFBF; border: 1px solid black;
border-collapse: collapse; text-align: center; vertical-align: middle; width: 100px;">
                    <b>Total</b>
                </th>
            </tr>
            <tr>
                @foreach ($data_kawasan as $kawasan)
                    <th
                        style="background-color: #BFBFBF; border: 1px solid black; text-align: center; vertical-align: middle; width: 75px; word-wrap: break-word;">
                        <b>{{ $kawasan->nama ?? '-' }}</b>
                    </th>
                @endforeach
            </tr>
        </thead>
        <tbody>
            @foreach ($data_provinsi as $key => $provinsi)
                <tr>
                    <td style="border: 1px solid black; text-align: center; vertical-align: middle;">
                        {{ $loop->iteration }}
                    </td>
                    <td style="border: 1px solid black; vertical-align: middle;">
                        {{ $provinsi->nama ?? '-' }}
                    </td>
                    @foreach ($data_kawasan as $kawasan)
                        <td style="border: 1px solid black; text-align: center; vertical-align: middle;">
                            @php
                                $value = \App\Models\Imigran::where('id_provinsi', $provinsi->id)
                                    ->where('id_kawasan', $kawasan->id)
                                    ->whereBetween('tanggal_kedatangan', [$start_date, $end_date])
                                    ->count();
                            @endphp
                            {{ $value > 0 ? $value : '-' }}
                        </td>
                    @endforeach
                    <td style="border: 1px solid black; text-align: center; vertical-align: middle;">
                        @php
                            $total_value = \App\Models\Imigran::where('id_provinsi', $provinsi->id)
                                ->whereBetween('tanggal_kedatangan', [$start_date, $end_date])
                                ->count();
                        @endphp
                        {{ $total_value > 0 ? $total_value : '-' }}
                    </td>
                </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th colspan="2"
                    style="background-color: #BFBFBF; border: 1px solid black;
border-collapse: collapse; text-align: center; vertical-align: middle;">
                    <b>Total</b>
                </th>
                @foreach ($data_kawasan as $kawasan)
                    <th
                        style="background-color: #BFBFBF; border: 1px solid black; text-align: center; vertical-align: middle; width: 75px; word-wrap: break-word;">
                        @php
                            $total = \App\Models\Imigran::where('id_kawasan', $kawasan->id)
                                ->whereBetween('tanggal_kedatangan', [$start_date, $end_date])
                                ->count();
                        @endphp
                        {{ $total }}
                    </th>
                @endforeach
                <th
                    style="background-color: #BFBFBF; border: 1px solid black;
border-collapse: collapse; text-align: center; vertical-align: middle; width: 100px;">
                    @php
                        $grand_total = 0;
                        foreach ($data_kawasan as $kawasan) {
                            $total_kawasan = \App\Models\Imigran::where('id_kawasan', $kawasan->id)
                                ->whereBetween('tanggal_kedatangan', [$start_date, $end_date])
                                ->count();
                            $grand_total = $grand_total + $total_kawasan;
                        }
                    @endphp
                    {{ $grand_total }}
                </th>
            </tr>

        </tfoot>
    </table>
</body>

</html>
