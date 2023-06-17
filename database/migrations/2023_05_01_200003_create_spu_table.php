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
        Schema::create('spu', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_bast_udara')->index()->nullable();
            $table->string('no_surat')->nullable();
            $table->date('tanggal_surat')->nullable();
            $table->unsignedBigInteger('id_provinsi')->index()->nullable();
            $table->string('no_pesawat')->nullable();
            $table->string('jam_pesawat')->nullable();
            $table->date('tanggal_pesawat')->nullable();

            $table->foreign('id_bast_udara')->references('id')->on('bast_udara')->onDelete('cascade');
            $table->foreign('id_provinsi')->references('id')->on('provinsi')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('spu');
    }
};
