<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>BIODATA</title>
    <link rel="stylesheet" href="{{ asset('assets/css/pdf.css') }}">
</head>

<body>
    <img class="w-100" src="{{ asset('assets/images/kop-surat.png') }}" alt="kop-surat">
    <br>
    <h4 class="text-center">BIODATA</h4>
    <table class="w-100 border-collapse">
        <tr>
            <td class="w-75 vertical-top">
                <table>
                    <tr>
                        <td class="vertical-top p-0 text-no-wrap">Nama</td>
                        <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                        <td class="vertical-top p-0">{{ $imigran->nama ?? '-' }}</td>
                    </tr>
                    <tr>
                        <td class="vertical-top p-0 text-no-wrap">Paspor</td>
                        <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                        <td class="vertical-top p-0">{{ $imigran->paspor ?? '-' }}</td>
                    </tr>
                    <tr>
                        <td class="vertical-top p-0 text-no-wrap">Brafaks</td>
                        <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                        <td class="vertical-top p-0">{{ $imigran->brafaks ?? '-' }}</td>
                    </tr>
                    <tr>
                        <td class="vertical-top p-0 text-no-wrap">Jenis Kelamin</td>
                        <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                        <td class="vertical-top p-0">{{ $imigran->jenis_kelamin->nama ?? '-' }}</td>
                    </tr>
                    <tr>
                        <td class="vertical-top p-0 text-no-wrap">Negara
                            {{ $imigran->id_layanan == 5 ? 'Tujuan' : 'Penempatan' }}</td>
                        <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                        <td class="vertical-top p-0">{{ $imigran->negara->nama ?? '-' }}</td>
                    </tr>
                    <tr>
                        <td class="vertical-top p-0 text-no-wrap">Sub Kawasan</td>
                        <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                        <td class="vertical-top p-0">{{ $imigran->sub_kawasan->nama ?? '-' }}</td>
                    </tr>
                    <tr>
                        <td class="vertical-top p-0 text-no-wrap">Kawasan</td>
                        <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                        <td class="vertical-top p-0">{{ $imigran->kawasan->nama ?? '-' }}</td>
                    </tr>
                    <tr>
                        <td class="vertical-top p-0 text-no-wrap">Kabupaten/Kota</td>
                        <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                        <td class="vertical-top p-0">{{ ucwords(strtolower($imigran->kab_kota->nama)) ?? '-' }}
                        </td>
                    </tr>
                    <tr>
                        <td class="vertical-top p-0 text-no-wrap">Provinsi</td>
                        <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                        <td class="vertical-top p-0">{{ ucwords(strtolower($imigran->provinsi->nama)) ?? '-' }}
                        </td>
                    </tr>
                    <tr>
                        <td class="vertical-top p-0 text-no-wrap">Jabatan</td>
                        <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                        <td class="vertical-top p-0">{{ ucwords(strtolower($imigran->jabatan->nama)) ?? '-' }}
                        </td>
                    </tr>
                    <tr>
                        <td class="vertical-top p-0 text-no-wrap">Tanggal Kedatangan</td>
                        <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                        <td class="vertical-top p-0">
                            {{ \Carbon\Carbon::parse($imigran->tanggal_kedatangan)->isoFormat('D MMMM Y') ?? '-' }}
                        </td>
                    </tr>
                    @if ($imigran->pmi)
                        <tr>
                            <td class="vertical-top p-0 text-no-wrap">Masalah</td>
                            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top p-0">
                                {{ ucwords(strtolower($imigran->pmi->masalah->nama)) ?? '-' }}</td>
                        </tr>
                        <tr>
                            <td class="vertical-top p-0 text-no-wrap">Group</td>
                            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top p-0">
                                {{ ucwords(strtolower($imigran->pmi->group->nama)) ?? '-' }}</td>
                        </tr>
                    @endif
                    @if ($imigran->jenazah)
                        <tr>
                            <td class="vertical-top p-0 text-no-wrap">Cargo</td>
                            <td class="vertical-top p-0">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top p-0">
                                {{ ucwords(strtolower($imigran->jenazah->cargo->nama)) ?? '-' }}</td>
                        </tr>
                    @endif
                </table>
            </td>
            <td class="w-25 vertical-top">
                @if ($imigran->pmi)
                    <div class="text-center">
                        <b>Foto PMI</b>
                    </div>
                    <img class="image-block image-200"
                        src="{{ asset('') }}uploads/{{ basename($imigran->pmi->foto_pmi) }}" alt="Foto PMI">
                @endif
                @if ($imigran->jenazah)
                    <div class="text-center">
                        <b>Foto Jenazah</b>
                    </div>
                    <img class="image-block image-200"
                        src="{{ asset('') }}uploads/{{ basename($imigran->jenazah->foto_jenazah) }}"
                        alt="Foto Jenazah">
                @endif
            </td>
        </tr>
    </table>
    <br>
    <br>
    @if ($imigran->pmi)
        <table class="w-100">
            <tr>
                <td class="text-center">
                    <div>
                        <b>Foto Paspor</b>
                    </div>
                    <img class="image-300" src="{{ asset('') }}uploads/{{ basename($imigran->pmi->foto_paspor) }}"
                        alt="Foto Paspor">
                </td>
            </tr>
        </table>
    @endif
    @if ($imigran->jenazah)
        <table class="w-100">
            <tr>
                <td class="w-50 text-center vertical-top">
                    <div>
                        <b>Foto Paspor</b>
                    </div>
                    <img class="image-300"
                        src="{{ asset('') }}uploads/{{ basename($imigran->jenazah->foto_paspor) }}"
                        alt="Foto Paspor">
                </td>
                <td class="w-50 text-center vertical-top">
                    <div>
                        <b>Foto Brafaks</b>
                    </div>
                    <img class="image-300"
                        src="{{ asset('') }}uploads/{{ basename($imigran->jenazah->foto_brafaks) }}"
                        alt="Foto Brafaks">
                </td>
            </tr>
        </table>
    @endif
</body>

</html>
