<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SURAT PERNYATAAN PENJEMPUTAN</title>
    <link rel="stylesheet" href="{{ asset('assets/css/pdf.css') }}">
</head>

<body>
    <img class="w-100" src="{{ asset('assets/images/kop-surat.png') }}" alt="kop-surat">
    <br>
    <h4 class="text-center">
        SURAT PERNYATAAN PENJEMPUTAN
    </h4>
    <P>Yang bertanda tangan dibawah ini:</P>
    <table class="border-collapse">
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Nama</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ strtoupper($jemput_keluarga->imigran->nama) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">No. Paspor</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ strtoupper($jemput_keluarga->imigran->paspor) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Negara
                {{ $jemput_keluarga->imigran->id_layanan == 5 ? 'Tujuan' : 'Penempatan' }}</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ strtoupper($jemput_keluarga->imigran->negara->nama) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top p-0 text-no-wrap">Daerah Asal</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ strtoupper($jemput_keluarga->imigran->kab_kota->nama ?? '-') }}
            </td>
        </tr>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td class="vertical-top text-no-wrap">Nama Penjemput</td>
            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top">
                {{ strtoupper($jemput_keluarga->nama_penjemput) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top text-no-wrap">Hubungan dengan PMI</td>
            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top">
                {{ strtoupper($jemput_keluarga->hubungan_dengan_pmi) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top text-no-wrap">No. Telepon Penjemput</td>
            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top">
                {{ strtoupper($jemput_keluarga->no_telp_penjemput) ?? '-' }}
            </td>
        </tr>
    </table>

    <p class="text-justify text-indent">
        Dengan ini menyatakan bahwa benar saya bersedia pulang ke daerah asal bersama-sama dengan keluarga (dijemput
        oleh anggota keluarga).
    </p>
    <p class="text-justify text-indent">
        Apabila dikemudian hari terdapat sesuatu hal terhadap diri saya, maka hal tersebut menjadi tanggungan saya
        sendiri dan saya tidak akan menuntut BP2MI maupun Petugas Pelayanan Penanganan dan Pemulangan PMI.
    </p>
    <p class="text-justify text-indent">
        Demikian Surat Pernyataan ini dibuat dengan sebenar-benarnya, tanpa paksaan dari pihak manapun, apabila
        dikemudian hari saya berkata maupun bertindak lain dengan Surat Pernyataan ini, maka saya bersedia dituntut
        sesuai dengan hukum yang berlaku.
    </p>
    <br>
    <table class="w-100">
        <tr>
            <td class="w-50 text-center vertical-top">
                <br>
                Penjemput
                <br>
                <img class="image-block image-100"
                    src="{{ asset('') }}uploads/{{ basename($jemput_keluarga->foto_penjemput) }}"
                    alt="Foto Penjemput">
                <br>
                {{ $jemput_keluarga->user->nama ?? '-' }}
            </td>
            <td class="w-50 text-center vertical-top">
                Kota Tangerang,
                {{ \Carbon\Carbon::parse($jemput_keluarga->tanggal_serah_terima)->isoFormat('D MMMM Y') }}
                <br>
                Yang menyatakan
                <br>
                <img class="image-block image-100"
                    src="{{ asset('') }}uploads/{{ basename($jemput_keluarga->foto_serah_terima) }}"
                    alt="Foto Serah Terima">
                <br>
                {{ $jemput_keluarga->imigran->nama ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="text-center vertical-top" colspan="2">
                Petugas
                <br>
                <img class="image-block image-100" src="data:image/png;base64, {!! base64_encode(QrCode::format('svg')->generate($jemput_keluarga->user->qr_code)) !!}"
                    alt="QR Code Petugas">
                <br>
                {{ $jemput_keluarga->user->nama ?? '-' }}
            </td>
        </tr>
    </table>

</body>

</html>
