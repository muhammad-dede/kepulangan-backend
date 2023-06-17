<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\ImigranResource;
use App\Models\Imigran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class ImigranController extends Controller
{
    private $path;
    private $relation;

    public function __construct()
    {
        $this->path = 'uploads';
        $this->relation = ['area.antar_area.from_area', 'area.antar_area.to_area', 'area.kepulangan', 'layanan.area', 'layanan.group', 'layanan.masalah', 'layanan.cargo', 'layanan.kepulangan', 'kepulangan', 'user', 'pmi', 'jenazah', 'darat.kepulangan', 'darat.bast_darat', 'udara.kepulangan', 'udara.bast_udara', 'udara.bast_udara.spu', 'udara.bast_udara.spu.spu_tiket', 'rujuk_rs_polri.kepulangan', 'rujuk_rs_polri.pihak_kedua', 'pulang_mandiri.kepulangan', 'jemput_keluarga.kepulangan', 'jemput_pihak_lain.kepulangan', 'jemput_pihak_lain.bast_pihak_lain', 'makan.bast_makan'];
    }

    public function index(Request $request)
    {
        $data_query = Imigran::with($this->relation);

        // Filter By Area
        if ($request->get('id_area')) {
            $data_query->where('id_area', $request->get('id_area'));
        }

        // Filter sesuai imigran yang belum memiliki kepulangan
        if ($request->get('id_kepulangan')) {
            $data_query->doesntHave('kepulangan')->whereHas('area', function ($query) use ($request) {
                $query->whereHas('kepulangan', function ($query) use ($request) {
                    $query->where('id', $request->get('id_kepulangan'));
                });
            });
        }

        // Bast Darat
        if ($request->get('id_bast_darat')) {
            $data_query->orWhereHas('darat', function ($query) use ($request) {
                $query->where('id_bast_darat', $request->get('id_bast_darat'));
            });
        }

        // Bast udara
        if ($request->get('id_bast_udara')) {
            $data_query->orWhereHas('udara', function ($query) use ($request) {
                $query->where('id_bast_udara', $request->get('id_bast_udara'));
            });
        }

        // Bast Pihak Lain
        if ($request->get('id_bast_pihak_lain')) {
            $data_query->orWhereHas('jemput_pihak_lain', function ($query) use ($request) {
                $query->where('id_bast_pihak_lain', $request->get('id_bast_pihak_lain'));
            });
        }

        // Bast Makan
        if ($request->get('id_bast_makan')) {
            $data_query->orWhereHas('makan', function ($query) use ($request) {
                $query->where('id_bast_makan', $request->get('id_bast_makan'));
            });
        }

        // Terlaksana harus string true / false
        if ($request->get('terlaksana')) {
            $terlaksana = $request->get('terlaksana') == "true" ? 1 : 0;
            $data_query->where('terlaksana', $terlaksana);
        }

        // Untuk Pencarian
        if ($request->get('search')) {
            $data_query->where('brafaks', 'LIKE', '%' . $request->get('search') . '%')
                ->orWhere('paspor', 'LIKE', '%' . $request->get('search') . '%')
                ->orWhere('nama', 'LIKE', '%' . $request->get('search') . '%')
                ->orWhereHas('area', function ($query) use ($request) {
                    $query->where('nama', 'LIKE', '%' . $request->get('search') . '%');
                })
                ->orWhereHas('layanan', function ($query) use ($request) {
                    $query->where('nama', 'LIKE', '%' . $request->get('search') . '%');
                })
                ->orWhereHas('kepulangan', function ($query) use ($request) {
                    $query->where('nama', 'LIKE', '%' . $request->get('search') . '%');
                });
        }

        if ($request->get('per_page')) {
            $data = $data_query->orderBy('id', 'desc')->paginate($request->get('per_page'));
        } else {
            $data = $data_query->orderBy('id', 'desc')->get();
        }

        return response()->json([
            'message' => 'Success',
            'data' => ImigranResource::collection($data),
        ], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'brafaks' => 'required|string|max:255',
            'paspor' => 'required|string|max:255|unique:imigran,paspor',
            'nama' => 'required|string|max:255',
            'id_jenis_kelamin' => 'required|integer',
            'id_negara' => 'required|integer',
            'id_sub_kawasan' => 'required|integer',
            'id_kawasan' => 'required|integer',
            'alamat' => 'nullable|string',
            'id_kab_kota' => 'required|integer',
            'id_provinsi' => 'required|integer',
            'no_telp' => 'nullable|string|max:255',
            'id_jabatan' => 'required|integer',
            'tanggal_kedatangan' => 'required|date_format:Y-m-d',
            'id_area' => 'required|integer',
            'id_layanan' => 'required|integer',
        ], [], [
            'brafaks' => 'Brafaks',
            'paspor' => 'Paspor',
            'nama' => 'Nama',
            'id_jenis_kelamin' => 'Jenis Kelamin',
            'id_negara' => 'Negara',
            'id_sub_kawasan' => 'Sub Kawasan',
            'id_kawasan' => 'Kawasan',
            'alamat' => 'Alamat',
            'id_kab_kota' => 'Kab/Kota',
            'id_provinsi' => 'Provinsi',
            'no_telp' => 'No. Telepon',
            'id_jabatan' => 'Jabatan',
            'tanggal_kedatangan' => 'Tanggal Kedatangan',
            'id_area' => 'Area',
            'id_layanan' => 'Layanan',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        // Validasi PMI
        if ($request->id_area != 4 && $request->id_layanan != 6) {
            $validator = Validator::make($request->all(), [
                'id_group' => 'required|integer',
                'id_masalah' => 'required|integer',
                'foto_pmi' => 'required|mimes:png,jpg,jpeg|max:5000',
                'foto_paspor' => 'required|mimes:png,jpg,jpeg|max:5000',
            ], [], [
                'id_group' => 'Group',
                'id_masalah' => 'Masalah',
                'foto_pmi' => 'Foto PMI',
                'foto_paspor' => 'Foto Paspor',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'message' => $validator->errors()->first(),
                ], 400);
            }
        }

        // Validasi Jenazah
        if ($request->id_area == 4 && $request->id_layanan == 6) {
            $validator = Validator::make($request->all(), [
                'id_kepulangan' => 'required|integer',
                'id_cargo' => 'required|integer',
                'foto_jenazah' => 'required|mimes:png,jpg,jpeg|max:5000',
                'foto_paspor' => 'required|mimes:png,jpg,jpeg|max:5000',
                'foto_brafaks' => 'required|mimes:png,jpg,jpeg|max:5000',
            ], [], [
                'id_kepulangan' => 'Kepulangan',
                'id_cargo' => 'Cargo',
                'foto_jenazah' => 'Foto Jenazah',
                'foto_paspor' => 'Foto Paspor',
                'foto_brafaks' => 'Foto Brafaks',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'message' => $validator->errors()->first(),
                ], 400);
            }
        }

        $data = Imigran::create([
            'brafaks' => $request->brafaks,
            'paspor' => strtoupper($request->paspor),
            'nama' => ucwords($request->nama),
            'id_jenis_kelamin' => $request->id_jenis_kelamin,
            'id_negara' => $request->id_negara,
            'id_sub_kawasan' => $request->id_sub_kawasan,
            'id_kawasan' => $request->id_kawasan,
            'alamat' => $request->alamat ? ucfirst($request->alamat) : null,
            'id_kab_kota' => $request->id_kab_kota,
            'id_provinsi' => $request->id_provinsi,
            'no_telp' => $request->no_telp ?? null,
            'id_jabatan' => $request->id_jabatan,
            'tanggal_kedatangan' => $request->tanggal_kedatangan,
            'id_area' => $request->id_area,
            'id_layanan' => $request->id_layanan,
        ]);

        // PMI
        if ($request->id_area != 4 && $request->id_layanan != 6) {

            $data->update([
                'id_kepulangan' => null,
                'terlaksana' => 0,
                'id_user' => $request->id_group == auth()->user()->id_group ? auth()->id() : null,
            ]);

            $data->pmi()->updateOrCreate(['id_imigran' => $data->id], [
                'id_imigran' => $data->id,
                'id_group' => $request->id_group,
                'id_masalah' => $request->id_masalah,
            ]);

            if ($request->hasFile('foto_pmi')) {
                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->pmi->foto_pmi)))) {
                    File::delete(public_path($this->path . '/' . basename($data->pmi->foto_pmi)));
                }

                $foto_pmi = Str::uuid() . '.' . $request->foto_pmi->extension();

                if ($request->foto_pmi->move(public_path($this->path), $foto_pmi)) {
                    $data->pmi()->updateOrCreate(['id_imigran' => $data->id], [
                        'foto_pmi' => asset('') . $this->path . '/' . $foto_pmi
                    ]);
                };
            }

            if ($request->hasFile('foto_paspor')) {
                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->pmi->foto_paspor)))) {
                    File::delete(public_path($this->path . '/' . basename($data->pmi->foto_paspor)));
                }

                $foto_paspor = Str::uuid() . '.' . $request->foto_paspor->extension();

                if ($request->foto_paspor->move(public_path($this->path), $foto_paspor)) {
                    $data->pmi()->updateOrCreate(['id_imigran' => $data->id], [
                        'foto_paspor' => asset('') . $this->path . '/' . $foto_paspor
                    ]);
                };
            }
        }

        if ($request->id_area == 4 && $request->id_layanan == 6) {

            $data->update([
                'id_kepulangan' => $request->id_kepulangan,
                'terlaksana' => 1,
                'id_user' => auth()->id(),
            ]);

            $data->jenazah()->updateOrCreate(['id_imigran' => $data->id], [
                'id_imigran' => $data->id,
                'id_cargo' => $request->id_cargo,
            ]);

            if ($request->hasFile('foto_jenazah')) {
                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->jenazah->foto_jenazah)))) {
                    File::delete(public_path($this->path . '/' . basename($data->jenazah->foto_jenazah)));
                }

                $foto_jenazah = Str::uuid() . '.' . $request->foto_jenazah->extension();

                if ($request->foto_jenazah->move(public_path($this->path), $foto_jenazah)) {
                    $data->jenazah()->updateOrCreate(['id_imigran' => $data->id], [
                        'foto_jenazah' => asset('') . $this->path . '/' . $foto_jenazah
                    ]);
                };
            }

            if ($request->hasFile('foto_paspor')) {
                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->jenazah->foto_paspor)))) {
                    File::delete(public_path($this->path . '/' . basename($data->jenazah->foto_paspor)));
                }

                $foto_paspor = Str::uuid() . '.' . $request->foto_paspor->extension();

                if ($request->foto_paspor->move(public_path($this->path), $foto_paspor)) {
                    $data->jenazah()->updateOrCreate(['id_imigran' => $data->id], [
                        'foto_paspor' => asset('') . $this->path . '/' . $foto_paspor
                    ]);
                };
            }

            if ($request->hasFile('foto_brafaks')) {


                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->jenazah->foto_brafaks)))) {
                    File::delete(public_path($this->path . '/' . basename($data->jenazah->foto_brafaks)));
                }

                $foto_brafaks = Str::uuid() . '.' . $request->foto_brafaks->extension();

                if ($request->foto_brafaks->move(public_path($this->path), $foto_brafaks)) {
                    $data->jenazah()->updateOrCreate(['id_imigran' => $data->id], [
                        'foto_brafaks' => asset('') . $this->path . '/' . $foto_brafaks
                    ]);
                };
            }
        }

        return response()->json([
            'message' => 'Success',
            'data' => new ImigranResource($data->load($this->relation)),
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'brafaks' => 'required|string|max:255',
            'paspor' => 'required|string|max:255|unique:imigran,paspor,' . $id . ',id',
            'nama' => 'required|string|max:255',
            'id_jenis_kelamin' => 'required|integer',
            'id_negara' => 'required|integer',
            'id_sub_kawasan' => 'required|integer',
            'id_kawasan' => 'required|integer',
            'alamat' => 'nullable|string',
            'id_kab_kota' => 'required|integer',
            'id_provinsi' => 'required|integer',
            'no_telp' => 'nullable|string|max:255',
            'id_jabatan' => 'required|integer',
            'tanggal_kedatangan' => 'required|date_format:Y-m-d',
            'id_area' => 'required|integer',
            'id_layanan' => 'required|integer',
        ], [], [
            'brafaks' => 'Brafaks',
            'paspor' => 'Paspor',
            'nama' => 'Nama',
            'id_jenis_kelamin' => 'Jenis Kelamin',
            'id_negara' => 'Negara',
            'id_sub_kawasan' => 'Sub Kawasan',
            'id_kawasan' => 'Kawasan',
            'alamat' => 'Alamat',
            'id_kab_kota' => 'Kab/Kota',
            'id_provinsi' => 'Provinsi',
            'no_telp' => 'No. Telepon',
            'id_jabatan' => 'Jabatan',
            'tanggal_kedatangan' => 'Tanggal Kedatangan',
            'id_area' => 'Area',
            'id_layanan' => 'Layanan',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        // Validasi PMI
        if ($request->id_area != 4 && $request->id_layanan != 6) {
            $validator = Validator::make($request->all(), [
                'id_group' => 'required|integer',
                'id_masalah' => 'required|integer',
                'foto_pmi' => 'nullable|mimes:png,jpg,jpeg|max:5000',
                'foto_paspor' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            ], [], [
                'id_group' => 'Group',
                'id_masalah' => 'Masalah',
                'foto_pmi' => 'Foto PMI',
                'foto_paspor' => 'Foto Paspor',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'message' => $validator->errors()->first(),
                ], 400);
            }
        }

        // Validasi Jenazah
        if ($request->id_area == 4 && $request->id_layanan == 6) {
            $validator = Validator::make($request->all(), [
                'id_kepulangan' => 'required|integer',
                'id_cargo' => 'required|integer',
                'foto_jenazah' => 'nullable|mimes:png,jpg,jpeg|max:5000',
                'foto_paspor' => 'nullable|mimes:png,jpg,jpeg|max:5000',
                'foto_brafaks' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            ], [], [
                'id_kepulangan' => 'Kepulangan',
                'id_cargo' => 'Cargo',
                'foto_jenazah' => 'Foto Jenazah',
                'foto_paspor' => 'Foto Paspor',
                'foto_brafaks' => 'Foto Brafaks',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'message' => $validator->errors()->first(),
                ], 400);
            }
        }

        $data = Imigran::findOrfail($id);

        $data->update([
            'brafaks' => $request->brafaks,
            'paspor' => strtoupper($request->paspor),
            'nama' => ucwords($request->nama),
            'id_jenis_kelamin' => $request->id_jenis_kelamin,
            'id_negara' => $request->id_negara,
            'id_sub_kawasan' => $request->id_sub_kawasan,
            'id_kawasan' => $request->id_kawasan,
            'alamat' => $request->alamat ? ucfirst($request->alamat) : null,
            'id_kab_kota' => $request->id_kab_kota,
            'id_provinsi' => $request->id_provinsi,
            'no_telp' => $request->no_telp ?? null,
            'id_jabatan' => $request->id_jabatan,
            'tanggal_kedatangan' => $request->tanggal_kedatangan,
            'id_area' => $request->id_area,
            'id_layanan' => $request->id_layanan,
        ]);

        // PMI
        if ($request->id_area != 4 && $request->id_layanan != 6) {

            $data->update([
                'id_kepulangan' => $data->id_kepulangan ?? null,
                'terlaksana' => $data->terlaksana,
                'id_user' =>  $request->id_group == auth()->user()->id_group ? auth()->id() : null,
            ]);

            $data->pmi()->updateOrCreate(['id_imigran' => $data->id], [
                'id_imigran' => $data->id,
                'id_group' => $request->id_group,
                'id_masalah' => $request->id_masalah,
            ]);

            if ($request->hasFile('foto_pmi')) {


                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->pmi->foto_pmi)))) {
                    File::delete(public_path($this->path . '/' . basename($data->pmi->foto_pmi)));
                }

                $foto_pmi = Str::uuid() . '.' . $request->foto_pmi->extension();

                if ($request->foto_pmi->move(public_path($this->path), $foto_pmi)) {
                    $data->pmi()->updateOrCreate(['id_imigran' => $data->id], [
                        'foto_pmi' => asset('') . $this->path . '/' . $foto_pmi
                    ]);
                };
            }

            if ($request->hasFile('foto_paspor')) {


                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->pmi->foto_paspor)))) {
                    File::delete(public_path($this->path . '/' . basename($data->pmi->foto_paspor)));
                }

                $foto_paspor = Str::uuid() . '.' . $request->foto_paspor->extension();

                if ($request->foto_paspor->move(public_path($this->path), $foto_paspor)) {
                    $data->pmi()->updateOrCreate(['id_imigran' => $data->id], [
                        'foto_paspor' => asset('') . $this->path . '/' . $foto_paspor
                    ]);
                };
            }
        }

        if ($request->id_area == 4 && $request->id_layanan == 6) {

            $data->update([
                'id_kepulangan' => $request->id_kepulangan,
                'terlaksana' => $data->terlaksana,
                'id_user' => auth()->id(),
            ]);

            $data->jenazah()->updateOrCreate(['id_imigran' => $data->id], [
                'id_imigran' => $data->id,
                'id_cargo' => $request->id_cargo,
            ]);

            if ($request->hasFile('foto_jenazah')) {


                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->jenazah->foto_jenazah)))) {
                    File::delete(public_path($this->path . '/' . basename($data->jenazah->foto_jenazah)));
                }

                $foto_jenazah = Str::uuid() . '.' . $request->foto_jenazah->extension();

                if ($request->foto_jenazah->move(public_path($this->path), $foto_jenazah)) {
                    $data->jenazah()->updateOrCreate(['id_imigran' => $data->id], [
                        'foto_jenazah' => asset('') . $this->path . '/' . $foto_jenazah
                    ]);
                };
            }

            if ($request->hasFile('foto_paspor')) {


                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->jenazah->foto_paspor)))) {
                    File::delete(public_path($this->path . '/' . basename($data->jenazah->foto_paspor)));
                }

                $foto_paspor = Str::uuid() . '.' . $request->foto_paspor->extension();

                if ($request->foto_paspor->move(public_path($this->path), $foto_paspor)) {
                    $data->jenazah()->updateOrCreate(['id_imigran' => $data->id], [
                        'foto_paspor' => asset('') . $this->path . '/' . $foto_paspor
                    ]);
                };
            }

            if ($request->hasFile('foto_brafaks')) {


                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->jenazah->foto_brafaks)))) {
                    File::delete(public_path($this->path . '/' . basename($data->jenazah->foto_brafaks)));
                }

                $foto_brafaks = Str::uuid() . '.' . $request->foto_brafaks->extension();

                if ($request->foto_brafaks->move(public_path($this->path), $foto_brafaks)) {
                    $data->jenazah()->updateOrCreate(['id_imigran' => $data->id], [
                        'foto_brafaks' => asset('') . $this->path . '/' . $foto_brafaks
                    ]);
                };
            }
        }

        return response()->json([
            'message' => 'Success',
            'data' => new ImigranResource($data->load($this->relation)),
        ], 200);
    }

    public function show($id)
    {
        $data = Imigran::findOrFail($id);

        return response()->json([
            'message' => 'Success',
            'data' => new ImigranResource($data->load($this->relation)),
        ], 200);
    }

    public function destroy($id)
    {
        $data = Imigran::findOrFail($id);

        if ($data->pmi) {
            if (File::exists(public_path($this->path . '/' . basename($data->pmi->foto_pmi)))) {
                File::delete(public_path($this->path . '/' . basename($data->pmi->foto_pmi)));
            }
            if (File::exists(public_path($this->path . '/' . basename($data->pmi->foto_paspor)))) {
                File::delete(public_path($this->path . '/' . basename($data->pmi->foto_paspor)));
            }
        }

        if ($data->jenazah) {
            if (File::exists(public_path($this->path . '/' . basename($data->jenazah->foto_jenazah)))) {
                File::delete(public_path($this->path . '/' . basename($data->jenazah->foto_jenazah)));
            }
            if (File::exists(public_path($this->path . '/' . basename($data->jenazah->foto_paspor)))) {
                File::delete(public_path($this->path . '/' . basename($data->jenazah->foto_paspor)));
            }
            if (File::exists(public_path($this->path . '/' . basename($data->jenazah->foto_brafaks)))) {
                File::delete(public_path($this->path . '/' . basename($data->jenazah->foto_brafaks)));
            }
        }

        if ($data->darat) {
            if (File::exists(public_path($this->path . '/' . basename($data->darat->foto_bast)))) {
                File::delete(public_path($this->path . '/' . basename($data->darat->foto_bast)));
            }
        }

        if ($data->udara) {
            if (File::exists(public_path($this->path . '/' . basename($data->udara->foto_boarding_pass)))) {
                File::delete(public_path($this->path . '/' . basename($data->udara->foto_boarding_pass)));
            }
        }

        if ($data->rujuk_rs_polri) {
            if (File::exists(public_path($this->path . '/' . basename($data->rujuk_rs_polri->foto_pihak_kedua)))) {
                File::delete(public_path($this->path . '/' . basename($data->rujuk_rs_polri->foto_pihak_kedua)));
            }

            if (File::exists(public_path($this->path . '/' . basename($data->rujuk_rs_polri->foto_serah_terima)))) {
                File::delete(public_path($this->path . '/' . basename($data->rujuk_rs_polri->foto_serah_terima)));
            }
        }

        if ($data->pulang_mandiri) {
            if (File::exists(public_path($this->path . '/' . basename($data->pulang_mandiri->foto_serah_terima)))) {
                File::delete(public_path($this->path . '/' . basename($data->pulang_mandiri->foto_serah_terima)));
            }
        }

        if ($data->jemput_keluarga) {
            if (File::exists(public_path($this->path . '/' . basename($data->jemput_keluarga->foto_penjemput)))) {
                File::delete(public_path($this->path . '/' . basename($data->jemput_keluarga->foto_penjemput)));
            }
            if (File::exists(public_path($this->path . '/' . basename($data->jemput_keluarga->foto_serah_terima)))) {
                File::delete(public_path($this->path . '/' . basename($data->jemput_keluarga->foto_serah_terima)));
            }
        }

        $data->delete();

        return response()->json([
            'message' => 'Success',
        ], 200);
    }

    public function antar_area(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'id_area' => 'required|integer',
        ], [], [
            'id_area' => 'Area',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = Imigran::findOrFail($id);
        $data->update([
            'id_area' => $request->id_area,
            'id_user' => auth()->id(),
        ]);

        return response()->json([
            'message' => 'Success',
            'data' => new ImigranResource($data->load($this->relation)),
        ], 200);
    }

    public function kepulangan(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'id_kepulangan' => 'required|integer',
        ], [], [
            'id_kepulangan' => 'Kepulangan',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        // Darat
        if ($request->id_kepulangan == 1) {
            $validator = Validator::make($request->all(), [
                'id_bast_darat' => 'required|integer',
                'foto_bast' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            ], [], [
                'id_bast_darat' => 'Data Fasilitas Darat',
                'foto_bast' => 'Foto BAST',
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'message' => $validator->errors()->first(),
                ], 400);
            }
        }

        // Udara
        if ($request->id_kepulangan == 2) {
            $validator = Validator::make($request->all(), [
                'id_bast_udara' => 'required|integer',
                'foto_boarding_pass' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            ], [], [
                'id_bast_udara' => 'Data Fasilitas Udara',
                'foto_boarding_pass' => 'Foto Boarding Pass',
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'message' => $validator->errors()->first(),
                ], 400);
            }
        }

        // Rujuk RS Polri
        if ($request->id_kepulangan == 3) {
            $validator = Validator::make($request->all(), [
                'id_pihak_kedua' => 'required|integer',
                'tanggal_serah_terima' => 'required|date_format:Y-m-d',
                'foto_pihak_kedua' => 'nullable|mimes:png,jpg,jpeg|max:5000',
                'foto_serah_terima' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            ], [], [
                'id_pihak_kedua' => 'Data Pihak Kedua',
                'tanggal_serah_terima' => 'Tanggal Serah Terima',
                'foto_pihak_kedua' => 'Foto Pihak Kedua',
                'foto_serah_terima' => 'Foto Serah Terima',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'message' => $validator->errors()->first(),
                ], 400);
            }
        }

        // Pulang Mandiri
        if ($request->id_kepulangan == 4) {
            $validator = Validator::make($request->all(), [
                'tanggal_serah_terima' => 'required|date_format:Y-m-d',
                'foto_serah_terima' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            ], [], [
                'tanggal_serah_terima' => 'Tanggal Serah Terima',
                'foto_serah_terima' => 'Foto Serah Terima',
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'message' => $validator->errors()->first(),
                ], 400);
            }
        }

        // Jemput Keluarga
        if ($request->id_kepulangan == 5) {
            $validator = Validator::make($request->all(), [
                'nama_penjemput' => 'required|string|max:255',
                'hubungan_dengan_pmi' => 'required|string|max:255',
                'no_telp_penjemput' => 'required|string|max:255',
                'tanggal_serah_terima' => 'required|date_format:Y-m-d',
                'foto_penjemput' => 'nullable|mimes:png,jpg,jpeg|max:5000',
                'foto_serah_terima' => 'nullable|mimes:png,jpg,jpeg|max:5000',
            ], [], [
                'nama_penjemput' => 'Nama Penjemput',
                'hubungan_dengan_pmi' => 'Hubungan dengan PMI',
                'no_telp_penjemput' => 'No. Telepon Penjemput',
                'tanggal_serah_terima' => 'Tanggal Serah Terima',
                'foto_penjemput' => 'Foto Penjemput',
                'foto_serah_terima' => 'Foto Serah Terima',
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'message' => $validator->errors()->first(),
                ], 400);
            }
        }

        // Jemput Pihak Lain
        if ($request->id_kepulangan == 6) {
            $validator = Validator::make($request->all(), [
                'id_bast_pihak_lain' => 'required|integer',
            ], [], [
                'id_bast_pihak_lain' => 'Data Pihak Lain/Pihak Kedua',
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'message' => $validator->errors()->first(),
                ], 400);
            }
        }

        $data = Imigran::findOrFail($id);
        $data->update([
            'id_kepulangan' => $request->id_kepulangan,
            'id_user' => auth()->id(),
        ]);

        // Darat
        if ($request->id_kepulangan == 1) {
            $data->darat()->updateOrCreate(['id_imigran' => $id], [
                'id_kepulangan' => $data->id_kepulangan,
                'id_imigran' => $id,
                'id_bast_darat' => $request->id_bast_darat,
            ]);

            if ($request->hasFile('foto_bast')) {

                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->pmi->foto_bast)))) {
                    File::delete(public_path($this->path . '/' . basename($data->pmi->foto_bast)));
                }

                $foto_bast = Str::uuid() . '.' . $request->foto_bast->extension();

                if ($request->foto_bast->move(public_path($this->path), $foto_bast)) {
                    $data->darat()->updateOrCreate(['id_imigran' => $id], [
                        'foto_bast' => asset('') . $this->path . '/' . $foto_bast
                    ]);
                };
            }
        }

        // Udara
        if ($request->id_kepulangan == 2) {
            $data->udara()->updateOrCreate(['id_imigran' => $id], [
                'id_kepulangan' => $data->id_kepulangan,
                'id_imigran' => $id,
                'id_bast_udara' => $request->id_bast_udara,
            ]);

            if ($request->hasFile('foto_boarding_pass')) {

                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->pmi->foto_boarding_pass)))) {
                    File::delete(public_path($this->path . '/' . basename($data->pmi->foto_boarding_pass)));
                }

                $foto_boarding_pass = Str::uuid() . '.' . $request->foto_boarding_pass->extension();

                if ($request->foto_boarding_pass->move(public_path($this->path), $foto_boarding_pass)) {
                    $data->udara()->updateOrCreate(['id_imigran' => $id], [
                        'foto_boarding_pass' => asset('') . $this->path . '/' . $foto_boarding_pass
                    ]);
                };
            }
        }

        // Rujuk RS Polri
        if ($request->id_kepulangan == 3) {
            $data->rujuk_rs_polri()->updateOrCreate(['id_imigran' => $id], [
                'id_kepulangan' => $data->id_kepulangan,
                'id_imigran' => $id,
                'id_pihak_kedua' => $request->id_pihak_kedua,
                'tanggal_serah_terima' => $request->tanggal_serah_terima,
                'id_user' => auth()->id(),
            ]);

            if ($request->hasFile('foto_pihak_kedua')) {

                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->rujuk_rs_polri->foto_pihak_kedua)))) {
                    File::delete(public_path($this->path . '/' . basename($data->rujuk_rs_polri->foto_pihak_kedua)));
                }

                $foto_pihak_kedua = Str::uuid() . '.' . $request->foto_pihak_kedua->extension();

                if ($request->foto_pihak_kedua->move(public_path($this->path), $foto_pihak_kedua)) {
                    $data->rujuk_rs_polri->update([
                        'foto_pihak_kedua' => asset('') . $this->path . '/' . $foto_pihak_kedua,
                    ]);
                };
            }

            if ($request->hasFile('foto_serah_terima')) {

                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->rujuk_rs_polri->foto_serah_terima)))) {
                    File::delete(public_path($this->path . '/' . basename($data->rujuk_rs_polri->foto_serah_terima)));
                }

                $foto_serah_terima = Str::uuid() . '.' . $request->foto_serah_terima->extension();

                if ($request->foto_serah_terima->move(public_path($this->path), $foto_serah_terima)) {
                    $data->rujuk_rs_polri->update([
                        'foto_serah_terima' => asset('') . $this->path . '/' . $foto_serah_terima,
                    ]);
                };
            }
        }

        // Pulang Mandiri
        if ($request->id_kepulangan == 4) {
            $data->pulang_mandiri()->updateOrCreate(['id_imigran' => $id], [
                'id_kepulangan' => $data->id_kepulangan,
                'id_imigran' => $id,
                'tanggal_serah_terima' => $request->tanggal_serah_terima,
                'id_user' => auth()->id(),
            ]);

            if ($request->hasFile('foto_serah_terima')) {

                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->pulang_mandiri->foto_serah_terima)))) {
                    File::delete(public_path($this->path . '/' . basename($data->pulang_mandiri->foto_serah_terima)));
                }

                $foto_serah_terima = Str::uuid() . '.' . $request->foto_serah_terima->extension();

                if ($request->foto_serah_terima->move(public_path($this->path), $foto_serah_terima)) {
                    $data->pulang_mandiri->update([
                        'foto_serah_terima' => asset('') . $this->path . '/' . $foto_serah_terima,
                    ]);
                };
            }
        }

        // Jemput Keluarga
        if ($request->id_kepulangan == 5) {
            $data->jemput_keluarga()->updateOrCreate(['id_imigran' => $id], [
                'id_kepulangan' => $data->id_kepulangan,
                'id_imigran' => $id,
                'nama_penjemput' => $request->nama_penjemput,
                'hubungan_dengan_pmi' => $request->hubungan_dengan_pmi,
                'no_telp_penjemput' => $request->no_telp_penjemput,
                'tanggal_serah_terima' => $request->tanggal_serah_terima,
                'id_user' => auth()->id(),
            ]);

            if ($request->hasFile('foto_penjemput')) {

                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->jemput_keluarga->foto_penjemput)))) {
                    File::delete(public_path($this->path . '/' . basename($data->jemput_keluarga->foto_penjemput)));
                }

                $foto_penjemput = Str::uuid() . '.' . $request->foto_penjemput->extension();

                if ($request->foto_penjemput->move(public_path($this->path), $foto_penjemput)) {
                    $data->jemput_keluarga->update([
                        'foto_penjemput' => asset('') . $this->path . '/' . $foto_penjemput,
                    ]);
                };
            }

            if ($request->hasFile('foto_serah_terima')) {

                if (!File::isDirectory(public_path($this->path))) {
                    File::makeDirectory(public_path($this->path), 0777, true, true);
                }

                if (File::exists(public_path($this->path . '/' . basename($data->jemput_keluarga->foto_serah_terima)))) {
                    File::delete(public_path($this->path . '/' . basename($data->jemput_keluarga->foto_serah_terima)));
                }

                $foto_serah_terima = Str::uuid() . '.' . $request->foto_serah_terima->extension();

                if ($request->foto_serah_terima->move(public_path($this->path), $foto_serah_terima)) {
                    $data->jemput_keluarga->update([
                        'foto_serah_terima' => asset('') . $this->path . '/' . $foto_serah_terima,
                    ]);
                };
            }
        }

        // Jemput Pihak Lain
        if ($request->id_kepulangan == 6) {
            $data->jemput_pihak_lain()->updateOrCreate(['id_imigran' => $id], [
                'id_kepulangan' => $data->id_kepulangan,
                'id_imigran' => $id,
                'id_bast_pihak_lain' => $request->id_bast_pihak_lain,
            ]);
        }

        return response()->json([
            'message' => 'Success',
            'data' => new ImigranResource($data->load($this->relation)),
        ], 200);
    }

    public function terlaksana(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'terlaksana' => 'required|boolean',
        ], [], [
            'terlaksana' => 'Status Terlaksana',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = Imigran::findOrFail($id);
        $data->update([
            'terlaksana' => $request->terlaksana,
            'id_user' => auth()->id(),
        ]);

        return response()->json([
            'message' => 'Success',
            'data' => new ImigranResource($data->load($this->relation)),
        ], 200);
    }
}
