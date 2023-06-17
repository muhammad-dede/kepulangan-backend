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
        Schema::create('antar_area', function (Blueprint $table) {
            $table->unsignedBigInteger('from_area')->nullable()->index();
            $table->unsignedBigInteger('to_area')->nullable()->index();

            $table->foreign('from_area')->references('id')->on('area')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('to_area')->references('id')->on('area')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('antar_area');
    }
};
