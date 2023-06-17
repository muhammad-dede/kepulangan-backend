<?php

use App\Http\Controllers\API\AlamatController;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\BastDaratController;
use App\Http\Controllers\API\BastMakanController;
use App\Http\Controllers\API\BastPihakLainController;
use App\Http\Controllers\API\BastUdaraController;
use App\Http\Controllers\API\DashboardController;
use App\Http\Controllers\API\ExcelController;
use App\Http\Controllers\API\ImigranController;
use App\Http\Controllers\API\PdfController;
use App\Http\Controllers\API\PenyediaJasaController;
use App\Http\Controllers\API\PihakKeduaController;
use App\Http\Controllers\API\ReferensiController;
use App\Http\Controllers\API\UserController;
use Illuminate\Support\Facades\Route;
use SebastianBergmann\CodeCoverage\Report\Html\Dashboard;

Route::controller(AuthController::class)->group(function () {
    Route::post('auth/login', 'login');

    Route::middleware('auth:sanctum')->group(function () {
        Route::get('auth/me', 'me');
        Route::delete('auth/logout', 'logout');
        Route::post('auth/update/profil', 'update_profil');
        Route::post('auth/update/password', 'update_password');
    });
});

Route::controller(DashboardController::class)->middleware('auth:sanctum')->group(function () {
    Route::get('dashboard/total', 'total');
    Route::get('dashboard/chart-jenis-kelamin/{id_layanan}', 'chart_jenis_kelamin');
    Route::get('dashboard/chart-masalah/{id_layanan}', 'chart_masalah');
    Route::get('dashboard/chart-negara/{id_layanan}', 'chart_negara');
    Route::get('dashboard/chart-provinsi/{id_layanan}', 'chart_provinsi');
    Route::get('dashboard/chart-kab-kota/{id_layanan}', 'chart_kab_kota');
});

Route::controller(ReferensiController::class)->middleware('auth:sanctum')->group(function () {
    Route::get('referensi/area', 'area');
    Route::get('referensi/group', 'group');
    Route::get('referensi/jenis-kelamin', 'jenis_kelamin');
    Route::get('referensi/negara', 'negara');
    Route::get('referensi/provinsi', 'provinsi');
    Route::get('referensi/kab-kota', 'kab_kota');
    Route::get('referensi/jabatan', 'jabatan');
});

Route::controller(AlamatController::class)->middleware('auth:sanctum')->group(function () {
    Route::get('alamat', 'index');
    Route::post('alamat/store', 'store');
    Route::post('alamat/update/{id}', 'update');
    Route::delete('alamat/destroy/{id}', 'destroy');
});

Route::controller(PihakKeduaController::class)->middleware('auth:sanctum')->group(function () {
    Route::get('pihak-kedua', 'index');
    Route::post('pihak-kedua/store', 'store');
    Route::post('pihak-kedua/update/{id}', 'update');
    Route::delete('pihak-kedua/destroy/{id}', 'destroy');
});

Route::controller(PenyediaJasaController::class)->middleware('auth:sanctum')->group(function () {
    Route::get('penyedia-jasa', 'index');
    Route::post('penyedia-jasa/store', 'store');
    Route::post('penyedia-jasa/update/{id}', 'update');
    Route::delete('penyedia-jasa/destroy/{id}', 'destroy');
});

Route::controller(UserController::class)->middleware('auth:sanctum')->group(function () {
    Route::get('user', 'index');
    Route::post('user/store', 'store');
    Route::post('user/update/{id}', 'update');
    Route::delete('user/destroy/{id}', 'destroy');
});

Route::controller(ImigranController::class)->middleware('auth:sanctum')->group(function () {
    Route::get('imigran', 'index');
    Route::post('imigran/store', 'store');
    Route::post('imigran/update/{id}', 'update');
    Route::get('imigran/show/{id}', 'show');
    Route::delete('imigran/destroy/{id}', 'destroy');
    Route::post('imigran/antar-area/{id}', 'antar_area');
    Route::post('imigran/kepulangan/{id}', 'kepulangan');
    Route::post('imigran/terlaksana/{id}', 'terlaksana');
});

Route::controller(BastDaratController::class)->middleware('auth:sanctum')->group(function () {
    Route::get('bast-darat', 'index');
    Route::post('bast-darat/store', 'store');
    Route::post('bast-darat/update/{id}', 'update');
    Route::delete('bast-darat/destroy/{id}', 'destroy');
    Route::post('bast-darat/terlaksana/{id}', 'terlaksana');
    Route::get('bast-darat/purchase-order', 'purchase_order');
});

Route::controller(BastUdaraController::class)->middleware('auth:sanctum')->group(function () {
    Route::get('bast-udara', 'index');
    Route::post('bast-udara/store', 'store');
    Route::post('bast-udara/update/{id}', 'update');
    Route::delete('bast-udara/destroy/{id}', 'destroy');
    Route::post('bast-udara/terlaksana/{id}', 'terlaksana');
    Route::get('bast-udara/purchase-order', 'purchase_order');
    Route::post('bast-udara/spu/{id}', 'spu');
});

Route::controller(BastPihakLainController::class)->middleware('auth:sanctum')->group(function () {
    Route::get('bast-pihak-lain', 'index');
    Route::post('bast-pihak-lain/store', 'store');
    Route::post('bast-pihak-lain/update/{id}', 'update');
    Route::delete('bast-pihak-lain/destroy/{id}', 'destroy');
    Route::post('bast-pihak-lain/terlaksana/{id}', 'terlaksana');
});

Route::controller(BastMakanController::class)->middleware('auth:sanctum')->group(function () {
    Route::get('bast-makan', 'index');
    Route::post('bast-makan/store', 'store');
    Route::post('bast-makan/update/{id}', 'update');
    Route::delete('bast-makan/destroy/{id}', 'destroy');
    Route::post('bast-makan/terlaksana/{id}', 'terlaksana');
});

Route::controller(PdfController::class)->middleware('auth:sanctum')->group(function () {
    Route::get('pdf/imigran/{id_imigran}', 'imigran');
    Route::get('pdf/laporan-imigran', 'laporan_imigran');
    Route::get('pdf/bast-darat/{id_bast_darat}', 'bast_darat');
    Route::get('pdf/bast-udara/{id_bast_udara}', 'bast_udara');
    Route::get('pdf/spu/{id_spu}', 'spu');
    Route::get('pdf/rujuk-rs-polri/{id_rujuk_rs_polri}', 'rujuk_rs_polri');
    Route::get('pdf/pulang-mandiri/{id_pulang_mandiri}', 'pulang_mandiri');
    Route::get('pdf/jemput-keluarga/{id_jemput_keluarga}', 'jemput_keluarga');
    Route::get('pdf/bast-pihak-lain/{id_bast_pihak_lain}', 'bast_pihak_lain');
    Route::get('pdf/bast-makan/{id_bast_makan}', 'bast_makan');
});

Route::controller(ExcelController::class)->group(function () {
    Route::get('excel/laporan-bulanan', 'laporan_bulanan');
});
