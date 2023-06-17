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
        Schema::create('layanan_cargo', function (Blueprint $table) {
            $table->unsignedBigInteger('id_layanan')->nullable()->index();
            $table->unsignedBigInteger('id_cargo')->nullable()->index();

            $table->foreign('id_layanan')->references('id')->on('layanan')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('id_cargo')->references('id')->on('cargo')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('layanan_cargo');
    }
};
