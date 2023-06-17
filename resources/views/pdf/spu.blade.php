<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SURAT PENGANTAR UDARA</title>
    <link rel="stylesheet" href="{{ asset('assets/css/pdf.css') }}">
</head>

<body>
    <img class="image-block w-100" src="{{ asset('assets/images/kop-surat.png') }}" alt="kop-surat">
    <div class="text-right">
        <br>
        Tangerang, {{ \Carbon\Carbon::parse($spu->tanggal_surat)->isoFormat('D MMMM Y') ?? '-' }}
    </div>
    <table class="border-collapse">
        <tr>
            <td class="vertical-top text-no-wrap p-0">Nomor</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                {{ strtoupper($spu->no_surat) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top text-no-wrap p-0">Sifat</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                Terbatas
            </td>
        </tr>
        <tr>
            <td class="vertical-top text-no-wrap p-0">Lampiran</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                1 (satu) Exs
            </td>
        </tr>
        <tr>
            <td class="vertical-top text-no-wrap p-0">Perihal</td>
            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">
                Pemulangan PMI Terkendala Tujuan {{ ucwords(strtolower($spu->provinsi->nama)) ?? '-' }}
            </td>
        </tr>
    </table>
    <p>
        Kepada Yth. :
        <br>
        Kepala BP3MI {{ ucwords(strtolower($spu->provinsi->nama)) ?? '-' }}
        <br>
        di-Tempat
    </p>

    <p class="text-justify">
        Menindaklanjuti Pelayanan Kepulangan PMI terkendala di Debarkasi Bandara International Soekarno Hatta pada hari
        {{ \Carbon\Carbon::parse($spu->tanggal_surat)->isoFormat('D MMMM Y') ?? '-' }}, dengan ini disampaikan
        keterangan sebagai berikut:
    </p>
    <ol class="text-justify">
        <li>PMI Terkendala/WNIO tersebut diatas telah datang di P4MI Bandara Internasional
            Soekarno-Hatta pada hari Kamis tanggal
            {{ \Carbon\Carbon::parse($spu->tanggal_surat)->isoFormat('D MMMM Y') ?? '-' }} untuk proses pelayanan
            kepulangan ke daerah asal;
        </li>
        <li>
            Sesuai dengan permintaan PMI Terkendala/WNIO tersebut, dan mengacu pada ketentuan Peraturan Kepala Badan
            Nasional Penempatan dan Perlindungan Tenaga Kerja Indonesia Nomor 03 Tahun 2019 tentang petunjuk Teknis
            Pelayanan Kepulangan Pekerja Migran Indonesia Bermasalah Sampai ke Daerah Asal, maka perlu dilakukan
            pemulangan ke daerah asal;
        </li>
        <li>
            Sehubungan dengan itu, kami mohon BP3MI {{ ucwords(strtolower($spu->provinsi->nama)) ?? '-' }} dapat
            memberikan pelayanan dan/atau fasilitasi lanjutan
            di daerah asal hingga PMI Terkendala/WNIO tersebut dapat bertemu dengan keluarganya;
        </li>
        <li>
            Bersama ini kami lampirkan dokumen kepulangan PMI Terkendala/WNIO tersebut yang sudah dilakukan pendataan
            oleh tim kami;
        </li>
        <li>
            Adapun data lengkap PMI terlampir.
        </li>
    </ol>
    <p class="text-justify">
        Demikian disampaikan, atas perhatiannya kami ucapkan terimakasih.
    </p>
    <table class="w-100">
        <tr>
            <td class="w-50"></td>
            <td class="w-50 text-center vertical-top">
                An. Kepala BP3MI Banten
                <br>
                Koordinator P4MI,
                <br>
                Bandara Soekarno Hatta
                <br>
                <img class="image-block image-100" src="{{ asset('assets/images/cat-ttd-koordinator.png') }}"
                    alt="Foto TTD">
                <br>
                <u>Dhani Indra Kusuma, SE</u>
                <br>
                NIP. 198612052010121003
            </td>
        </tr>
    </table>
    <div class="fs-10">
        <u>Tembusan Kepada Yth:</u>
        <ol>
            <li>Deputi Bidang Penempatan dan Pelindungan Kawasan
                {{ $spu->bast_udara->udara->first()->imigran->kawasan->nama ?? '-' }} BP2MI;</li>
            <li>Direktur Pelindungan dan Pemberdayaan Kaw. Eropa dan Timur Tengah;
            </li>
            <li>Arsip</li>
        </ol>
    </div>
    <div class="page-break"></div>
    <img class="w-100" src="{{ asset('assets/images/kop-surat.png') }}" alt="kop-surat">
    <p class="text-justify">
        Informasi mengenai PMI yang akan menjadi Penumpang dan Tujuan Pengangkutan yaitu sebagai berikut:
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
        @foreach ($spu->bast_udara->udara as $udara)
            <tr class="border">
                <td class="border text-center">{{ $loop->iteration }}</td>
                <td class="border text-left">{{ ucwords(strtolower($udara->imigran->nama)) ?? '-' }}</td>
                <td class="border text-center">{{ $udara->imigran->paspor ?? '-' }}</td>
                <td class="border text-center">{{ ucwords(strtolower($udara->imigran->provinsi->nama)) ?? '-' }}</td>
            </tr>
        @endforeach
    </table>
    @foreach ($spu->spu_tiket as $spu_tiket)
        <div class="page-break"></div>
        <div class="w-100">
            <img class="w-100 h-100" src="{{ asset('') }}uploads/{{ basename($spu_tiket->foto_tiket) }}"
                alt="Foto Tiket">
        </div>
    @endforeach
</body>

</html>
