<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentGrade extends Model
{
    use HasFactory;

    protected $table = 'students_grade';

    protected $fillable = [
        'nim', 
        's1', 
        's2', 
        's3',
        's4',
        's5',
        's6',
        's7',
        's8',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    public function mahasiswa(){
        return $this->belongsTo(StudentData::class, 'nim');
    }


}
