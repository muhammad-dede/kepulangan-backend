<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:user,email',
            'password' => 'required|string|min:8',
        ], [], [
            'email' => 'Email',
            'password' => 'Password',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = User::where('email', $request->email)->first();

        if (!$data) {
            return response()->json([
                'message' => 'Email tidak terdaftar',
            ], 400);
        } else {
            if (!Hash::check($request->password, $data->password)) {
                return response()->json([
                    'message' => 'Password yang anda masukkan salah',
                ], 400);
            } else {
                $device = $request->device ? $request->device : 'Access Token';
                $token = $data->createToken($device)->plainTextToken;
                return response()->json([
                    'message' => "Success",
                    'token' => $token,
                    'data' => new UserResource($data),
                ], 200);
            }
        }
    }

    public function me()
    {
        $data = User::findOrFail(auth()->id());
        return response()->json([
            'message' => 'Success',
            'data' => new UserResource($data),
        ], 200);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'message' => 'Success',
        ], 200);
    }

    public function update_profil(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nama' => 'required|string|max:255',
            'no_identitas' => 'required|string|max:255|unique:user,no_identitas,' . auth()->id() . ',id',
            'jabatan' => 'required|string|max:255',
            'id_group' => 'required|integer',
            'telepon' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|max:255',
            'email' => 'required|email|unique:user,email,' . auth()->id() . ',id',
            'avatar' => 'nullable|mimes:png,jpg,jpeg|max:5000',
        ], [], [
            'nama' => 'Nama',
            'no_identitas' => 'No. Identitas',
            'jabatan' => 'Jabatan',
            'id_group' => 'Group',
            'telepon' => 'Telepon',
            'email' => 'Email',
            'avatar' => 'Avatar',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = User::findOrFail(auth()->id());

        $data->update([
            'nama' => ucfirst($request->nama),
            'no_identitas' => strtoupper($request->no_identitas),
            'jabatan' => ucfirst($request->jabatan),
            'id_group' => $request->id_group,
            'telepon' => strtoupper($request->telepon),
            'email' => strtolower($request->email),
        ]);

        if ($request->hasFile('avatar')) {

            $path = 'uploads';

            if (!File::isDirectory(public_path($path))) {
                File::makeDirectory(public_path($path), 0777, true, true);
            }

            if (File::exists(public_path($path . '/' . basename($data->avatar)))) {
                File::delete(public_path($path . '/' . basename($data->avatar)));
            }

            $avatar = Str::uuid() . '.' . $request->avatar->extension();
            if ($request->avatar->move(public_path($path), $avatar)) {
                $data->update([
                    'avatar' => asset('') . $path . '/' . $avatar
                ]);
            };
        }

        return response()->json([
            'message' => 'Success',
            'data' => new UserResource($data),
        ], 200);
    }

    public function update_password(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'password_current' => 'required|string',
            'password' => 'required|string|min:8|confirmed',
        ], [], [
            'password_current' => 'Password saat ini',
            'password' => 'Password',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
            ], 400);
        }

        $data = User::findOrFail(auth()->id());

        if (!Hash::check($request->password_current, $data->password)) {
            return response()->json([
                'message' => 'Password lama yang anda masukkan salah',
            ], 400);
        }

        $data->update([
            'password' => bcrypt($request->password),
        ]);

        return response()->json([
            'message' => 'Success',
            'data' => new UserResource($data),
        ], 200);
    }
}
