<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>BERITA ACARA SERAH TERIMA PMI</title>
    <link rel="stylesheet" href="{{ asset('assets/css/pdf.css') }}">
</head>

<body>
    <img class="w-100" src="{{ asset('assets/images/kop-surat.png') }}" alt="kop-surat">
    <br>
    <h4 class="text-center">
        <u>BERITA ACARA SERAH TERIMA PMI</u>
    </h4>
    <p class="text-justify">
        Pada hari {{ \Carbon\Carbon::parse($bast_pihak_lain->tanggal_serah_terima)->isoFormat('dddd') }} tanggal
        {{ \Carbon\Carbon::parse($bast_pihak_lain->tanggal_serah_terima)->isoFormat('D') }} bulan
        {{ \Carbon\Carbon::parse($bast_pihak_lain->tanggal_serah_terima)->isoFormat('MMMM') }} tahun
        {{ \Carbon\Carbon::parse($bast_pihak_lain->tanggal_serah_terima)->isoFormat('Y') }} bertempat di Kota Tangerang,
        kami yang bertanda tangan dibawah ini:
    </p>
    <table class="border-collapse">
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Nama</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ ucwords($bast_pihak_lain->user->nama) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">NIP/NIK</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ $bast_pihak_lain->user->no_identitas ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Jabatan</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ ucwords($bast_pihak_lain->user->jabatan) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Alamat</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ ucfirst($alamat->lokasi ?? '-') }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap" colspan="3">
                <br>
                Yang disebut sebagai <u><b>PIHAK PERTAMA</b></u>
                <br><br>
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Nama</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ ucwords($bast_pihak_lain->pihak_kedua->nama) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">NIP/NIK</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ $bast_pihak_lain->pihak_kedua->no_identitas ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Jabatan</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ ucwords($bast_pihak_lain->pihak_kedua->jabatan) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Instansi</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ ucwords(strtolower($bast_pihak_lain->pihak_kedua->jabatan)) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Alamat</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ ucfirst($bast_pihak_lain->pihak_kedua->alamat ?? '-') }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">No. Telepon</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ ucfirst($bast_pihak_lain->pihak_kedua->no_telp ?? '-') }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap" colspan="3">
                <br>
                Yang disebut sebagai <u><b>PIHAK KEDUA</b></u>
            </td>
        </tr>
    </table>
    <p class="text-justify text-indent">
        Demikian Berita Acara Serah Terima PMI sebanyak {{ $bast_pihak_lain->jemput_pihak_lain->count() ?? '0' }} Orang
        dan dibuat oleh kedua belah pihak. Sejak penanda tanganan berita acara
        ini maka PMI tersebut menjadi tanggung jawab <u><b>PIHAK KEDUA</b></u>.
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
                <b>NO PASPOR</b>
            </td>
            <td class="border text-center">
                <b>ALAMAT</b>
            </td>
        </tr>
        @foreach ($bast_pihak_lain->jemput_pihak_lain as $item)
            <tr class="border">
                <td class="border text-center">{{ $loop->iteration }}</td>
                <td class="border text-left">{{ ucwords(strtolower($item->imigran->nama)) ?? '-' }}</td>
                <td class="border text-center">{{ $item->imigran->paspor ?? '-' }}</td>
                <td class="border text-center">{{ ucwords(strtolower($item->imigran->provinsi->nama)) ?? '-' }}</td>
            </tr>
        @endforeach
    </table>
    <br>
    <table class="w-100">
        <tr>
            <td class="w-50 text-center vertical-top">
                Yang Menyerahkan,
                <br>
                <b>PIHAK PERTAMA</b>
                <br>
                <img class="image-block image-100" src="data:image/png;base64, {!! base64_encode(QrCode::format('svg')->generate($bast_pihak_lain->user->qr_code)) !!}"
                    alt="QR Code Petugas">
                <br>
                {{ $bast_pihak_lain->user->nama ?? '-' }}
            </td>
            <td class="w-50 text-center vertical-top">
                Yang Menerima,
                <br>
                <b>PIHAK KEDUA</b>
                <br>
                <img class="image-block image-100"
                    src="{{ asset('') }}uploads/{{ basename($bast_pihak_lain->foto_pihak_kedua) }}"
                    alt="Foto Pihak Kedua">
                <br>
                {{ $bast_pihak_lain->pihak_kedua->nama ?? '-' }}
            </td>
        </tr>
    </table>

</body>

</html>
