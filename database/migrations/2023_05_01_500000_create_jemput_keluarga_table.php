<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jemput_keluarga', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_kepulangan')->nullable()->index();
            $table->unsignedBigInteger('id_imigran')->nullable()->index();
            $table->string('nama_penjemput')->nullable();
            $table->string('hubungan_dengan_pmi')->nullable();
            $table->string('no_telp_penjemput')->nullable();
            $table->date('tanggal_serah_terima')->nullable();
            $table->string('foto_penjemput')->nullable();
            $table->string('foto_serah_terima')->nullable();
            $table->unsignedBigInteger('id_user')->nullable()->index();

            $table->foreign('id_kepulangan')->references('id')->on('kepulangan')->onDelete('set null');
            $table->foreign('id_imigran')->references('id')->on('imigran')->onDelete('cascade')->onUpdate("cascade");
            $table->foreign('id_user')->references('id')->on('user')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jemput_keluarga');
    }
};
