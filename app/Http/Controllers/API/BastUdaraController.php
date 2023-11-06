<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\BastUdaraResource;
use App\Models\BastUdara;
use App\Models\Imigran;
use App\Models\Spu;
use App\Models\SpuTiket;
use App\Models\Udara;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class BastUdaraController extends Controller
{
    private $path;
    private $relation;

    public function __construct()
    {
        $this->path = 'uploads';
        $this->relation = ['udara.imigran', 'spu.provinsi', 'spu.spu_tiket'];
    }

    public function index(Request $request)
    {
        $per_page = $request->get('per_page') ?? 10;
        $search = $request->get('search');
        $terlaksana = $request->get('terlaksana');

        if ($search) {
            $data = BastUdara::where('purchase_order', 'LIKE', '%' . $search . '%')->orWhereHas('penyedia_jasa', function ($penyedia_jasa) use ($search) {
                $penyedia_jasa->where('nama_perusahaan', 'LIKE', '%' . $search . '%')->orWhere('email', 'LIKE', '%' . $search . '%')->orWhere('no_telp', 'LIKE', '%' . $search . '%')->orWhere('up', 'LIKE', '%' . $search . '%');
            })
                ->with($this->relation)
                ->orderBy('id', 'desc')
                ->get();
        } else if ($terlaksana == "0") {
            $data = BastUdara::where('terlaksana', $terlaksana)->with($this->relation)->orderBy('id', 'desc')->get();
        } else {
            $data = BastUdara::with($this->relation)->orderBy('id', 'desc')->paginate($per_page);
        }

        return response()->json([
            'message' => 'Success',
            'data' => BastUdaraResource::collection($data),
        ], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'purchase_order' => 'required|string|max:255|unique:bast_udara,purchase_order',
            'id_penyedia_jasa' => 'required|integer',
            'id_alamat' => 'required|integer',
            'durasi_pengerjaan' => 'required|numeric',
            'tanggal_serah_terima' => 'required|date_format:Y-m-d',
            'foto_penyedia_jasa' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'foto_serah_terima' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'udara' => 'nullable|array',
        ], [], [
            'id_penyedia_jasa' => 'Data Penyedia Jasa',
            'purchase_order' => 'Purchase Order',
            'id_alamat' => 'Alamat/Lokasi Jemput',
            'durasi_pengerjaan' => 'Durasi Pengerjaan',
            'tanggal_serah_terima' => 'Tanggal Serah Terima',
            'foto_penyedia_jasa' => 'Foto Penyedia Jasa',
            'foto_serah_terima' => 'Foto Serah Terima',
            'udara' => 'Data PMI',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = BastUdara::create([
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

        if ($request->udara) {
            foreach ($request->udara as $key => $udara) {
                $data->udara()->updateOrCreate([
                    'id_imigran' => $udara['id_imigran'],
                    'id_bast_udara' => $data->id,
                ], [
                    'id_kepulangan' => 2,
                    'id_imigran' => $udara['id_imigran'],
                    'id_bast_udara' => $data->id,
                ]);

                if ($udara['foto_boarding_pass']) {
                    $udara_imigran = Udara::where('id_imigran', $udara['id_imigran'])->where('id_bast_udara', $data->id)->first();

                    if (!File::isDirectory(public_path($this->path))) {
                        File::makeDirectory(public_path($this->path), 0777, true, true);
                    }

                    if (File::exists(public_path($this->path . '/' . basename($udara_imigran->foto_boarding_pass)))) {
                        File::delete(public_path($this->path . '/' . basename($udara_imigran->foto_boarding_pass)));
                    }

                    $foto_boarding_pass = Str::uuid() . '.' . $udara['foto_boarding_pass']->extension();

                    if ($udara['foto_boarding_pass']->move(public_path($this->path), $foto_boarding_pass)) {
                        $data->udara()->updateOrCreate([
                            'id_imigran' => $udara['id_imigran'],
                            'id_bast_udara' => $data->id,
                        ], [
                            'foto_boarding_pass' => asset('') . $this->path . '/' . $foto_boarding_pass
                        ]);
                    };
                }

                Imigran::where('id', $udara['id_imigran'])->update([
                    'id_kepulangan' => 2,
                ]);
            }
        }

        return response()->json([
            'message' => 'Success',
            'data' => new BastUdaraResource($data->load($this->relation)),
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'purchase_order' => 'required|string|max:255|unique:bast_udara,purchase_order,' . $id . ',id',
            'id_penyedia_jasa' => 'required|integer',
            'id_alamat' => 'required|integer',
            'durasi_pengerjaan' => 'required|numeric',
            'tanggal_serah_terima' => 'required|date_format:Y-m-d',
            'foto_penyedia_jasa' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'foto_serah_terima' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            'udara' => 'nullable|array',
        ], [], [
            'id_penyedia_jasa' => 'Data Penyedia Jasa',
            'purchase_order' => 'Purchase Order',
            'id_alamat' => 'Alamat/Lokasi Jemput',
            'durasi_pengerjaan' => 'Durasi Pengerjaan',
            'tanggal_serah_terima' => 'Tanggal Serah Terima',
            'foto_penyedia_jasa' => 'Foto Penyedia Jasa',
            'foto_serah_terima' => 'Foto Serah Terima',
            'udara' => 'Data PMI',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = BastUdara::findOrFail($id);

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

        if ($request->udara) {
            foreach ($request->udara as $key => $udara) {
                $data->udara()->updateOrCreate([
                    'id_imigran' => $udara['id_imigran'],
                    'id_bast_udara' => $id,
                ], [
                    'id_kepulangan' => 2,
                    'id_imigran' => $udara['id_imigran'],
                    'id_bast_udara' => $id,
                ]);

                if ($udara['foto_boarding_pass']) {
                    $udara_imigran = Udara::where('id_imigran', $udara['id_imigran'])->where('id_bast_udara', $id)->first();

                    if (!File::isDirectory(public_path($this->path))) {
                        File::makeDirectory(public_path($this->path), 0777, true, true);
                    }

                    if (File::exists(public_path($this->path . '/' . basename($udara_imigran->foto_boarding_pass)))) {
                        File::delete(public_path($this->path . '/' . basename($udara_imigran->foto_boarding_pass)));
                    }

                    $foto_boarding_pass = Str::uuid() . '.' . $udara['foto_boarding_pass']->extension();

                    if ($udara['foto_boarding_pass']->move(public_path($this->path), $foto_boarding_pass)) {
                        $data->udara()->updateOrCreate([
                            'id_imigran' => $udara['id_imigran'],
                            'id_bast_udara' => $id,
                        ], [
                            'foto_boarding_pass' => asset('') . $this->path . '/' . $foto_boarding_pass
                        ]);
                    };
                }

                Imigran::where('id', $udara['id_imigran'])->update([
                    'id_kepulangan' => 2,
                ]);

                $imigrans[] = $udara['id_imigran'];
            }
        }

        Imigran::whereHas('udara', function ($udara) use ($id) {
            $udara->where('id_bast_udara', $id);
        })->whereNotIn('id', $imigrans)->update([
            'id_kepulangan' => null,
        ]);

        $bast_udara_imigran = Udara::where('id_bast_udara', $id)->whereNotIn('id_imigran', $imigrans)->get();

        foreach ($bast_udara_imigran as $item) {
            if (File::exists(public_path($this->path . '/' . basename($item->foto_boarding_pass)))) {
                File::delete(public_path($this->path . '/' . basename($item->foto_boarding_pass)));
            }
            $item->delete();
        }

        return response()->json([
            'message' => 'Success',
            'data' => new BastUdaraResource($data->load($this->relation)),
        ], 200);
    }

    public function destroy($id)
    {
        $data = BastUdara::findOrFail($id);

        if (File::exists(public_path($this->path . '/' . basename($data->foto_penyedia_jasa)))) {
            File::delete(public_path($this->path . '/' . basename($data->foto_penyedia_jasa)));
        }
        if (File::exists(public_path($this->path . '/' . basename($data->foto_serah_terima)))) {
            File::delete(public_path($this->path . '/' . basename($data->foto_serah_terima)));
        }
        if ($data->spu) {
            $spu = Spu::where('id_bast_udara', $id)->first();
            if ($spu->spu_tiket) {
                foreach ($spu->spu_tiket as $spu_tiket) {
                    if (File::exists(public_path($this->path . '/' . basename($spu_tiket->foto_tiket)))) {
                        File::delete(public_path($this->path . '/' . basename($spu_tiket->foto_tiket)));
                    }
                }
            }
        }
        if ($data->udara) {
            foreach ($data->udara as $udara) {
                if (File::exists(public_path($this->path . '/' . basename($udara->foto_boarding_pass)))) {
                    File::delete(public_path($this->path . '/' . basename($udara->foto_boarding_pass)));
                }

                $udara->imigran->update([
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
        $data = BastUdara::findOrFail($id);
        if ($data->udara()->count() == 0) {
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

        foreach ($data->udara as $udara) {
            if ($udara->foto_boarding_pass == null || $udara->foto_boarding_pass == "") {
                return response()->json([
                    'message' => 'Belum Ada Foto Boarding Pass pada beberapa PMI',
                ], 400);
            }

            $udara->imigran->update([
                'terlaksana' => 1,
            ]);
        }

        $data->update([
            'terlaksana' => 1,
            'id_user' => auth()->id(),
        ]);

        return response()->json([
            'message' => 'Success',
            'data' => new BastUdaraResource($data->load($this->relation)),
        ], 200);
    }

    public function purchase_order()
    {
        $last_purchase_order = BastUdara::orderBy('id', 'desc')->pluck('purchase_order')->first();
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

    public function spu(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'no_surat' => 'required|string|max:255',
            'tanggal_surat' => 'required|date_format:Y-m-d',
            'id_provinsi' => 'required|integer',
            'no_pesawat' => 'required|string|max:255',
            'jam_pesawat' => 'required|string|max:255',
            'tanggal_pesawat' => 'required|date_format:Y-m-d',
            'spu_tiket' => 'nullable|array',
        ], [], [
            'no_surat' => 'No Surat',
            'tanggal_surat' => 'Tanggal Surat',
            'id_provinsi' => 'Provinsi',
            'no_pesawat' => 'No Pesawat',
            'jam_pesawat' => 'Jam Pesawat',
            'tanggal_pesawat' => 'Tanggal Pesawat',
            'spu_tiket' => 'Foto Tiket',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = BastUdara::findOrFail($id);
        $data->spu()->updateOrCreate([
            'id_bast_udara' => $id,
        ], [
            'id_bast_udara' => $id,
            'no_surat' => $request->no_surat,
            'tanggal_surat' => $request->tanggal_surat,
            'id_provinsi' => $request->id_provinsi,
            'no_pesawat' => $request->no_pesawat,
            'jam_pesawat' => $request->jam_pesawat,
            'tanggal_pesawat' => $request->tanggal_pesawat,
        ]);

        if ($request->spu_tiket) {
            $foto_tiket_old = [];
            foreach ($request->spu_tiket as $key => $request_spu_tiket) {
                if ($request_spu_tiket['foto_tiket'] && $request_spu_tiket['foto_tiket_url']) {
                    if (!File::isDirectory(public_path($this->path))) {
                        File::makeDirectory(public_path($this->path), 0777, true, true);
                    }

                    $foto_tiket = Str::uuid() . '.' . $request_spu_tiket['foto_tiket']->extension();

                    if ($request_spu_tiket['foto_tiket']->move(public_path($this->path), $foto_tiket)) {
                        $new_spu_tiket = SpuTiket::updateOrCreate([
                            'id_spu' => $data->spu->id,
                            'foto_tiket' => $request_spu_tiket['foto_tiket_url'],
                        ], [
                            'foto_tiket' => asset('') . $this->path . '/' . $foto_tiket
                        ]);
                        $foto_tiket_old[] = $new_spu_tiket->foto_tiket;
                    };
                }

                if ($request_spu_tiket['foto_tiket'] && empty($request_spu_tiket['foto_tiket_url'])) {
                    if (!File::isDirectory(public_path($this->path))) {
                        File::makeDirectory(public_path($this->path), 0777, true, true);
                    }

                    $foto_tiket = Str::uuid() . '.' . $request_spu_tiket['foto_tiket']->extension();

                    if ($request_spu_tiket['foto_tiket']->move(public_path($this->path), $foto_tiket)) {
                        $new_spu_tiket = SpuTiket::create([
                            'id_spu' => $data->spu->id,
                            'foto_tiket' => asset('') . $this->path . '/' . $foto_tiket
                        ]);
                        $foto_tiket_old[] = $new_spu_tiket->foto_tiket;
                    };
                }

                if ($request_spu_tiket['foto_tiket_url'] && empty($request_spu_tiket['foto_tiket'])) {
                    $foto_tiket_old[] = $request_spu_tiket['foto_tiket_url'];
                }
            }

            $spu_tiket = SpuTiket::whereHas('spu', function ($spu) use ($id) {
                $spu->where('id_bast_udara', $id);
            })->whereNotIn('foto_tiket', $foto_tiket_old)->get();

            foreach ($spu_tiket as $item) {
                if (File::exists(public_path($this->path . '/' . basename($item->foto_tiket)))) {
                    File::delete(public_path($this->path . '/' . basename($item->foto_tiket)));
                }
                $item->delete();
            }
        } else {
            $spu_tiket = SpuTiket::whereHas('spu', function ($spu) use ($id) {
                $spu->where('id_bast_udara', $id);
            })->get();

            foreach ($spu_tiket as $item) {
                if (File::exists(public_path($this->path . '/' . basename($item->foto_tiket)))) {
                    File::delete(public_path($this->path . '/' . basename($item->foto_tiket)));
                }
                $item->delete();
            }
        }

        return response()->json([
            'message' => 'Success',
            'data' => new BastUdaraResource($data->load($this->relation)),
        ], 200);
    }
}
