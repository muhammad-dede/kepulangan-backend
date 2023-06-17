<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SURAT PERMOHONAN IZIN PULANG SECARA MANDIRI (PSM)</title>
    <link rel="stylesheet" href="{{ asset('assets/css/pdf.css') }}">
</head>

<body>
    <img class="w-100" src="{{ asset('assets/images/kop-surat.png') }}" alt="kop-surat">
    <br>
    <h4 class="text-center">
        SURAT PERMOHONAN IZIN PULANG SECARA MANDIRI (PSM)
    </h4>
    <P>Yang bertanda tangan dibawah ini:</P>
    <table class="border-collapse">
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Nama Lengkap</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ strtoupper($pulang_mandiri->imigran->nama) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Nomor Paspor/SPLP</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ strtoupper($pulang_mandiri->imigran->paspor) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Negara
                {{ $pulang_mandiri->imigran->id_layanan == 5 ? 'Tujuan' : 'Penempatan' }}</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ strtoupper($pulang_mandiri->imigran->negara->nama) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Daerah Asal</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ strtoupper($pulang_mandiri->imigran->kab_kota->nama ?? '-') }}
            </td>
        </tr>
    </table>
    <p class="text-justify text-indent">
        Dengan ini menyatakan dengan sebenarnya bahwa saya mampu mengurus diri sendiri dan menjaga barang bawaannya,
        dengan penjelasan sebagai berikut:
    </p>
    <ol class="text-justify">
        <li>Atas kesadaran saya sendiri mengajukan izin ini (tidak ada paksaan);</li>
        <li>Saya mampu mengurus sendiri dokumen kepulangan;</li>
        <li>Kondisi fisik dan mental saya dalam keadaan baik (sehat wal'afiat);</li>
        <li>Bisa menjaga keamanan dan keselamatan diri saya serta barang bawaannya;</li>
        <li>Saya mampu memilih dan menentukan sendiri transportasi untuk pulang ke rumah;</li>
    </ol>
    <p class="text-justify text-indent">
        Oleh karena itu, dengan ini saya mohon izin untuk pulang secara mandiri selanjutnya hal-hal yang menyangkut diri
        saya menjadi tanggung jawab saya dan tidak menuntut siapapun termasuk kepada Petugas BP3MI Banten.
    </p>
    <p class="text-justify text-indent">
        Demikian permohonan ini, atas perhatian dan izin Petugas BP3MI Banten saya mengucapkan terima kasih.
    </p>
    <br>
    <table class="w-100">
        <tr>
            <td class="w-50 text-center vertical-top">
                <br>
                Petugas
                <br>
                <img class="image-block image-100" src="data:image/png;base64, {!! base64_encode(QrCode::format('svg')->generate($pulang_mandiri->user->qr_code)) !!}"
                    alt="QR Code Petugas">
                <br>
                {{ $pulang_mandiri->user->nama ?? '-' }}
            </td>
            <td class="w-50 text-center vertical-top">
                Kota Tangerang,
                {{ \Carbon\Carbon::parse($pulang_mandiri->tanggal_serah_terima)->isoFormat('D MMMM Y') }}
                <br>
                Yang menyatakan
                <br>
                <img class="image-block image-100"
                    src="{{ asset('') }}uploads/{{ basename($pulang_mandiri->foto_serah_terima) }}"
                    alt="Foto Serah Terima">
                <br>
                {{ $pulang_mandiri->imigran->nama ?? '-' }}
            </td>
        </tr>
    </table>

</body>

</html>
