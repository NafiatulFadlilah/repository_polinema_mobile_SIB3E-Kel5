import 'package:flutter/material.dart';
import 'package:flutter_survey_app/services/server_services.dart';

class SurveyList extends StatefulWidget {
  @override
  _SurveyListState createState() => _SurveyListState();
}

class _SurveyListState extends State<SurveyList> {
  var result = "";
  late ServerService service;
  int? surveysCount = null;
  late List surveys;

  @override
  void initState(){
    service = ServerService();
    surveys = service.getAllData() as List;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("surveys"),
      ),
      body: Container(
        child: Text(surveys[0]),
      )
    );
  }
}