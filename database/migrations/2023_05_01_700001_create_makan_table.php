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
        Schema::create('makan', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_imigran')->nullable()->index();
            $table->unsignedBigInteger('id_bast_makan')->nullable()->index();

            $table->foreign('id_imigran')->references('id')->on('imigran')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('id_bast_makan')->references('id')->on('bast_makan')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('makan');
    }
};
