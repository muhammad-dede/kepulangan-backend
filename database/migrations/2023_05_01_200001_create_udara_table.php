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
        Schema::create('udara', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_kepulangan')->nullable()->index();
            $table->unsignedBigInteger('id_imigran')->nullable()->index();
            $table->unsignedBigInteger('id_bast_udara')->nullable()->index();
            $table->string('foto_boarding_pass')->nullable();

            $table->foreign('id_kepulangan')->references('id')->on('kepulangan')->onDelete('set null')->onUpdate('set null');
            $table->foreign('id_imigran')->references('id')->on('imigran')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('id_bast_udara')->references('id')->on('bast_udara')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('udara');
    }
};
