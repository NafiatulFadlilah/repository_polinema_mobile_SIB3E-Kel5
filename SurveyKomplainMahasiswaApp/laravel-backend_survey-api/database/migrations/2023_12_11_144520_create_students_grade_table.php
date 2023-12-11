<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentsGradeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('students_grade', function (Blueprint $table) {
            $table->id();
            $table->string('nim'); // NIM yang berelasi dengan tabel students_data
            $table->float('s1')->nullable()->default(0);
            $table->float('s2')->nullable()->default(0);
            $table->float('s3')->nullable()->default(0);
            $table->float('s4')->nullable()->default(0);
            $table->float('s5')->nullable()->default(0);
            $table->float('s6')->nullable()->default(0);
            $table->float('s7')->nullable()->default(0);
            $table->float('s8')->nullable()->default(0);
            $table->timestamps();
            $table->foreign('nim')->references('nim')->on('students_data')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('students_grade');
    }
}
