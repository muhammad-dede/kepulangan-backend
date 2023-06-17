<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\PihakKedua;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PihakKeduaController extends Controller
{
    public function index(Request $request)
    {
        $data = PihakKedua::orderBy('id', 'desc')->get();
        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nama' => 'required|string|max:255',
            'no_identitas' => 'required|string|max:255|unique:pihak_kedua,no_identitas',
            'jabatan' => 'required|string|max:255',
            'instansi' => 'required|string|max:255',
            'alamat' => 'required|string|max:255',
            'no_telp' => 'required|string|max:255',
        ], [], [
            'nama' => 'Nama',
            'no_identitas' => 'No. Identitas',
            'jabatan' => 'Jabatan',
            'instansi' => 'Instansi',
            'alamat' => 'Alamat',
            'no_telp' => 'No.Telp',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = PihakKedua::create([
            'nama' => ucwords($request->nama),
            'no_identitas' => $request->no_identitas,
            'jabatan' => ucfirst($request->jabatan),
            'instansi' => ucwords($request->instansi),
            'alamat' => ucfirst($request->alamat),
            'no_telp' => $request->no_telp,
        ]);

        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'nama' => 'required|string|max:255',
            'no_identitas' => 'required|string|max:255|unique:pihak_kedua,no_identitas,' . $id . ',id',
            'jabatan' => 'required|string|max:255',
            'instansi' => 'required|string|max:255',
            'alamat' => 'required|string|max:255',
            'no_telp' => 'required|string|max:255',
        ], [], [
            'nama' => 'Nama',
            'no_identitas' => 'No. Identitas',
            'jabatan' => 'Jabatan',
            'instansi' => 'Instansi',
            'alamat' => 'Alamat',
            'no_telp' => 'No.Telp',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = PihakKedua::findOrFail($id);

        $data->update([
            'nama' => ucwords($request->nama),
            'no_identitas' => $request->no_identitas,
            'jabatan' => ucfirst($request->jabatan),
            'instansi' => ucwords($request->instansi),
            'alamat' => ucfirst($request->alamat),
            'no_telp' => $request->no_telp,
        ]);

        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    public function destroy($id)
    {
        $data = PihakKedua::findOrFail($id);
        $data->delete();

        return response()->json([
            'message' => 'Success',
        ], 200);
    }
}
