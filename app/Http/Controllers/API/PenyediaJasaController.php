<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\PenyediaJasa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PenyediaJasaController extends Controller
{
    public function index()
    {
        $data = PenyediaJasa::orderBy('id', 'desc')->get();
        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nama_perusahaan' => 'required|string|max:255',
            'alamat' => 'nullable|string',
            'email' => 'nullable|email|max:255',
            'no_telp' => 'nullable|string|max:255',
            'up' => 'nullable|string|max:255',
        ], [], [
            'nama_perusahaan' => 'Nama Perusahaan',
            'alamat' => 'Alamat',
            'email' => 'Email',
            'no_telp' => 'No. Telepon',
            'up' => 'Up',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = PenyediaJasa::create([
            'nama_perusahaan' => ucwords($request->nama_perusahaan),
            'alamat' => $request->alamat ? ucwords($request->alamat) : null,
            'email' => $request->email ? strtolower($request->email) : null,
            'no_telp' => $request->no_telp ? strtoupper($request->no_telp) : null,
            'up' => $request->up ? ucwords($request->up) : null,
        ]);

        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'nama_perusahaan' => 'required|string|max:255',
            'alamat' => 'nullable|string',
            'email' => 'nullable|email|max:255',
            'no_telp' => 'nullable|string|max:255',
            'up' => 'nullable|string|max:255',
        ], [], [
            'nama_perusahaan' => 'Nama Perusahaan',
            'alamat' => 'Alamat',
            'email' => 'Email',
            'no_telp' => 'No. Telepon',
            'up' => 'Up',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = PenyediaJasa::findOrFail($id);

        $data->update([
            'nama_perusahaan' => ucwords($request->nama_perusahaan),
            'alamat' => $request->alamat ? ucwords($request->alamat) : null,
            'email' => $request->email ? strtolower($request->email) : null,
            'no_telp' => $request->no_telp ? strtoupper($request->no_telp) : null,
            'up' => $request->up ? ucwords($request->up) : null,
        ]);

        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    public function destroy($id)
    {
        $data = PenyediaJasa::findOrFail($id);

        $data->delete();

        return response()->json([
            'message' => 'Success',
        ], 200);
    }
}
