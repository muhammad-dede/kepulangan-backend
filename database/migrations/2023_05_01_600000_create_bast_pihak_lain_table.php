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
        Schema::create('bast_pihak_lain', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_pihak_kedua')->nullable()->index();
            $table->date('tanggal_serah_terima')->nullable();
            $table->string('foto_pihak_kedua')->nullable();
            $table->string('foto_serah_terima')->nullable();
            $table->boolean('terlaksana')->default(0);
            $table->unsignedBigInteger('id_user')->nullable()->index();

            $table->foreign('id_pihak_kedua')->references('id')->on('pihak_kedua')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::dropIfExists('bast_pihak_lain');
    }
};
