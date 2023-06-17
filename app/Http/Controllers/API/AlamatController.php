<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Alamat;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AlamatController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Alamat::orderBy('utama', 'desc')->get();
        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'judul' => 'required|string|max:255',
            'lokasi' => 'required|string',
            'utama' => 'required|boolean',
        ], [], [
            'judul' => 'Judul',
            'lokasi' => 'Lokasi',
            'utama' => 'Utama',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = Alamat::create([
            'judul' => ucwords($request->judul),
            'lokasi' => ucwords($request->lokasi),
        ]);

        if ($request->utama == 1) {
            Alamat::where('utama', 1)->update([
                'utama' => 0,
            ]);
            $data->update([
                'utama' => $request->utama,
            ]);
        } else {
            $data->update([
                'utama' => $request->utama,
            ]);
        }

        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'judul' => 'required|string|max:255',
            'lokasi' => 'required|string',
            'utama' => 'required|boolean',
        ], [], [
            'judul' => 'Judul',
            'lokasi' => 'Lokasi',
            'utama' => 'Utama',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = Alamat::findOrFail($id);

        $data->update([
            'judul' => ucwords($request->judul),
            'lokasi' => ucwords($request->lokasi),
        ]);

        if ($request->utama == 1) {
            Alamat::where('utama', 1)->update([
                'utama' => 0,
            ]);
            $data->update([
                'utama' => $request->utama,
            ]);
        } else {
            $data->update([
                'utama' => $request->utama,
            ]);
            $alamat = Alamat::where('utama', 1)->first();
            if (!$alamat) {
                Alamat::orderBy('id', 'asc')->first()->update([
                    'utama' => 1,
                ]);
            }
        }

        return response()->json([
            'message' => 'Success',
            'data' => $data,
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = Alamat::findOrFail($id);
        $data->delete();

        $check = Alamat::count();
        if ($check > 0) {
            $alamat = Alamat::where('utama', 1)->first();
            if (!$alamat) {
                Alamat::orderBy('id', 'asc')->first()->update([
                    'utama' => 1,
                ]);
            }
        }

        return response()->json([
            'message' => 'Success',
        ], 200);
    }
}
