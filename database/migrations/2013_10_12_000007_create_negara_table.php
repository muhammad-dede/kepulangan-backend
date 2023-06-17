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
        Schema::create('negara', function (Blueprint $table) {
            $table->unsignedBigInteger('id')->primary();
            $table->string('nama')->nullable();
            $table->string('nama_lengkap')->nullable();
            $table->unsignedBigInteger('id_sub_kawasan')->nullable()->index();

            $table->foreign('id_sub_kawasan')->references('id')->on('sub_kawasan')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('negara');
    }
};
