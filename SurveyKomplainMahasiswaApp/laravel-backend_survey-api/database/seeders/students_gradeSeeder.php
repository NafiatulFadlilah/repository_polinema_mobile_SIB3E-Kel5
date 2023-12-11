<?php

namespace Database\Seeders;

use App\Models\StudentGrade;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;

class students_gradeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Schema::disableForeignKeyConstraints();
        StudentGrade::truncate();
        
        $csvFile = fopen(base_path("database/data/StudentGrade.csv"), "r");
  
        $firstline = true;
        while (($data = fgetcsv($csvFile, 300, ",")) !== FALSE) {
            if (!$firstline) {
                StudentGrade::create([
                    'nim' => $data['0'],
                    's1' => $data['1']?$data['1']:0,
                    's2' => $data['2']?$data['2']:0,
                    's3' => $data['3']?$data['3']:0,
                    's4' => $data['4']?$data['4']:0,
                    's5' => $data['5']?$data['5']:0,
                    's6' => $data['6']?$data['6']:0,
                    's7' => $data['7']?$data['7']:0,
                    's8' => $data['8']?$data['8']:0,
                ]);    
            }
            $firstline = false;
        }
        Schema::enableForeignKeyConstraints();
    }
}
