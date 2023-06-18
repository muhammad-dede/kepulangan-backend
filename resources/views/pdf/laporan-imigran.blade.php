<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>LAPORAN HARIAN PEMULANGAN PMI & LAINNYA</title>
    <link rel="stylesheet" href="{{ asset('assets/css/pdf.css') }}">
</head>

<body>
    <img class="w-100" src="{{ asset('assets/images/kop-surat.png') }}" alt="kop-surat">
    <br>
    <h4 class="text-center">
        LAPORAN HARIAN PEMULANGAN PMI & LAINNYA <br>
        (P4MI BANDARA SOEKARNO HATTA)
    </h4>
    <table class="border-collapse">
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Oleh</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                Petugas Pemulangan P4MI Group {{ $user->group->nama ?? '' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Hari dan Tanggal</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ $start_date }}&nbsp;-&nbsp;{{ $end_date }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap"></td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ $alamat->lokasi ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Nama Pelapor</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ $user->nama ?? '' }}
            </td>
        </tr>
    </table>
    <p class="text-justify text-indent">
        Bersama ini dilaporkan kepada Kepala BP3MI Banten Pelayanan Pemulangan PMI Bermasalah serta lainnya dari P4MI
        Bandara Soekarno Hatta dengan rincian sebagai berikut:
    </p>
    <table class="w-100 border">
        <tr class="border">
            <td class="border text-center">
                <b>NO.</b>
            </td>
            <td class="border text-center text-no-wrap">
                <b>NAMA LENGKAP</b>
            </td>
            <td class="border text-center">
                <b>TUJUAN KEPULANGAN</b>
            </td>
            <td class="border text-center">
                <b>NO PASPOR</b>
            </td>
            <td class="border text-center">
                <b>TANGGAL DATANG</b>
            </td>
            <td class="border text-center">
                <b>LAYANAN</b>
            </td>
            <td class="border text-center">
                <b>PEMULANGAN</b>
            </td>
            <td class="border text-center">
                <b>STATUS</b>
            </td>
        </tr>
        @foreach ($data as $item)
            @if ($user->roles->pluck('name')[0] == 'Admin')
                <tr class="border">
                    <td class="border text-center">{{ $loop->iteration }}</td>
                    <td class="border text-left">{{ $item->nama ?? '-' }}</td>
                    <td class="border text-center">{{ ucwords(strtolower($item->provinsi->nama)) ?? '-' }}</td>
                    <td class="border text-center">{{ $item->paspor ?? '-' }}</td>
                    <td class="border text-center">
                        {{ \Carbon\Carbon::parse($item->tanggal_kedatangan)->isoFormat('D/MM/Y') ?? '-' }}
                    </td>
                    <td class="border text-center">{{ $item->layanan->nama ?? '-' }}</td>
                    <td class="border text-center">{{ $item->kepulangan->nama ?? '-' }}</td>
                    <td class="border text-center">{{ $item->terlaksana == 1 ? 'Terlaksana' : 'Proses' }}</td>
                </tr>
            @else
                @if ($item->terlaksana == 0 || ($item->terlaksana == 1 && $item->pmi->id_group == $user->id_group))
                    <tr class="border">
                        <td class="border text-center">{{ $loop->iteration }}</td>
                        <td class="border text-left">{{ $item->nama ?? '-' }}</td>
                        <td class="border text-center">{{ ucwords(strtolower($item->provinsi->nama)) ?? '-' }}</td>
                        <td class="border text-center">{{ $item->paspor ?? '-' }}</td>
                        <td class="border text-center">
                            {{ \Carbon\Carbon::parse($item->tanggal_kedatangan)->isoFormat('D/MM/Y') ?? '-' }}
                        </td>
                        <td class="border text-center">{{ $item->layanan->nama ?? '-' }}</td>
                        <td class="border text-center">{{ $item->kepulangan->nama ?? '-' }}</td>
                        <td class="border text-center">{{ $item->terlaksana == 1 ? 'Terlaksana' : 'Proses' }}</td>
                    </tr>
                @endif
            @endif
        @endforeach
    </table>
    <p class="text-justify text-indent">
        Demikian laporan harian pemulangan PMI dan lainnya ini dibuat untuk menjadi periksa, atas perhatiannya diucapkan
        terima kasih
    </p>
    <table class="w-100">
        <tr>
            <td class="w-50 text-center vertical-top">
                Koordinator P4MI,
                <br>
                Bandara Soekarno Hatta
                <div class="image-100"></div>
                <u>Dhani Indra Kusuma, SE</u>
                <br>
                NIP. 198612052010121003
            </td>
            <td class="w-50 text-center vertical-top">
                <br>
                Petugas Pemulangan
                <br>
                <img class="image-block image-100" src="data:image/png;base64, {!! base64_encode(QrCode::format('svg')->generate($user->qr_code)) !!}" alt="qr-code">
                <br>
                {{ $user->nama ?? '' }}
            </td>
        </tr>
    </table>
</body>

</html>
