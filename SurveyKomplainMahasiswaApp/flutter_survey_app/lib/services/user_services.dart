import 'dart:convert';
import 'dart:io';

import 'package:flutter_survey_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserService {
  Future<List<User>> getAllData() async {
    await dotenv.load(fileName: ".env");
    final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'students';
    try {
      http.Response response =
          await http.get(Uri.parse(baseUrl!));
      if (response.statusCode == HttpStatus.ok) {
        print("ok");
        List<User> users = [];
        for (var item in jsonDecode(response.body)) {
          users.add(User.fromJson(item));
        }
        return users;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
  Future<int> login(nim,pass) async {
    await dotenv.load(fileName: ".env");
    final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'students/login';
    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final Map<String, dynamic> body = {
      'nim': nim,
      'password' : pass,
    };
    try {
      http.Response response = await http.post(Uri.parse(baseUrl!), headers: headers, body: json.encode(body));
      if (response.statusCode == HttpStatus.ok) {
        print('login');
        return 1;
      } else {
        throw Exception('gagal ${response.statusCode} ${jsonDecode(response.body)}');
      }
    } catch (e) {
      print(e);
      return 0;
    }
  }
  // Future<List<Survey>> getAllDataRange(limit,offset) async {
  //   await dotenv.load(fileName: ".env");
  //   final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'range_data?limit=$limit&offset=$offset';
  //   try {
  //     http.Response response =
  //         await http.get(Uri.parse(baseUrl!));
  //     if (response.statusCode == HttpStatus.ok) {
  //       List<Survey> surveys = [];
  //       for (var item in jsonDecode(response.body)) {
  //         surveys.add(Survey.fromJson(item));
  //       }
  //       return surveys;
  //     } else {
  //       throw Exception('Failed to load surveys');
  //     }
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }
  // Future<int> getAllDataCount() async {
  //   await dotenv.load(fileName: ".env");
  //   final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'count_data';
  //   try {
  //     http.Response response =
  //         await http.get(Uri.parse(baseUrl!));
  //     if (response.statusCode == HttpStatus.ok) {
  //       return jsonDecode(response.body);
  //     } else {
  //       throw Exception('Failed to load surveys');
  //     }
  //   } catch (e) {
  //     print(e);
  //     return 0;
  //   }
  // }
  
  // Future<List<Survey>> getShowData() async {
  //   await dotenv.load(fileName: ".env");
  //   final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'show_data';
  //   try{
  //     http.Response response = await http.get(Uri.parse(baseUrl!));
  //     if (response.statusCode == HttpStatus.ok) {
  //       print('s');
  //       List<Survey> surveys = [];
  //       for (var item in jsonDecode(response.body)) {
  //         surveys.add(Survey.fromJson(item));
  //       }
  //       return surveys;
  //     } else {
  //       throw Exception('Failed to load surveys');
  //     }
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }

  // Future<List> getShowDataByFactor() async {
  //   await dotenv.load(fileName: ".env");
  //   final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'show_data/by_factor';
  //   http.Response response = await http.get(Uri.parse(baseUrl!));
  //   if (response.statusCode == HttpStatus.ok) {
  //     print('s');
  //     List data = jsonDecode(response.body);
  //     return data;
  //   } else {
  //     throw Exception('Failed to load surveys');
  //   }
  // }

  // Future<List<ByGender>> getShowDataByGender() async {
  //   await dotenv.load(fileName: ".env");
  //   final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'show_data/by_gender';
  //   try{
  //     http.Response response = await  http.get(Uri.parse(baseUrl!));
  //     if (response.statusCode == HttpStatus.ok) {
  //       print('s');
  //       List<ByGender> byGender = [];
  //       for (var item in  jsonDecode(response.body)){
  //         byGender.add(ByGender.fromJson(item));
  //       }
  //       return byGender;
  //     } else {
  //       throw Exception('Failed to load surveys');
  //     }
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }

  // Future<List<ByNationality>> getShowDataByNationality() async {
  //   await dotenv.load(fileName: ".env");
  //   final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'show_data/by_nationality';
  //   try{
  //     http.Response response = await http.get(Uri.parse(baseUrl!));
  //     if (response.statusCode == HttpStatus.ok) {
  //       print('s');
  //       List<ByNationality> byNationality = [];
  //       for (var item in jsonDecode(response.body)){
  //         byNationality.add(ByNationality.fromJson(item));
  //       }
  //       return byNationality;
  //     } else {
  //       throw Exception('Failed to load surveys');
  //     }
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }

  // Future<double> getAvgAge() async {
  //   await dotenv.load(fileName: ".env");
  //   final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'get_average_age';
  //   try{
  //     http.Response response = await http.get(Uri.parse(baseUrl!));
  //     if (response.statusCode == HttpStatus.ok) {
  //       print('s');
  //       double age = double.parse(response.body);
  //       return age;
  //     } else {
  //       throw Exception('Failed to load average age');
  //     }
  //   } catch (e) {
  //     print(e);
  //     return 0;
  //   }
  // }

  // Future<double> getAvgGPA() async {
  //   await dotenv.load(fileName: ".env");
  //   final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'get_average_gpa';
  //   try{
  //     http.Response response = await http.get(Uri.parse(baseUrl!));
  //     if (response.statusCode == HttpStatus.ok) {
  //       print('s');
  //       double gpa = double.parse(response.body);
  //       return gpa;
  //     } else {
  //       throw Exception('Failed to load average gpa');
  //     }
  //   } catch (e) {
  //     print(e);
  //     return 0.0;
  //   }
  // }
  // Future<int> postNewData(String genre,String reports,int age,double gpa,int year,int count,String gender,String nationality) async {
  //   await dotenv.load(fileName: ".env");
  //   final String? baseUrl = dotenv.env['SERVER_ADDRESS']! + 'insert_data';
  //   final Map<String, String> headers = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   };
  //   final Map<String, dynamic> body = {
  //     'genre': genre,
  //     'reports' : reports,
  //     'age' : age,
  //     'gpa' : gpa,
  //     'year' : year,
  //     'count' : count,
  //     'gender' : gender,
  //     'nationality' : nationality,
  //   };
  //   try{
  //     http.Response response = await http.post(Uri.parse(baseUrl!), headers: headers, body: json.encode(body));
  //     if (response.statusCode == HttpStatus.ok) {
  //       print('Data berhasil dikirim');
  //       return 1;
  //     } else {
  //       throw Exception('Data gagal dikirim${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print(e);
  //     return 0;
  //   }
  // }
}