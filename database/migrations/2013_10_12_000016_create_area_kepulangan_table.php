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
        Schema::create('area_kepulangan', function (Blueprint $table) {
            $table->unsignedBigInteger('id_area')->nullable()->index();
            $table->unsignedBigInteger('id_kepulangan')->nullable()->index();

            $table->foreign('id_area')->references('id')->on('area')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('id_kepulangan')->references('id')->on('kepulangan')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('area_kepulangan');
    }
};
