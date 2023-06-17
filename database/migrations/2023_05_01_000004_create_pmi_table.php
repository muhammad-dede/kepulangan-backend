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
        Schema::create('pmi', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_imigran')->nullable()->index();
            $table->unsignedBigInteger('id_group')->nullable()->index();
            $table->unsignedBigInteger('id_masalah')->nullable()->index();
            $table->string('foto_pmi')->nullable();
            $table->string('foto_paspor')->nullable();

            $table->foreign('id_imigran')->references('id')->on('imigran')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('id_group')->references('id')->on('group')->onDelete('set null')->onUpdate('set null');
            $table->foreign('id_masalah')->references('id')->on('masalah')->onDelete('set null')->onUpdate('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pmi');
    }
};
