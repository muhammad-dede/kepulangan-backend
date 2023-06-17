<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\BastPihakLainResource;
use App\Models\BastPihakLain;
use App\Models\Imigran;
use App\Models\JemputPihakLain;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class BastPihakLainController extends Controller
{
    private $path;
    private $relation;

    public function __construct()
    {
        $this->path = 'uploads';
        $this->relation = ['jemput_pihak_lain.imigran'];
    }

    public function index(Request $request)
    {
        $per_page = $request->get('per_page') ?? 10;
        $search = $request->get('search');
        $terlaksana = $request->get('terlaksana');

        if ($search) {
            $data = BastPihakLain::whereHas('pihak_kedua', function ($pihak_kedua) use ($search) {
                $pihak_kedua->where('nama', 'LIKE', '%' . $search . '%')->orWhere('no_identitas', 'LIKE', '%' . $search . '%')->orWhere('jabatan', 'LIKE', '%' . $search . '%')->orWhere('instansi', 'LIKE', '%' . $search . '%');
            })
                ->with($this->relation)
                ->orderBy('id', 'desc')
                ->get();
        } else if ($terlaksana == "0") {
            $data = BastPihakLain::where('terlaksana', $terlaksana)->with($this->relation)->orderBy('id', 'desc')->get();
        } else {
            $data = BastPihakLain::with($this->relation)->orderBy('id', 'desc')->paginate($per_page);
        }

        return response()->json([
            'message' => 'Success',
            'data' => BastPihakLainResource::collection($data),
        ], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id_pihak_kedua' => 'required|integer',
            'tanggal_serah_terima' => 'required|date_format:Y-m-d',
            'foto_pihak_kedua' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'foto_serah_terima' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'jemput_pihak_lain' => 'nullable|array',
        ], [], [
            'id_pihak_kedua' => 'Data Pihak Kedua',
            'tanggal_serah_terima' => 'Tanggal Serah Terima',
            'foto_pihak_kedua' => 'Foto Pihak Kedua',
            'foto_serah_terima' => 'Foto Serah Terima',
            'jemput_pihak_lain' => 'Data PMI',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = BastPihakLain::create([
            'id_pihak_kedua' => $request->id_pihak_kedua,
            'tanggal_serah_terima' => $request->tanggal_serah_terima,
            'foto_pihak_kedua' => null,
            'foto_serah_terima' => null,
            'terlaksana' => 0,
            'id_user' => auth()->id(),
        ]);

        if ($request->hasFile('foto_pihak_kedua')) {

            if (!File::isDirectory(public_path($this->path))) {
                File::makeDirectory(public_path($this->path), 0777, true, true);
            }

            if (File::exists(public_path($this->path . '/' . basename($data->foto_pihak_kedua)))) {
                File::delete(public_path($this->path . '/' . basename($data->foto_pihak_kedua)));
            }

            $foto_pihak_kedua = Str::uuid() . '.' . $request->foto_pihak_kedua->extension();

            if ($request->foto_pihak_kedua->move(public_path($this->path), $foto_pihak_kedua)) {
                $data->update([
                    'foto_pihak_kedua' => asset('') . $this->path . '/' . $foto_pihak_kedua
                ]);
            };
        }

        if ($request->hasFile('foto_serah_terima')) {

            if (!File::isDirectory(public_path($this->path))) {
                File::makeDirectory(public_path($this->path), 0777, true, true);
            }

            if (File::exists(public_path($this->path . '/' . basename($data->foto_serah_terima)))) {
                File::delete(public_path($this->path . '/' . basename($data->foto_serah_terima)));
            }

            $foto_serah_terima = Str::uuid() . '.' . $request->foto_serah_terima->extension();

            if ($request->foto_serah_terima->move(public_path($this->path), $foto_serah_terima)) {
                $data->update([
                    'foto_serah_terima' => asset('') . $this->path . '/' . $foto_serah_terima
                ]);
            };
        }

        if ($request->jemput_pihak_lain) {
            foreach ($request->jemput_pihak_lain as $jemput_pihak_lain) {
                $data->jemput_pihak_lain()->updateOrCreate([
                    'id_imigran' => $jemput_pihak_lain['id_imigran'],
                    'id_bast_pihak_lain' => $data->id,
                ], [
                    'id_kepulangan' => 6,
                    'id_imigran' => $jemput_pihak_lain['id_imigran'],
                    'id_bast_pihak_lain' => $data->id,
                ]);

                Imigran::where('id', $jemput_pihak_lain['id_imigran'])->update([
                    'id_kepulangan' => 6,
                ]);
            }
        }

        return response()->json([
            'message' => 'Success',
            'data' => new BastPihakLainResource($data->load($this->relation)),
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'id_pihak_kedua' => 'required|integer',
            'tanggal_serah_terima' => 'required|date_format:Y-m-d',
            'foto_pihak_kedua' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'foto_serah_terima' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'jemput_pihak_lain' => 'nullable|array',
        ], [], [
            'id_pihak_kedua' => 'Data Pihak Kedua',
            'tanggal_serah_terima' => 'Tanggal Serah Terima',
            'foto_pihak_kedua' => 'Foto Pihak Kedua',
            'foto_serah_terima' => 'Foto Serah Terima',
            'jemput_pihak_lain' => 'Data PMI',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = BastPihakLain::findOrfail($id);

        $data->update([
            'id_pihak_kedua' => $request->id_pihak_kedua,
            'foto_pihak_kedua' => $data->foto_pihak_kedua,
            'foto_serah_terima' => $data->foto_serah_terima,
            'terlaksana' => $data->terlaksana,
            'id_user' => $data->id_user ?? auth()->id(),
        ]);

        if ($request->hasFile('foto_pihak_kedua')) {

            if (!File::isDirectory(public_path($this->path))) {
                File::makeDirectory(public_path($this->path), 0777, true, true);
            }

            if (File::exists(public_path($this->path . '/' . basename($data->foto_pihak_kedua)))) {
                File::delete(public_path($this->path . '/' . basename($data->foto_pihak_kedua)));
            }

            $foto_pihak_kedua = Str::uuid() . '.' . $request->foto_pihak_kedua->extension();

            if ($request->foto_pihak_kedua->move(public_path($this->path), $foto_pihak_kedua)) {
                $data->update([
                    'foto_pihak_kedua' => asset('') . $this->path . '/' . $foto_pihak_kedua
                ]);
            };
        }

        if ($request->hasFile('foto_serah_terima')) {

            if (!File::isDirectory(public_path($this->path))) {
                File::makeDirectory(public_path($this->path), 0777, true, true);
            }

            if (File::exists(public_path($this->path . '/' . basename($data->foto_serah_terima)))) {
                File::delete(public_path($this->path . '/' . basename($data->foto_serah_terima)));
            }

            $foto_serah_terima = Str::uuid() . '.' . $request->foto_serah_terima->extension();

            if ($request->foto_serah_terima->move(public_path($this->path), $foto_serah_terima)) {
                $data->update([
                    'foto_serah_terima' => asset('') . $this->path . '/' . $foto_serah_terima
                ]);
            };
        }

        $imigrans = [];
        if ($request->jemput_pihak_lain) {
            foreach ($request->jemput_pihak_lain as $jemput_pihak_lain) {
                $data->jemput_pihak_lain()->updateOrCreate([
                    'id_imigran' => $jemput_pihak_lain['id_imigran'],
                    'id_bast_pihak_lain' => $data->id,
                ], [
                    'id_kepulangan' => 6,
                    'id_imigran' => $jemput_pihak_lain['id_imigran'],
                    'id_bast_pihak_lain' => $data->id,
                ]);
                Imigran::where('id', $jemput_pihak_lain['id_imigran'])->update([
                    'id_kepulangan' => 6,
                ]);

                $imigrans[] = $jemput_pihak_lain['id_imigran'];
            }
        }
        Imigran::whereHas('jemput_pihak_lain', function ($jemput_pihak_lain) use ($id) {
            $jemput_pihak_lain->where('id_bast_pihak_lain', $id);
        })->whereNotIn('id', $imigrans)->update([
            'id_kepulangan' => null,
        ]);

        JemputPihakLain::where('id_bast_pihak_lain', $data->id)->whereNotIn('id_imigran', $imigrans)->delete();

        return response()->json([
            'message' => 'Success',
            'data' => new BastPihakLainResource($data->load($this->relation)),
        ], 200);
    }

    public function destroy($id)
    {
        $data = BastPihakLain::findOrFail($id);

        if (File::exists(public_path($this->path . '/' . basename($data->foto_pihak_kedua)))) {
            File::delete(public_path($this->path . '/' . basename($data->foto_pihak_kedua)));
        }
        if (File::exists(public_path($this->path . '/' . basename($data->foto_serah_terima)))) {
            File::delete(public_path($this->path . '/' . basename($data->foto_serah_terima)));
        }

        if ($data->jemput_pihak_lain) {
            foreach ($data->jemput_pihak_lain as $jemput_pihak_lain) {
                $jemput_pihak_lain->imigran([
                    'id_kepulangan' => null,
                    'terlaksana' => 0,
                ]);
            }
        }

        $data->delete();

        return response()->json([
            'message' => 'Success'
        ], 200);
    }

    public function terlaksana(Request $request, $id)
    {
        $data = BastPihakLain::findOrFail($id);
        if ($data->jemput_pihak_lain()->count() == 0) {
            return response()->json([
                'message' => 'Belum Ada Data PMI',
            ], 400);
        }

        if ($data->foto_pihak_kedua == null || $data->foto_pihak_kedua == "") {
            return response()->json([
                'message' => 'Belum Ada Foto Pihak Kedua',
            ], 400);
        }

        if ($data->foto_serah_terima == null || $data->foto_serah_terima == "") {
            return response()->json([
                'message' => 'Belum Ada Foto Serah Terima',
            ], 400);
        }

        $data->update([
            'terlaksana' => 1,
            'id_user' => auth()->id(),
        ]);

        foreach ($data->jemput_pihak_lain as $jemput_pihak_lain) {
            $jemput_pihak_lain->imigran->update([
                'terlaksana' => 1,
            ]);
        }

        return response()->json([
            'message' => 'Success',
            'data' => new BastPihakLainResource($data->load($this->relation)),
        ], 200);
    }
}
