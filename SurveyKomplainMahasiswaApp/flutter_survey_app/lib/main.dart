import 'package:flutter/material.dart';
import 'package:flutter_survey_app/pages/survey_list.dart';
import 'package:flutter_survey_app/pages/detail_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SurveyList(),
    );
  }
}
