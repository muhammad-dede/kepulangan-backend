<?php

use App\Models\User;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/petugas/{id}', function ($id) {
    $user = User::findOrFail($id);
    return view('petugas', compact('user'));
});
