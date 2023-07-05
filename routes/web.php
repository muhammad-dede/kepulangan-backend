<?php

use App\Models\Imigran;
use App\Models\User;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return "BP3MI";
});

Route::get('/petugas/{id}', function ($id) {
    $user = User::findOrFail($id);
    return view('petugas', compact('user'));
});
Route::get('/imigran/{id}', function ($id) {
    $imigran = Imigran::findOrFail($id);
    return view('imigran', compact('imigran'));
});
