<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Profil Petugas</title>
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
                    <img class="rounded-circle" style="height: 150px; width: 150px;" src="{{ $user->avatar }}">
                </div>
            </div>
            <div class="col-md-6">
                <div class="my-3">
                    <div class="d-flex justify-content-between mb-3">
                        <h4 class="text-right">Profil Petugas</h4>
                    </div>
                    <table>
                        <tr>
                            <td class="vertical-top text-no-wrap">Nama</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ $user->nama ?? '-' }}</td>
                        </tr>
                        <tr>
                            <td class="vertical-top text-no-wrap">No. Identitas</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ $user->no_identitas ?? '-' }}</td>
                        </tr>
                        <tr>
                            <td class="vertical-top text-no-wrap">Jabatan</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ $user->jabatan ?? '-' }}</td>
                        </tr>
                        <tr>
                            <td class="vertical-top text-no-wrap">Group</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ $user->group->nama ?? '-' }}</td>
                        </tr>
                        <tr>
                            <td class="vertical-top text-no-wrap">Telepon</td>
                            <td class="vertical-top">&nbsp;&nbsp;&nbsp;:&nbsp;</td>
                            <td class="vertical-top">{{ $user->telepon ?? '-' }}</td>
                        </tr>
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
