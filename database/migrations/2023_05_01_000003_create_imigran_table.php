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
        Schema::create('imigran', function (Blueprint $table) {
            $table->id();
            $table->string('brafaks')->nullable();
            $table->string('paspor')->nullable();
            $table->string('nama')->nullable();
            $table->unsignedBigInteger('id_jenis_kelamin')->nullable()->index();
            $table->unsignedBigInteger('id_negara')->nullable()->index();
            $table->unsignedBigInteger('id_sub_kawasan')->nullable()->index();
            $table->unsignedBigInteger('id_kawasan')->nullable()->index();
            $table->text('alamat')->nullable();
            $table->unsignedBigInteger('id_kab_kota')->nullable()->index();
            $table->unsignedBigInteger('id_provinsi')->nullable()->index();
            $table->string('no_telp')->nullable();
            $table->unsignedBigInteger('id_jabatan')->nullable()->index();
            // pelayanan
            $table->date('tanggal_kedatangan')->nullable();
            $table->unsignedBigInteger('id_area')->nullable()->index();
            $table->unsignedBigInteger('id_layanan')->nullable()->index();
            $table->unsignedBigInteger('id_kepulangan')->nullable()->index();
            $table->boolean('terlaksana')->default(0);
            $table->unsignedBigInteger('id_user')->nullable()->index();

            $table->foreign('id_jenis_kelamin')->references('id')->on('jenis_kelamin')->onDelete('set null')->onUpdate('set null');
            $table->foreign('id_negara')->references('id')->on('negara')->onDelete('set null')->onUpdate('set null');
            $table->foreign('id_sub_kawasan')->references('id')->on('sub_kawasan')->onDelete('set null')->onUpdate('set null');
            $table->foreign('id_kawasan')->references('id')->on('kawasan')->onDelete('set null')->onUpdate('set null');
            $table->foreign('id_kab_kota')->references('id')->on('kab_kota')->onDelete('set null')->onUpdate('set null');
            $table->foreign('id_provinsi')->references('id')->on('provinsi')->onDelete('set null')->onUpdate('set null');
            $table->foreign('id_jabatan')->references('id')->on('jabatan')->onDelete('set null')->onUpdate('set null');
            // pelayanan
            $table->foreign('id_area')->references('id')->on('area')->onDelete('set null')->onUpdate('set null');
            $table->foreign('id_layanan')->references('id')->on('layanan')->onDelete('set null')->onUpdate('set null');
            $table->foreign('id_kepulangan')->references('id')->on('kepulangan')->onDelete('set null')->onUpdate('set null');
            $table->foreign('id_user')->references('id')->on('user')->onDelete('set null')->onUpdate('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('imigran');
    }
};
