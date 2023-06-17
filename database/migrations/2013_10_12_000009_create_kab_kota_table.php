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
        Schema::create('kab_kota', function (Blueprint $table) {
            $table->unsignedBigInteger('id')->primary();
            $table->string('nama')->nullable();
            $table->unsignedBigInteger('id_provinsi')->nullable()->index();

            $table->foreign('id_provinsi')->references('id')->on('provinsi')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('kab_kota');
    }
};
