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
        Schema::create('penyedia_jasa', function (Blueprint $table) {
            $table->id();
            $table->string('nama_perusahaan')->nullable();
            $table->text('alamat')->nullable();
            $table->string('email')->nullable();
            $table->string('no_telp')->nullable();
            $table->string('up')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('penyedia_jasa');
    }
};
