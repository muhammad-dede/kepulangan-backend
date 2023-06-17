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
        Schema::create('bast_darat', function (Blueprint $table) {
            $table->id();
            $table->string('purchase_order')->nullable()->unique();
            $table->unsignedBigInteger("id_penyedia_jasa")->nullable()->index();
            $table->unsignedBigInteger("id_alamat")->nullable()->index()->comment('Lokasi Jemput');
            $table->integer('durasi_pengerjaan')->nullable();
            $table->date('tanggal_serah_terima')->nullable()->comment('Tanggal Jemput');
            $table->string('foto_penyedia_jasa')->nullable();
            $table->string('foto_serah_terima')->nullable();
            $table->boolean('terlaksana')->default(0);
            $table->unsignedBigInteger('id_user')->nullable()->index();

            $table->foreign('id_penyedia_jasa')->references('id')->on('penyedia_jasa')->onDelete('set null');
            $table->foreign('id_alamat')->references('id')->on('alamat')->onDelete('set null');
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
        Schema::dropIfExists('bast_darat');
    }
};
