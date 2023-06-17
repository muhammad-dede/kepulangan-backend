<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>BERITA ACARA SERAH TERIMA MAKAN</title>
    <link rel="stylesheet" href="{{ asset('assets/css/pdf.css') }}">
</head>

<body>
    <table class="w-100 border-collape">
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
                            {{ $bast_makan->purchase_order ?? '-' }}
                        </td>
                    </tr>
                    <tr>
                        <td class="vertical-top text-no-wrap">Tanggal</td>
                        <td class="vertical-top">:</td>
                        <td class="vertical-top">
                            {{ \Carbon\Carbon::parse($bast_makan->tanggal_serah_terima)->isoFormat('D MMMM Y') ?? '-' }}
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
            <b class="fs-12">{{ $bast_makan->penyedia_jasa->nama_perusahaan ?? '-' }}</b>
            <br>
            {{ $bast_makan->penyedia_jasa->alamat ?? '-' }}
            <br>
            Email: {{ $bast_makan->penyedia_jasa->email ?? '-' }}
            <br>
            UP: {{ $bast_makan->penyedia_jasa->up ?? '-' }}
        </div>
    </div>
    <p class="text-justify">
        Berdasarkan Nota Kesepahaman Nomor:
        SK.08/BP2MI-16/1/{{ \Carbon\Carbon::parse(\Carbon\Carbon::now())->isoFormat('Y') - 1 ?? '-' }}, Tanggal 3 (tiga)
        Bulan Januari Tahun {{ \Carbon\Carbon::parse(\Carbon\Carbon::now())->isoFormat('Y') - 1 ?? '-' }}, maka dengan
        ini kami melakukan pemesanan jasa makan untuk Pekerja Imigran Indonesia (PMI) dengan ketentuan sebagai berikut:
    </p>
    <table class="w-100 border fs-11">
        <tr class="border">
            <td class="border text-center">
                <b>JUMLAH PMI</b>
            </td>
            <td class="border text-center text-no-wrap">
                <b>JENIS BARANG</b>
            </td>
            <td class="border text-center">
                <b>LOKASI ANTAR</b>
            </td>
            <td class="border text-center">
                <b>TANGGAL ANTAR</b>
            </td>
            <td class="border text-center">
                <b>DURASI PENGERJAAN</b>
            </td>
        </tr>
        <tr class="border">
            <td class="border text-center">
                {{ $bast_makan->makan->count() ?? '0' }} orang
            </td>
            <td class="border text-center text-no-wrap">
                Nasi Kotak Komplit
            </td>
            <td class="border text-center">
                {{ $bast_makan->alamat->lokasi ?? '-' }}
            </td>
            <td class="border text-center">
                {{ $bast_makan->waktu_serah_terima ?? '-' }}
                <br>
                {{ \Carbon\Carbon::parse($bast_makan->tanggal_serah_terima)->isoFormat('D MMMM Y') ?? '-' }}
            </td>
            <td class="border text-center">
                {{ $bast_makan->durasi_pengerjaan ?? '0' }} hari kalender sesuai tanggal jemput
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
            {{ $bast_makan->penyedia_jasa->nama_perusahaan ?? '-' }}</li>
    </ol>
    <br>
    <table class="w-100">
        <tr>
            <td class="w-50 text-center vertical-top">
                Petugas Pemesan
                <br>
                <img class="image-block image-100" src="data:image/png;base64, {!! base64_encode(QrCode::format('svg')->generate($bast_makan->user->qr_code)) !!}"
                    alt="QR Code Petugas">
                <br>
                {{ $bast_makan->user->nama ?? '-' }}
            </td>
            <td class="w-50 text-center vertical-top">
                Penyedia Jasa
                <br>
                <img class="image-block image-100"
                    src="{{ asset('') }}uploads/{{ basename($bast_makan->foto_penyedia_jasa) }}"
                    alt="Foto Penyedia Jasa">
                <br>
                {{ $bast_makan->penyedia_jasa->nama_perusahaan ?? '-' }}
            </td>
        </tr>
    </table>
    <div class="page-break"></div>
    <img class="w-100" src="{{ asset('assets/images/kop-surat.png') }}" alt="kop-surat">
    <h4 class="text-center">
        DAFTAR PENERIMAAN MAKAN PMI BERMASALAH
    </h4>
    <table class="border-collapse">
        <tr>
            <td class="text-no-wrap vertical-top p-0">Kegiatan</td>
            <td class="vertical-top p-0">&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">Pelayanan Makan PMI Bermasalah</td>
        </tr>
        <tr>
            <td class="text-no-wrap vertical-top p-0">Hari/Tanggal</td>
            <td class="vertical-top p-0">&nbsp;:&nbsp;</td>
            <td class=" vertical-top p-0">
                {{ \Carbon\Carbon::parse($bast_makan->tanggal_serah_terima)->isoFormat('dddd, D MMMM Y') ?? '-' }}</td>
        </tr>
        <tr>
            <td class="text-no-wrap vertical-top p-0">Lokasi</td>
            <td class="vertical-top p-0">&nbsp;:&nbsp;</td>
            <td class="vertical-top p-0">{{ $bast_makan->alamat->lokasi ?? '-' }}</td>
        </tr>
    </table>
    <br>
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
                <b>PROVINSI</b>
            </td>
            <td class="border text-center">
                <b>TANDA TANGAN</b>
            </td>
        </tr>
        @foreach ($bast_makan->makan as $makan)
            <tr class="border">
                <td class="border text-center">
                    {{ $loop->iteration }}
                </td>
                <td class="border text-center text-no-wrap">
                    {{ $makan->imigran->nama ?? '-' }}
                </td>
                <td class="border text-center">
                    {{ $makan->imigran->paspor ?? '-' }}
                </td>
                <td class="border text-center">
                    {{ $makan->imigran->provinsi->nama ?? '-' }}
                </td>
                <td class="border text-center">
                    <img class="image-block image-50" src="data:image/png;base64, {!! base64_encode(QrCode::format('svg')->generate($makan->imigran->paspor)) !!}"
                        alt="QR Code Petugas">
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
                <img class="image-block image-100" src="data:image/png;base64, {!! base64_encode(QrCode::format('svg')->generate($bast_makan->user->qr_code)) !!}"
                    alt="QR Code Petugas">
                <br>
                {{ $bast_makan->user->nama ?? '-' }}
            </td>
        </tr>
    </table>
</body>

</html>
