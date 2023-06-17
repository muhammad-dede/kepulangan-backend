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
        Schema::create('rujuk_rs_polri', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_kepulangan')->nullable()->index();
            $table->unsignedBigInteger('id_imigran')->nullable()->index();
            $table->unsignedBigInteger('id_pihak_kedua')->nullable()->index();
            $table->date('tanggal_serah_terima')->nullable();
            $table->string('foto_pihak_kedua')->nullable();
            $table->string('foto_serah_terima')->nullable();
            $table->unsignedBigInteger('id_user')->nullable()->index();

            $table->foreign('id_kepulangan')->references('id')->on('kepulangan')->onDelete('set null')->onUpdate("set null");
            $table->foreign('id_imigran')->references('id')->on('imigran')->onDelete('cascade')->onUpdate("cascade");
            $table->foreign('id_pihak_kedua')->references('id')->on('pihak_kedua')->onDelete('set null')->onUpdate("set null");
            $table->foreign('id_user')->references('id')->on('user')->onDelete('set null')->onUpdate("set null");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('rujuk_rs_polri');
    }
};
