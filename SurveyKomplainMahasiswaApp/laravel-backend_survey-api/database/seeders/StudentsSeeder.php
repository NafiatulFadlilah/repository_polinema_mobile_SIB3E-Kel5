<?php

namespace Database\Seeders;

use App\Models\StudentData;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;


class StudentsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Schema::disableForeignKeyConstraints();
        StudentData::truncate();
        
        // Create some dummy data for testing
        StudentData::create([
            'nim' => '2141762030',
            'name' => 'Nafiatul Fadlilah',
            'phone' => '081249951412',
            'password' => '2141762030',
        ]);
        StudentData::create([
            'nim' => '2141762073',
            'name' => 'Ibnu Tsalis Assalam',
            'phone' => '085895875155',
            'password' => '2141762073',
        ]);
        StudentData::create([
            'nim' => '2141762103',
            'name' => 'Khosyi Nasywa Imanda',
            'phone' => '089616693464',
            'password' => '2141762103',
        ]);
        StudentData::create([
            'nim' => '2141762140',
            'name' => 'M. Helmi Permana Agung',
            'phone' => '089680536891',
            'password' => '2141762140',
        ]);
        Schema::enableForeignKeyConstraints();
    }
}
