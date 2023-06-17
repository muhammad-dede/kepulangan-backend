<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>BERITA ACARA SERAH TERIMA PMI SAKIT</title>
    <link rel="stylesheet" href="{{ asset('assets/css/pdf.css') }}">
</head>

<body>
    <img class="w-100" src="{{ asset('assets/images/kop-surat.png') }}" alt="kop-surat">
    <br>
    <h4 class="text-center">
        <u>BERITA ACARA SERAH TERIMA PMI SAKIT</u>
    </h4>
    <p class="text-justify">
        Pada hari {{ \Carbon\Carbon::parse($rujuk_rs_polri->tanggal_serah_terima)->isoFormat('dddd') }} tanggal
        {{ \Carbon\Carbon::parse($rujuk_rs_polri->tanggal_serah_terima)->isoFormat('D') }} bulan
        {{ \Carbon\Carbon::parse($rujuk_rs_polri->tanggal_serah_terima)->isoFormat('MMMM') }} tahun
        {{ \Carbon\Carbon::parse($rujuk_rs_polri->tanggal_serah_terima)->isoFormat('Y') }} bertempat di Kota Tangerang,
        kami yang bertanda tangan dibawah ini:
    </p>
    <table class="border-collapse">
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Nama</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ ucwords($rujuk_rs_polri->user->nama) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">NIP/NIK</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ $rujuk_rs_polri->user->no_identitas ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Jabatan</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ ucwords($rujuk_rs_polri->user->jabatan) ?? '-' }}
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
                {{ ucwords($rujuk_rs_polri->pihak_kedua->nama) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">NIP/NIK</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ $rujuk_rs_polri->pihak_kedua->no_identitas ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Jabatan</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ ucwords($rujuk_rs_polri->pihak_kedua->jabatan) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Alamat</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ ucfirst($rujuk_rs_polri->pihak_kedua->alamat ?? '-') }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top text-no-wrap" colspan="3">
                <br>
                Yang disebut sebagai <u><b>PIHAK KEDUA</b></u>
            </td>
        </tr>
    </table>
    <p class="text-justify text-indent">
        Bahwa <u><b>PIHAK PERTAMA</b></u> menyerahkan 1 (Satu) Orang Pekerja Migran Indonesia (PMI) kepada
        <u><b>PIHAK KEDUA</b></u> dengan data sebagai betikut:
    </p>
    <table class="border-collapse">
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Nama PMI</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ ucwords($rujuk_rs_polri->imigran->nama) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">No. Paspor/SPLP</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ $rujuk_rs_polri->imigran->paspor ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Daerah Asal</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ ucwords(strtolower($rujuk_rs_polri->imigran->kab_kota->nama)) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Masalah</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ ucwords($rujuk_rs_polri->imigran->pmi->masalah->nama) ?? '-' }}
            </td>
        </tr>
    </table>
    <p class="text-justify text-indent">
        Demikian Berita Acara Serah Terima PMI ini dibuat oleh kedua belah pihak. Sejak penanda tanganan berita acara
        ini maka PMI tersebut menjadi tanggung jawab <u><b>PIHAK KEDUA</b></u>.
    </p>
    <table class="w-100">
        <tr>
            <td class="w-50 text-center vertical-top">
                Yang Menyerahkan,
                <br>
                <b>PIHAK PERTAMA</b>
                <br>
                <img class="image-block image-100" src="data:image/png;base64, {!! base64_encode(QrCode::format('svg')->generate($rujuk_rs_polri->user->qr_code)) !!}"
                    alt="QR Code Petugas">
                <br>
                {{ $rujuk_rs_polri->user->nama ?? '-' }}
            </td>
            <td class="w-50 text-center vertical-top">
                Yang Menerima,
                <br>
                <b>PIHAK KEDUA</b>
                <br>
                <img class="image-block image-100"
                    src="{{ asset('') }}uploads/{{ basename($rujuk_rs_polri->foto_pihak_kedua) }}"
                    alt="Foto Pihak Kedua">
                <br>
                {{ $rujuk_rs_polri->pihak_kedua->nama ?? '-' }}
            </td>
        </tr>
    </table>

</body>

</html>
