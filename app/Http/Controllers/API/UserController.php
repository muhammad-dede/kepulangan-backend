<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function index()
    {
        $data = User::where('id', '!=', auth()->id())->orderBy('created_at', 'desc')->get();
        return response()->json([
            'message' => 'Success',
            'data' => UserResource::collection($data),
        ], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nama' => 'required|string|max:255',
            'no_identitas' => 'required|string|max:255',
            'jabatan' => 'required|string|max:255',
            'id_group' => 'required|integer',
            'telepon' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|max:255',
            'email' => 'required|email|unique:user,email',
            'password' => 'required|string|min:8|confirmed',
            'role' => 'required|string|max:255',
        ], [], [
            'nama' => 'Nama',
            'no_identitas' => 'No. Identitas',
            'jabatan' => 'Jabatan',
            'id_group' => 'Group',
            'telepon' => 'Telepon',
            'email' => 'Email',
            'password' => 'Password',
            'role' => 'Role',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = User::create([
            'nama' => ucfirst($request->nama),
            'no_identitas' => strtoupper($request->no_identitas),
            'jabatan' => ucfirst($request->jabatan),
            'id_group' => $request->id_group,
            'telepon' => $request->telepon,
            'email' => strtolower($request->email),
            'password' => bcrypt($request->password),
            'avatar' => 'https://ui-avatars.com/api/?name=' . strtolower(str_replace(' ', '-', $request->nama)),
        ]);

        $data->update([
            'qr_code' => asset('') . 'petugas/' . $data->id,
        ]);

        $data->syncRoles($request->role);

        return response()->json([
            'message' => 'Success',
            'data' => new UserResource($data),
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'nama' => 'required|string|max:255',
            'no_identitas' => 'required|string|max:255',
            'jabatan' => 'required|string|max:255',
            'id_group' => 'required|integer',
            'telepon' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|max:255',
            'email' => 'required|email|unique:user,email,' . $id . ',id',
            'password' => 'nullable|string|min:8|confirmed',
            'role' => 'required|string|max:255',
        ], [], [
            'nama' => 'Nama',
            'no_identitas' => 'No. Identitas',
            'jabatan' => 'Jabatan',
            'id_group' => 'Group',
            'telepon' => 'Telepon',
            'email' => 'Email',
            'password' => 'Password',
            'role' => 'Role',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }
        $data = User::findOrFail($id);

        if (strtolower($data->nama) != strtolower($request->nama)) {
            if (!File::exists(public_path('uploads/' . basename($data->avatar)))) {
                $data->update([
                    'avatar' => 'https://ui-avatars.com/api/?name=' . strtolower(str_replace(' ', '-', $request->nama)),
                ]);
            }
        }

        $data->update([
            'nama' => ucfirst($request->nama),
            'no_identitas' => strtoupper($request->no_identitas),
            'jabatan' => ucfirst($request->jabatan),
            'id_group' => $request->id_group,
            'telepon' => $request->telepon,
            'email' => strtolower($request->email),
            'password' => $request->password ? bcrypt($request->password) : $data->password,
        ]);

        $data->update([
            'qr_code' => asset('') . 'petugas/' . $data->id,
        ]);

        $data->syncRoles($request->role);

        return response()->json([
            'message' => 'Success',
            'data' => new UserResource($data),
        ], 200);
    }

    public function destroy($id)
    {
        $data = User::findOrFail($id);

        if (File::exists(public_path('uploads/' . basename($data->avatar)))) {
            File::delete(public_path('uploads/' . basename($data->avatar)));
        }

        $data->tokens()->delete();
        $data->delete();

        return response()->json([
            'message' => 'Success',
        ], 200);
    }
}
