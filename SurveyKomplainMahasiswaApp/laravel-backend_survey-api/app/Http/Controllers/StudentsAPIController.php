<?php

namespace App\Http\Controllers;

use App\Models\StudentData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

class StudentsAPIController extends Controller
{
    // A method to get all student data
    public function index()
    {
        $students = StudentData::all();
        return response()->json($students, 200);
    }

    // A method to get a single student data by nim
    public function show($nim)
    {
        $student = StudentData::where('nim', $nim)->first();
        if ($student) {
            return response()->json($student, 200);
        } else {
            return response()->json(['message' => 'Student not found'], 404);
        }
    }
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nim' => 'required|exists:students_data,nim',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $student = StudentData::where('nim', $request->nim)->first();
        if ($student && Hash::check($request->password, $student->password)) {
            return response()->json(['message' => 'Login successful', 'data' => $student], 200);
        } else {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }
    }

    // A method to store a new student data
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nim' => 'required|unique:students_data',
            'name' => 'required',
            'phone' => 'required',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $student = StudentData::create($request->all());
        return response()->json(['message' => 'Student created successfully', 'data' => $student], 201);
    }

    // A method to update an existing student data by nim
    public function update(Request $request, $nim)
    {
        $validator = Validator::make($request->all(), [
            'nim' => 'unique:students_data,nim,' . $nim,
            'name' => 'sometimes',
            'phone' => 'sometimes',
            'password' => 'sometimes',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $student = StudentData::where('nim', $nim)->first();
        if ($student) {
            $student->update($request->all());
            return response()->json(['message' => 'Student updated successfully', 'data' => $student], 200);
        } else {
            return response()->json(['message' => 'Student not found'], 404);
        }
    }

    // A method to delete an existing student data by nim
    public function destroy($nim)
    {
        $student = StudentData::where('nim', $nim)->first();
        if ($student) {
            $student->delete();
            return response()->json(['message' => 'Student deleted successfully'], 200);
        } else {
            return response()->json(['message' => 'Student not found'], 404);
        }
    }
}