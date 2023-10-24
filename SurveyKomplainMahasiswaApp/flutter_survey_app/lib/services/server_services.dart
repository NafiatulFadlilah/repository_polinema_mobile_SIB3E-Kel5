import 'dart:convert';
import 'dart:io';

import 'package:flutter_survey_app/models/survey.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ServerService {
  Future<List<Survey>> getAllData() async {
    await dotenv.load(fileName: ".env");
    final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'all_data';
    try {
      http.Response response =
          await http.get(Uri.parse(baseUrl!));
      if (response.statusCode == HttpStatus.ok) {
        print('s');
        List<Survey> surveys = [];
        for (var item in jsonDecode(response.body)) {
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

  Future<List<Survey>> getShowData() async {
    await dotenv.load(fileName: ".env");
    final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'show_data';
    try{
      http.Response response = await http.get(Uri.parse(baseUrl!));
      if (response.statusCode == HttpStatus.ok) {
        print('s');
        List<Survey> surveys = [];
        for (var item in jsonDecode(response.body)) {
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

  Future<List> getShowDataByFactor() async {
    await dotenv.load(fileName: ".env");
    final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'show_data/by_factor';
    try{
      http.Response response = await http.get(Uri.parse(baseUrl!));
      if (response.statusCode == HttpStatus.ok) {
        print('s');
        List byFactor = jsonDecode(response.body);
        return byFactor;
      } else {
        throw Exception('Failed to load surveys');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List> getShowDataByGender() async {
    await dotenv.load(fileName: ".env");
    final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'show_data/by_gender';
    try{
      http.Response response = await http.get(Uri.parse(baseUrl!));
      if (response.statusCode == HttpStatus.ok) {
        print('s');
        List byGender = jsonDecode(response.body);
        return byGender;
      } else {
        throw Exception('Failed to load surveys');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List> getShowDataByNationality() async {
    await dotenv.load(fileName: ".env");
    final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'show_data/by_nationality';
    try{
      http.Response response = await http.get(Uri.parse(baseUrl!));
      if (response.statusCode == HttpStatus.ok) {
        print('s');
        List byNationality = jsonDecode(response.body);
        return byNationality;
      } else {
        throw Exception('Failed to load surveys');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<int> getAvgAge() async {
    await dotenv.load(fileName: ".env");
    final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'get_average_age';
    try{
      http.Response response = await http.get(Uri.parse(baseUrl!));
      if (response.statusCode == HttpStatus.ok) {
        print('s');
        return jsonDecode(response.body) * 1;
      } else {
        throw Exception('Failed to load average age');
      }
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Future<double> getAvgGPA() async {
    await dotenv.load(fileName: ".env");
    final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'get_average_gpa';
    try{
      http.Response response = await http.get(Uri.parse(baseUrl!));
      if (response.statusCode == HttpStatus.ok) {
        print('s');
        return jsonDecode(response.body) * 1.0;
      } else {
        throw Exception('Failed to load average gpa');
      }
    } catch (e) {
      print(e);
      return 0.0;
    }
  }
}