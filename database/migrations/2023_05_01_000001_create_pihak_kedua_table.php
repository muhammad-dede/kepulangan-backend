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
        Schema::create('pihak_kedua', function (Blueprint $table) {
            $table->id();
            $table->string('nama')->nullable();
            $table->string('no_identitas')->nullable();
            $table->string('jabatan')->nullable();
            $table->string('instansi')->nullable();
            $table->string('alamat')->nullable();
            $table->string('no_telp')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pihak_kedua');
    }
};
