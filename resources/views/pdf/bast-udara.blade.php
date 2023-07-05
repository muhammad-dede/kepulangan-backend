<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>BERITA ACARA SERAH TERIMA PMI</title>
    <link rel="stylesheet" href="{{ asset('assets/css/pdf.css') }}">
</head>

<body>
    <table class="w-100 border-collapse">
        <tr>
            <td class="w-50 vertical-top p-0">
                <img class="image-block w-100" src="{{ asset('assets/images/kop-surat.png') }}" alt="kop-surat">
            </td>
            <td class="w-50 vertical-top p-0">
                <b><u>PURCHASE ORDER</u></b>
                <table>
                    <tr>
                        <td class="vertical-top text-no-wrap">Nomor</td>
                        <td class="vertical-top">:</td>
                        <td class="vertical-top">
                            {{ $bast_udara->purchase_order ?? '-' }}
                        </td>
                    </tr>
                    <tr>
                        <td class="vertical-top text-no-wrap">Tanggal</td>
                        <td class="vertical-top">:</td>
                        <td class="vertical-top">
                            {{ \Carbon\Carbon::parse($bast_udara->tanggal_serah_terima)->isoFormat('D MMMM Y') ?? '-' }}
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br>
    <div class="w-50 border fs-11">
        <div class="p-5">
            Kepada Yth:
            <br>
            <u>Penyedia Jasa,</u>
            <br>
            <b class="fs-12">{{ $bast_udara->penyedia_jasa->nama_perusahaan ?? '-' }}</b>
            <br>
            {{ $bast_udara->penyedia_jasa->alamat ?? '-' }}
            <br>
            Email: {{ $bast_udara->penyedia_jasa->email ?? '-' }}
            <br>
            UP: {{ $bast_udara->penyedia_jasa->up ?? '-' }}
        </div>
    </div>
    <p class="text-justify">
        Berdasarkan Nota Kesepahaman Nomor:
        SK.08/BP2MI-16/1/{{ \Carbon\Carbon::parse(\Carbon\Carbon::now())->isoFormat('Y') - 1 ?? '-' }}, Tanggal 3 (tiga)
        Bulan Januari Tahun {{ \Carbon\Carbon::parse(\Carbon\Carbon::now())->isoFormat('Y') - 1 ?? '-' }}, maka dengan
        ini kami melakukan pemesanan jasa pengangkutan untuk pemulangan PMI ke desa asal sebagai berikut:
    </p>
    <table class="w-100 border fs-11">
        <tr class="border">
            <td class="border text-center">
                <b>JUMLAH PMI</b>
            </td>
            <td class="border text-center text-no-wrap">
                <b>JENIS PENGANGKUTAN</b>
            </td>
            <td class="border text-center">
                <b>LOKASI JEMPUT</b>
            </td>
            <td class="border text-center">
                <b>TANGGAL JEMPUT</b>
            </td>
            <td class="border text-center">
                <b>DURASI PENGERJAAN</b>
            </td>
        </tr>
        <tr class="border">
            <td class="border text-center">
                {{ $bast_udara->udara->count() ?? '0' }} orang
            </td>
            <td class="border text-center text-no-wrap">
                Udara
            </td>
            <td class="border text-center">
                {{ $bast_udara->alamat->lokasi ?? '-' }}
            </td>
            <td class="border text-center">
                {{ \Carbon\Carbon::parse($bast_udara->tanggal_serah_terima)->isoFormat('D MMMM Y') ?? '-' }}
            </td>
            <td class="border text-center">
                {{ $bast_udara->durasi_pengerjaan ?? '0' }} hari kalender sesuai tanggal jemput
            </td>
        </tr>
    </table>
    <p class="text-justify">
        Biaya yang timbul akibat pesanan ini dibebankan kepada DIPA Petikan UPT BP2MI Serang
        TA.{{ \Carbon\Carbon::parse(\Carbon\Carbon::now())->isoFormat('Y') - 1 ?? '-' }}, Nomor: DIPA
        104.01.2.426482/{{ \Carbon\Carbon::parse(\Carbon\Carbon::now())->isoFormat('Y') ?? '-' }}, Tanggal 17 November
        {{ \Carbon\Carbon::parse(\Carbon\Carbon::now())->isoFormat('Y') - 1 ?? '-' }}
    </p>
    <i><u>NOTE :</u></i>
    <ol class="fs-11">
        <li>Purchase Order (PO) harap ditandatangani dan di cap basah</li>
        <li>PO untuk dibuat rangkap, dengan dokumen asli diserahkan kepada Penyedia Jasa</li>
        <li>Nomor PO harus dimuat dalam Faktur/Invoice</li>
        <li>Faktur/Invoice dibuat oleh Penyedia Jasa</li>
        <li>Harga satuan sesuai dengan Nota Kesepahaman No.
            SK.08/BP2MI-16/1/{{ \Carbon\Carbon::parse(\Carbon\Carbon::now())->isoFormat('Y') - 1 ?? '-' }} tanggal 3
            Januari {{ \Carbon\Carbon::parse(\Carbon\Carbon::now())->isoFormat('Y') - 1 ?? '-' }}</li>
        <li>Pembayaran dilakukan setelah pekerjaan selesai dilaksanakan dan dilakukan tagihan oleh
            {{ $bast_udara->penyedia_jasa->nama_perusahaan ?? '-' }}</li>
    </ol>
    <br>
    <table class="w-100">
        <tr>
            <td class="w-50 text-center vertical-top">
                Petugas Pemesan
                <br>
                <img class="image-block image-100" src="data:image/png;base64, {!! base64_encode(QrCode::format('svg')->generate($bast_udara->user->qr_code)) !!}"
                    alt="QR Code Petugas">
                <br>
                {{ $bast_udara->user->nama ?? '-' }}
            </td>
            <td class="w-50 text-center vertical-top">
                Penyedia Jasa
                <br>
                <img class="image-block image-100"
                    src="{{ asset('') }}uploads/{{ basename($bast_udara->foto_penyedia_jasa) }}"
                    alt="Foto Penyedia Jasa">
                <br>
                {{ $bast_udara->penyedia_jasa->nama_perusahaan ?? '-' }}
            </td>
        </tr>
    </table>
    <div class="page-break"></div>
    <img class="w-100" src="{{ asset('assets/images/kop-surat.png') }}" alt="kop-surat">
    <p class="text-justify">
        Informasi mengenai PMI yang akan menjadi Penumpang dan Tujuan Pengangkutan yaitu sebagai berikut:
    </p>
    <table class="w-100 border">
        <tr class="border">
            <td class="border text-center">
                <b>NO</b>
            </td>
            <td class="border text-center text-no-wrap">
                <b>NAMA PMI</b>
            </td>
            <td class="border text-center">
                <b>NO PASPOR</b>
            </td>
            <td class="border text-center">
                <b>TUJUAN</b>
            </td>
        </tr>
        @foreach ($bast_udara->udara as $udara)
            <tr class="border">
                <td class="border text-center">
                    {{ $loop->iteration }}
                </td>
                <td class="border text-center text-no-wrap">
                    {{ $udara->imigran->nama ?? '-' }}
                </td>
                <td class="border text-center">
                    {{ $udara->imigran->paspor ?? '-' }}
                </td>
                <td class="border text-center">
                    {{ $udara->imigran->provinsi->nama ?? '-' }}
                </td>
            </tr>
        @endforeach
    </table>
    <br>
    <table class="w-100">
        <tr>
            <td class="w-50 text-center vertical-top"></td>
            <td class="w-50 text-center vertical-top">
                Petugas
                <br>
                <img class="image-block image-100" src="data:image/png;base64, {!! base64_encode(QrCode::format('svg')->generate($bast_udara->user->qr_code)) !!}"
                    alt="QR Code Petugas">
                <br>
                {{ $bast_udara->user->nama ?? '-' }}
            </td>
        </tr>
    </table>
    {{-- BAST PAGE --}}
    <div class="page-break"></div>
    <img class="w-100" src="{{ asset('assets/images/kop-surat.png') }}" alt="kop-surat">
    <br>
    <h4 class="text-center">
        <u>BERITA ACARA SERAH TERIMA PMI</u>
    </h4>
    <p class="text-justify">
        Pada hari {{ \Carbon\Carbon::parse($bast_udara->tanggal_serah_terima)->isoFormat('dddd') }} tanggal
        {{ \Carbon\Carbon::parse($bast_udara->tanggal_serah_terima)->isoFormat('D') }} bulan
        {{ \Carbon\Carbon::parse($bast_udara->tanggal_serah_terima)->isoFormat('MMMM') }} tahun
        {{ \Carbon\Carbon::parse($bast_udara->tanggal_serah_terima)->isoFormat('Y') }} bertempat di Kota
        Tangerang,
        kami yang bertanda tangan dibawah ini:
    </p>
    <table>
        <tr>
            <td class="vertical-top text-no-wrap">Nama</td>
            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top">
                {{ ucwords($bast_udara->user->nama) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top text-no-wrap">NIP/NIK</td>
            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top">
                {{ $bast_udara->user->no_identitas ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top text-no-wrap">Jabatan</td>
            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top">
                {{ ucwords($bast_udara->user->jabatan) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top text-no-wrap">Alamat</td>
            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top">
                {{ ucfirst($alamat->lokasi ?? '-') }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top text-no-wrap" colspan="3">
                <br>
                Yang disebut sebagai <u><b>PIHAK PERTAMA</b></u>
                <br><br>
            </td>
        </tr>
        <tr>
            <td class="vertical-top text-no-wrap">Nama</td>
            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top">
                {{ ucwords($bast_udara->penyedia_jasa->nama_perusahaan) ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top text-no-wrap">Alamat</td>
            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top">
                {{ $bast_udara->penyedia_jasa->alamat ?? '-' }}
            </td>
        </tr>
        <tr>
            <td class="vertical-top text-no-wrap">No. Telepon</td>
            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
            <td class="vertical-top">
                {{ $bast_udara->penyedia_jasa->no_telp ?? '-' }}
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
        Demikian Berita Acara Serah Terima PMI sebanyak {{ $bast_udara->udara->count() ?? '0' }} Orang
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
        @foreach ($bast_udara->udara as $item)
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
                <img class="image-block image-100" src="data:image/png;base64, {!! base64_encode(QrCode::format('svg')->generate($bast_udara->user->qr_code)) !!}"
                    alt="QR Code Petugas">
                <br>
                {{ $bast_udara->user->nama ?? '-' }}
            </td>
            <td class="w-50 text-center vertical-top">
                Yang Menerima,
                <br>
                <b>PIHAK KEDUA</b>
                <br>
                <img class="image-block image-100"
                    src="{{ asset('') }}uploads/{{ basename($bast_udara->foto_penyedia_jasa) }}"
                    alt="Foto Pihak Kedua">
                <br>
                {{ $bast_udara->penyedia_jasa->nama_perusahaan ?? '-' }}
            </td>
        </tr>
    </table>
    {{-- Foto Serah Terima --}}
    <div class="page-break"></div>
    <h4 class="text-center">
        <u>FOTO SERAH TERIMA</u>
    </h4>
    <img class="w-100" src="{{ $bast_udara->foto_serah_terima }}" alt="foto-serah-terima">
</body>

</html>
