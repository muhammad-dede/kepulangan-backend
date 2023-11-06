<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\BastMakanResource;
use App\Models\BastMakan;
use App\Models\Makan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class BastMakanController extends Controller
{
    private $path;
    private $relation;

    public function __construct()
    {
        $this->path = 'uploads';
        $this->relation = ['makan.imigran'];
    }

    public function index(Request $request)
    {
        $per_page = $request->get('per_page') ?? 10;
        $search = $request->get('search');
        $terlaksana = $request->get('terlaksana');

        if ($search) {
            $data = BastMakan::where('purchase_order', 'LIKE', '%' . $search . '%')->orWhereHas('penyedia_jasa', function ($penyedia_jasa) use ($search) {
                $penyedia_jasa->where('nama_perusahaan', 'LIKE', '%' . $search . '%')->orWhere('email', 'LIKE', '%' . $search . '%')->orWhere('no_telp', 'LIKE', '%' . $search . '%')->orWhere('up', 'LIKE', '%' . $search . '%');
            })
                ->with($this->relation)
                ->orderBy('id', 'desc')
                ->get();
        } else {
            $data = BastMakan::with($this->relation)->orderBy('id', 'desc')->paginate($per_page);
        }

        return response()->json([
            'message' => 'Success',
            'data' => BastMakanResource::collection($data),
        ], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'purchase_order' => 'required|string|max:255|unique:bast_makan,purchase_order',
            'id_penyedia_jasa' => 'required|integer',
            'id_alamat' => 'required|integer',
            'durasi_pengerjaan' => 'required|numeric',
            'tanggal_serah_terima' => 'required|date_format:Y-m-d',
            'waktu_serah_terima' => 'required|string|max:255',
            'foto_penyedia_jasa' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'foto_serah_terima' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'foto_invoice' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'makan' => 'nullable|array',
        ], [], [
            'id_penyedia_jasa' => 'Data Penyedia Jasa',
            'purchase_order' => 'Purchase Order',
            'id_alamat' => 'Alamat/Lokasi Jemput',
            'durasi_pengerjaan' => 'Durasi Pengerjaan',
            'tanggal_serah_terima' => 'Tanggal Serah Terima',
            'waktu_serah_terima' => 'Waktu Serah Terima',
            'foto_penyedia_jasa' => 'Foto Penyedia Jasa',
            'foto_serah_terima' => 'Foto Serah Terima',
            'foto_invoice' => 'Foto Invoice',
            'makan' => 'Data PMI',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        // $check_terlaksana = BastMakan::where('terlaksana', 0)->first();
        // if ($check_terlaksana) {
        //     return response()->json([
        //         'message' => "Terdapat Fasilitas Makan yang belum diselesaikan!",
        //     ], 400);
        // }
        // $check_same_value = BastMakan::where('tanggal_serah_terima', $request->tanggal_serah_terima)->where('waktu_serah_terima', $request->waktu_serah_terima)->count();
        // if ($check_same_value > 0) {
        //     return response()->json([
        //         'message' => "Purchase Order dengan Tanggal dan waktu tersebut telah dibuat sebelumnya.",
        //     ], 400);
        // }

        $data = BastMakan::create([
            'purchase_order' => $request->purchase_order,
            'id_penyedia_jasa' => $request->id_penyedia_jasa,
            'id_alamat' => $request->id_alamat,
            'durasi_pengerjaan' => $request->durasi_pengerjaan,
            'tanggal_serah_terima' => $request->tanggal_serah_terima,
            'waktu_serah_terima' => $request->waktu_serah_terima,
            'foto_penyedia_jasa' => null,
            'foto_serah_terima' => null,
            'foto_invoice' => null,
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

        if ($request->hasFile('foto_invoice')) {

            if (!File::isDirectory(public_path($this->path))) {
                File::makeDirectory(public_path($this->path), 0777, true, true);
            }

            if (File::exists(public_path($this->path . '/' . basename($data->foto_invoice)))) {
                File::delete(public_path($this->path . '/' . basename($data->foto_invoice)));
            }

            $foto_invoice = Str::uuid() . '.' . $request->foto_invoice->extension();

            if ($request->foto_invoice->move(public_path($this->path), $foto_invoice)) {
                $data->update([
                    'foto_invoice' => asset('') . $this->path . '/' . $foto_invoice
                ]);
            };
        }

        if ($request->makan) {
            foreach ($request->makan as $key => $request_makan) {
                $data->makan()->updateOrCreate([
                    'id_imigran' => $request_makan['id_imigran'],
                    'id_bast_makan' => $data->id,
                ], [
                    'id_imigran' => $request_makan['id_imigran'],
                    'id_bast_makan' => $data->id,
                ]);
            }
        }

        return response()->json([
            'message' => 'Success',
            'data' => new BastMakanResource($data->load($this->relation)),
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'purchase_order' => 'required|string|max:255|unique:bast_makan,purchase_order,' . $id . ',id',
            'id_penyedia_jasa' => 'required|integer',
            'id_alamat' => 'required|integer',
            'durasi_pengerjaan' => 'required|numeric',
            'tanggal_serah_terima' => 'required|date_format:Y-m-d',
            'waktu_serah_terima' => 'required|string|max:255',
            'foto_penyedia_jasa' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'foto_serah_terima' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'foto_invoice' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'makan' => 'nullable|array',
        ], [], [
            'id_penyedia_jasa' => 'Data Penyedia Jasa',
            'purchase_order' => 'Purchase Order',
            'id_alamat' => 'Alamat/Lokasi Jemput',
            'durasi_pengerjaan' => 'Durasi Pengerjaan',
            'tanggal_serah_terima' => 'Tanggal Serah Terima',
            'waktu_serah_terima' => 'Waktu Serah Terima',
            'foto_penyedia_jasa' => 'Foto Penyedia Jasa',
            'foto_serah_terima' => 'Foto Serah Terima',
            'foto_invoice' => 'Foto Invoice',
            'makan' => 'Data PMI',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = BastMakan::findOrFail($id);

        $data->update([
            'purchase_order' => $request->purchase_order,
            'id_penyedia_jasa' => $request->id_penyedia_jasa,
            'id_alamat' => $request->id_alamat,
            'durasi_pengerjaan' => $request->durasi_pengerjaan,
            'tanggal_serah_terima' => $request->tanggal_serah_terima,
            'waktu_serah_terima' => $request->waktu_serah_terima,
            'foto_penyedia_jasa' => $data->foto_penyedia_jasa,
            'foto_serah_terima' => $data->foto_serah_terima,
            'foto_invoice' => $data->foto_invoice,
            'terlaksana' => $data->terlaksana ?? 0,
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

        if ($request->hasFile('foto_invoice')) {

            if (!File::isDirectory(public_path($this->path))) {
                File::makeDirectory(public_path($this->path), 0777, true, true);
            }

            if (File::exists(public_path($this->path . '/' . basename($data->foto_invoice)))) {
                File::delete(public_path($this->path . '/' . basename($data->foto_invoice)));
            }

            $foto_invoice = Str::uuid() . '.' . $request->foto_invoice->extension();

            if ($request->foto_invoice->move(public_path($this->path), $foto_invoice)) {
                $data->update([
                    'foto_invoice' => asset('') . $this->path . '/' . $foto_invoice
                ]);
            };
        }

        $imigrans = [];
        if ($request->makan) {
            foreach ($request->makan as $key => $request_makan) {
                $data->makan()->updateOrCreate([
                    'id_imigran' => $request_makan['id_imigran'],
                    'id_bast_makan' => $data->id,
                ], [
                    'id_imigran' => $request_makan['id_imigran'],
                    'id_bast_makan' => $data->id,
                ]);

                $imigrans[] = $request_makan['id_imigran'];
            }
        }
        Makan::where('id_bast_makan', $data->id)->whereNotIn('id_imigran', $imigrans)->delete();

        return response()->json([
            'message' => 'Success',
            'data' => new BastMakanResource($data->load($this->relation)),
        ], 200);
    }

    public function destroy($id)
    {
        $data = BastMakan::findOrFail($id);

        if (File::exists(public_path($this->path . '/' . basename($data->foto_penyedia_jasa)))) {
            File::delete(public_path($this->path . '/' . basename($data->foto_penyedia_jasa)));
        }

        if (File::exists(public_path($this->path . '/' . basename($data->foto_serah_terima)))) {
            File::delete(public_path($this->path . '/' . basename($data->foto_serah_terima)));
        }

        if (File::exists(public_path($this->path . '/' . basename($data->foto_invoice)))) {
            File::delete(public_path($this->path . '/' . basename($data->foto_invoice)));
        }

        $data->delete();

        return response()->json([
            'message' => 'Success',
        ], 200);
    }

    public function terlaksana(Request $request, $id)
    {
        $data = BastMakan::findOrFail($id);

        if ($data->makan()->count() == 0) {
            return response()->json([
                'message' => 'Belum Ada Data PMI',
            ], 400);
        }

        if ($data->foto_penyedia_jasa == null || $data->foto_penyedia_jasa == "") {
            return response()->json([
                'message' => 'Belum Ada Foto Pihak Kedua',
            ], 400);
        }

        if ($data->foto_serah_terima == null || $data->foto_serah_terima == "") {
            return response()->json([
                'message' => 'Belum Ada Foto Serah Terima',
            ], 400);
        }

        if ($data->foto_invoice == null || $data->foto_invoice == "") {
            return response()->json([
                'message' => 'Belum Ada Foto Invoice',
            ], 400);
        }

        $data->update([
            'terlaksana' => 1,
            'id_user' => auth()->id(),
        ]);

        return response()->json([
            'message' => 'Success',
            'data' => new BastMakanResource($data->load($this->relation)),
        ], 200);
    }
}
