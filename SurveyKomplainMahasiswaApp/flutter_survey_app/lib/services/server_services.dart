import 'dart:convert';
import 'dart:io';

import 'package:flutter_survey_app/models/survey.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ServerService {
  Future<List<Survey>> fetchSurveys() async {
    await dotenv.load(fileName: ".env");
    final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'all_data';
    try {
      http.Response response =
          await http.post(Uri.parse(baseUrl!));
      if (response.statusCode == HttpStatus.ok) {
        print('s');
        List<Survey> surveys = [];
        for (var item in jsonDecode(response.body)) {
          print(item);
          surveys.add(Survey.fromJson(item));
        }
        return surveys;
      } else {
        throw Exception('Failed to load surveys');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}