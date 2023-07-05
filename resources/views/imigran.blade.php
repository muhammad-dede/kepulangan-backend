<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Biodata PMI</title>
    <style>
        .text-no-wrap {
            white-space: nowrap;
        }

        .vertical-top {
            vertical-align: top;
        }
    </style>
</head>

<body>
    <div class="p-5">
        <div class="row justify-content-center">
            <div class="col-md-2">
                <div class="d-flex justify-content-center my-3">
                    <img class="rounded-circle" style="height: 150px; width: 150px;"
                        src="{{ $imigran->pmi ? $imigran->pmi->foto_pmi : $imigran->jenazah->foto_jenazah }}">
                </div>
            </div>
            <div class="col-md-6">
                <div class="my-3">
                    <div class="d-flex justify-content-between mb-3">
                        <h4 class="text-right">Biodata PMI</h4>
                    </div>
                    <table>
                        <tr>
                            <td class="vertical-top text-no-wrap">Brafaks</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ $imigran->brafaks ?? '-' }}</td>
                        </tr>
                        <tr>
                            <td class="vertical-top text-no-wrap">Nama</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ $imigran->nama ?? '-' }}</td>
                        </tr>
                        <tr>
                            <td class="vertical-top text-no-wrap">Paspor</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ $imigran->paspor ?? '-' }}</td>
                        </tr>
                        <tr>
                            <td class="vertical-top text-no-wrap">Jenis Kelamin</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ $imigran->jenis_kelamin->nama ?? '-' }}</td>
                        </tr>
                        <tr>
                            <td class="vertical-top text-no-wrap">Negara
                                {{ $imigran->id_layanan == 5 ? 'Tujuan' : 'Penempatan' }}</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ $imigran->negara->nama ?? '-' }}</td>
                        </tr>
                        <tr>
                            <td class="vertical-top text-no-wrap">Sub Kawasan</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ $imigran->sub_kawasan->nama ?? '-' }}</td>
                        </tr>
                        <tr>
                            <td class="vertical-top text-no-wrap">Kawasan</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ $imigran->kawasan->nama ?? '-' }}</td>
                        </tr>
                        <tr>
                            <td class="vertical-top text-no-wrap">Alamat</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ ucwords(strtolower($imigran->alamat ?? '-')) }}
                            </td>
                        </tr>
                        <tr>
                            <td class="vertical-top text-no-wrap">Kabupaten/Kota</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ ucwords(strtolower($imigran->kab_kota->nama)) ?? '-' }}
                            </td>
                        </tr>
                        <tr>
                            <td class="vertical-top text-no-wrap">Provinsi</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ ucwords(strtolower($imigran->provinsi->nama)) ?? '-' }}
                            </td>
                        </tr>
                        <tr>
                            <td class="vertical-top text-no-wrap">No. Telepon</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ $imigran->no_telp ?? '-' }}
                            </td>
                        </tr>
                        <tr>
                            <td class="vertical-top text-no-wrap">Jabatan</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ ucwords(strtolower($imigran->jabatan->nama)) ?? '-' }}
                            </td>
                        </tr>
                        <tr>
                            <td class="vertical-top text-no-wrap">Tanggal Kedatangan</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">
                                {{ \Carbon\Carbon::parse($imigran->tanggal_kedatangan)->isoFormat('D MMMM Y') ?? '-' }}
                            </td>
                        </tr>
                        @if ($imigran->pmi)
                            <tr>
                                <td class="vertical-top text-no-wrap">Masalah</td>
                                <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                                <td class="vertical-top">
                                    {{ ucwords(strtolower($imigran->pmi->masalah->nama)) ?? '-' }}</td>
                            </tr>
                            <tr>
                                <td class="vertical-top text-no-wrap">Group</td>
                                <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                                <td class="vertical-top">
                                    {{ ucwords(strtolower($imigran->pmi->group->nama)) ?? '-' }}</td>
                            </tr>
                        @endif
                        @if ($imigran->jenazah)
                            <tr>
                                <td class="vertical-top text-no-wrap">Cargo</td>
                                <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                                <td class="vertical-top">
                                    {{ ucwords(strtolower($imigran->jenazah->cargo->nama)) ?? '-' }}</td>
                            </tr>
                        @endif
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>

</body>

</html>
