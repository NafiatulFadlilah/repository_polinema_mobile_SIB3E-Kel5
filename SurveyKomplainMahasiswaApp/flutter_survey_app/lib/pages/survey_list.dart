import 'package:flutter/material.dart';
import 'package:flutter_survey_app/models/survey.dart';
import 'package:flutter_survey_app/services/server_services.dart';

class SurveyList extends StatefulWidget {
  @override
  _SurveyListState createState() => _SurveyListState();
}

class _SurveyListState extends State<SurveyList> {
  ServerService serverService = ServerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey List'),
      ),
      body: FutureBuilder<List<Survey>>(
        future: serverService.fetchSurveys(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Survey survey = snapshot.data![index];
                return Card(
                  child: ListTile(
                    title: Text(survey.genre),
                    subtitle: Text(survey.reports),
                    trailing: Text(survey.nationality),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}