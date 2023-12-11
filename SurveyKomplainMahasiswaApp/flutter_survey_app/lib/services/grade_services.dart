import 'dart:convert';
import 'dart:io';

import 'package:flutter_survey_app/models/grade.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GradeService {
  Future<List> getAllData() async {
    await dotenv.load(fileName: ".env");
    final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'students_grade';
    try {
      http.Response response =
          await http.get(Uri.parse(baseUrl!));
      if (response.statusCode == HttpStatus.ok) {
        print("ok");
        List grades = [];
        for (var item in jsonDecode(response.body)) {
          grades.add(Grade.fromJson(item));
        }
        return grades;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}