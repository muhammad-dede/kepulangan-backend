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
        Schema::create('jemput_pihak_lain', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_kepulangan')->nullable()->index();
            $table->unsignedBigInteger('id_imigran')->nullable()->index();
            $table->unsignedBigInteger('id_bast_pihak_lain')->nullable()->index();

            $table->foreign('id_kepulangan')->references('id')->on('kepulangan')->onDelete('set null')->onUpdate('set null');
            $table->foreign('id_imigran')->references('id')->on('imigran')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('id_bast_pihak_lain')->references('id')->on('bast_pihak_lain')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jemput_pihak_lain');
    }
};
