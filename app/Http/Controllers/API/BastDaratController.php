<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\BastDaratResource;
use App\Models\BastDarat;
use App\Models\Darat;
use App\Models\Imigran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class BastDaratController extends Controller
{
    private $path;
    private $relation;

    public function __construct()
    {
        $this->path = 'uploads';
        $this->relation = ['darat.imigran'];
    }

    public function index(Request $request)
    {
        $per_page = $request->get('per_page') ?? 10;
        $search = $request->get('search');
        $terlaksana = $request->get('terlaksana');

        if ($search) {
            $data = BastDarat::where('purchase_order', 'LIKE', '%' . $search . '%')->orWhereHas('penyedia_jasa', function ($penyedia_jasa) use ($search) {
                $penyedia_jasa->where('nama_perusahaan', 'LIKE', '%' . $search . '%')->orWhere('email', 'LIKE', '%' . $search . '%')->orWhere('no_telp', 'LIKE', '%' . $search . '%')->orWhere('up', 'LIKE', '%' . $search . '%');
            })
                ->with($this->relation)
                ->orderBy('id', 'desc')
                ->get();
        } else if ($terlaksana == "0") {
            $data = BastDarat::where('terlaksana', $terlaksana)->with($this->relation)->orderBy('id', 'desc')->get();
        } else {
            $data = BastDarat::with($this->relation)->orderBy('id', 'desc')->paginate($per_page);
        }

        return response()->json([
            'message' => 'Success',
            'data' => BastDaratResource::collection($data),
        ], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'purchase_order' => 'required|string|max:255|unique:bast_darat,purchase_order',
            'id_penyedia_jasa' => 'required|integer',
            'id_alamat' => 'required|integer',
            'durasi_pengerjaan' => 'required|numeric',
            'tanggal_serah_terima' => 'required|date_format:Y-m-d',
            'foto_penyedia_jasa' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'foto_serah_terima' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'darat' => 'nullable|array',
        ], [], [
            'id_penyedia_jasa' => 'Data Penyedia Jasa',
            'purchase_order' => 'Purchase Order',
            'id_alamat' => 'Alamat/Lokasi Jemput',
            'durasi_pengerjaan' => 'Durasi Pengerjaan',
            'tanggal_serah_terima' => 'Tanggal Serah Terima',
            'foto_penyedia_jasa' => 'Foto Penyedia Jasa',
            'foto_serah_terima' => 'Foto Serah Terima',
            'darat' => 'Data PMI',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = BastDarat::create([
            'purchase_order' => $request->purchase_order,
            'id_penyedia_jasa' => $request->id_penyedia_jasa,
            'id_alamat' => $request->id_alamat,
            'durasi_pengerjaan' => $request->durasi_pengerjaan,
            'tanggal_serah_terima' => $request->tanggal_serah_terima,
            'foto_penyedia_jasa' => null,
            'foto_serah_terima' => null,
            'terlaksana' => 0,
            'id_user' => auth()->id(),
        ]);

        if ($request->hasFile('foto_penyedia_jasa')) {

            if (!File::isDirectory(public_path($this->path))) {
                File::makeDirectory(public_path($this->path), 0777, true, true);
            }

            if (File::exists(public_path($this->path . '/' . basename($data->foto_penyedia_jasa)))) {
                File::delete(public_path($this->path . '/' . basename($data->foto_penyedia_jasa)));
            }

            $foto_penyedia_jasa = Str::uuid() . '.' . $request->foto_penyedia_jasa->extension();

            if ($request->foto_penyedia_jasa->move(public_path($this->path), $foto_penyedia_jasa)) {
                $data->update([
                    'foto_penyedia_jasa' => asset('') . $this->path . '/' . $foto_penyedia_jasa
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

        if ($request->darat) {
            foreach ($request->darat as $key => $darat) {
                $data->darat()->updateOrCreate([
                    'id_imigran' => $darat['id_imigran'],
                    'id_bast_darat' => $data->id,
                ], [
                    'id_kepulangan' => 1,
                    'id_imigran' => $darat['id_imigran'],
                    'id_bast_darat' => $data->id,
                ]);

                if ($darat['foto_bast']) {
                    $darat_imigran = Darat::where('id_imigran', $darat['id_imigran'])->where('id_bast_darat', $data->id)->first();

                    if (!File::isDirectory(public_path($this->path))) {
                        File::makeDirectory(public_path($this->path), 0777, true, true);
                    }

                    if (File::exists(public_path($this->path . '/' . basename($darat_imigran->foto_bast)))) {
                        File::delete(public_path($this->path . '/' . basename($darat_imigran->foto_bast)));
                    }

                    $foto_bast = Str::uuid() . '.' . $darat['foto_bast']->extension();

                    if ($darat['foto_bast']->move(public_path($this->path), $foto_bast)) {
                        $data->darat()->updateOrCreate([
                            'id_imigran' => $darat['id_imigran'],
                            'id_bast_darat' => $data->id,
                        ], [
                            'foto_bast' => asset('') . $this->path . '/' . $foto_bast
                        ]);
                    };
                }

                Imigran::where('id', $darat['id_imigran'])->update([
                    'id_kepulangan' => 1,
                ]);
            }
        }

        return response()->json([
            'message' => 'Success',
            'data' => new BastDaratResource($data->load($this->relation)),
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'purchase_order' => 'required|string|max:255|unique:bast_darat,purchase_order,' . $id . ',id',
            'id_penyedia_jasa' => 'required|integer',
            'id_alamat' => 'required|integer',
            'durasi_pengerjaan' => 'required|numeric',
            'tanggal_serah_terima' => 'required|date_format:Y-m-d',
            'foto_penyedia_jasa' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'foto_serah_terima' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'darat' => 'nullable|array',
        ], [], [
            'id_penyedia_jasa' => 'Data Penyedia Jasa',
            'purchase_order' => 'Purchase Order',
            'id_alamat' => 'Alamat/Lokasi Jemput',
            'durasi_pengerjaan' => 'Durasi Pengerjaan',
            'tanggal_serah_terima' => 'Tanggal Serah Terima',
            'foto_penyedia_jasa' => 'Foto Penyedia Jasa',
            'foto_serah_terima' => 'Foto Serah Terima',
            'darat' => 'Data PMI',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = BastDarat::findOrFail($id);

        $data->update([
            'purchase_order' => $request->purchase_order,
            'id_penyedia_jasa' => $request->id_penyedia_jasa,
            'id_alamat' => $request->id_alamat,
            'durasi_pengerjaan' => $request->durasi_pengerjaan,
            'tanggal_serah_terima' => $request->tanggal_serah_terima,
            'foto_penyedia_jasa' => $data->foto_penyedia_jasa,
            'foto_serah_terima' => $data->foto_serah_terima,
            'terlaksana' => $data->terlaksana,
            'id_user' => $data->id_user ?? auth()->id(),
        ]);

        if ($request->hasFile('foto_penyedia_jasa')) {

            if (!File::isDirectory(public_path($this->path))) {
                File::makeDirectory(public_path($this->path), 0777, true, true);
            }

            if (File::exists(public_path($this->path . '/' . basename($data->foto_penyedia_jasa)))) {
                File::delete(public_path($this->path . '/' . basename($data->foto_penyedia_jasa)));
            }

            $foto_penyedia_jasa = Str::uuid() . '.' . $request->foto_penyedia_jasa->extension();

            if ($request->foto_penyedia_jasa->move(public_path($this->path), $foto_penyedia_jasa)) {
                $data->update([
                    'foto_penyedia_jasa' => asset('') . $this->path . '/' . $foto_penyedia_jasa
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
        if ($request->darat) {
            foreach ($request->darat as $key => $darat) {
                $data->darat()->updateOrCreate([
                    'id_imigran' => $darat['id_imigran'],
                    'id_bast_darat' => $id,
                ], [
                    'id_kepulangan' => 1,
                    'id_imigran' => $darat['id_imigran'],
                    'id_bast_darat' => $id,
                ]);

                if ($darat['foto_bast']) {
                    $darat_imigran = Darat::where('id_imigran', $darat['id_imigran'])->where('id_bast_darat', $id)->first();

                    if (!File::isDirectory(public_path($this->path))) {
                        File::makeDirectory(public_path($this->path), 0777, true, true);
                    }

                    if (File::exists(public_path($this->path . '/' . basename($darat_imigran->foto_bast)))) {
                        File::delete(public_path($this->path . '/' . basename($darat_imigran->foto_bast)));
                    }

                    $foto_bast = Str::uuid() . '.' . $darat['foto_bast']->extension();

                    if ($darat['foto_bast']->move(public_path($this->path), $foto_bast)) {
                        $data->darat()->updateOrCreate([
                            'id_imigran' => $darat['id_imigran'],
                            'id_bast_darat' => $id,
                        ], [
                            'foto_bast' => asset('') . $this->path . '/' . $foto_bast
                        ]);
                    };
                }

                Imigran::where('id', $darat['id_imigran'])->update([
                    'id_kepulangan' => 1,
                ]);

                $imigrans[] = $darat['id_imigran'];
            }
        }

        Imigran::whereHas('darat', function ($darat) use ($id) {
            $darat->where('id_bast_darat', $id);
        })->whereNotIn('id', $imigrans)->update([
            'id_kepulangan' => null,
        ]);

        $bast_darat_imigran = Darat::where('id_bast_darat', $id)->whereNotIn('id_imigran', $imigrans)->get();

        foreach ($bast_darat_imigran as $item) {
            if (File::exists(public_path($this->path . '/' . basename($item->foto_bast)))) {
                File::delete(public_path($this->path . '/' . basename($item->foto_bast)));
            }
            $item->delete();
        }

        return response()->json([
            'message' => 'Success',
            'data' => new BastDaratResource($data->load($this->relation)),
        ], 200);
    }

    public function destroy($id)
    {
        $data = BastDarat::findOrFail($id);

        if (File::exists(public_path($this->path . '/' . basename($data->foto_penyedia_jasa)))) {
            File::delete(public_path($this->path . '/' . basename($data->foto_penyedia_jasa)));
        }
        if (File::exists(public_path($this->path . '/' . basename($data->foto_serah_terima)))) {
            File::delete(public_path($this->path . '/' . basename($data->foto_serah_terima)));
        }
        if ($data->darat) {
            foreach ($data->darat as $darat) {
                if (File::exists(public_path($this->path . '/' . basename($darat->foto_bast)))) {
                    File::delete(public_path($this->path . '/' . basename($darat->foto_bast)));
                }

                $darat->imigran->update([
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
        $data = BastDarat::findOrFail($id);
        if ($data->darat()->count() == 0) {
            return response()->json([
                'message' => 'Belum Ada Data PMI',
            ], 400);
        }

        if ($data->foto_penyedia_jasa == null || $data->foto_penyedia_jasa == "") {
            return response()->json([
                'message' => 'Belum Ada Foto Penyedia Jasa',
            ], 400);
        }

        if ($data->foto_serah_terima == null || $data->foto_serah_terima == "") {
            return response()->json([
                'message' => 'Belum Ada Foto Serah Terima',
            ], 400);
        }

        foreach ($data->darat as $darat) {
            if ($darat->foto_bast == null || $darat->foto_bast == "") {
                return response()->json([
                    'message' => 'Belum Ada Foto BAST pada beberapa PMI',
                ], 400);
            }

            $darat->imigran->update([
                'terlaksana' => 1,
            ]);
        }

        $data->update([
            'terlaksana' => 1,
            'id_user' => auth()->id(),
        ]);

        return response()->json([
            'message' => 'Success',
            'data' => new BastDaratResource($data->load($this->relation)),
        ], 200);
    }

    public function purchase_order()
    {
        $last_purchase_order = BastDarat::orderBy('id', 'desc')->pluck('purchase_order')->first();
        $last_year = substr($last_purchase_order, -4, 4);

        if ($last_purchase_order) {
            if ($last_year == date('Y')) {
                $number = sprintf("%04s", substr($last_purchase_order, 3, 4) + 1);
            } else {
                $number = "0001";
            }
        } else {
            $number = "0001";
        }

        $month = array("", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII");

        $purchase_order = "PO." . $number . "/P4MI Bandara Soetta/" . $month[date('n')] . "/" . date("Y");

        return response()->json([
            'message' => 'success',
            'data' => $purchase_order,
        ], 200);
    }
}
