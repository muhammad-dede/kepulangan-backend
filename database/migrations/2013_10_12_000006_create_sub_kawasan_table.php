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
        Schema::create('sub_kawasan', function (Blueprint $table) {
            $table->unsignedBigInteger('id')->primary();
            $table->string('nama')->nullable();
            $table->unsignedBigInteger('id_kawasan')->nullable()->index();

            $table->foreign('id_kawasan')->references('id')->on('kawasan')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sub_kawasan');
    }
};
