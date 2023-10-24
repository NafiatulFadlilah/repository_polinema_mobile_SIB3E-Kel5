import 'package:flutter/material.dart';
import 'package:flutter_survey_app/models/survey.dart';
import 'package:flutter_survey_app/services/server_services.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ServerService serverService = ServerService();
  
  int _currentPage = 1;
  int _rowsPerPage = 10;

  void _previousPage() {
    setState(() {
      _currentPage = _currentPage > 1 ? _currentPage - 1 : 1;
    });
  }

  void _nextPage() {
    setState(() {
      _currentPage++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Detail Page'),
      ),
      body: ListView(
        children: [   
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0), // Padding ke kanan
                child: Text('Show Entries'),
              ),
              SizedBox(width: 16.0), // Spasi antara teks dan Dropdown
              Expanded(
                child: DropdownButton<int>(
                  value: _rowsPerPage,
                  items: [10, 20, 30].map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('$value'),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _rowsPerPage = newValue!;
                    },
                    );
                  },
                ),
              ),
            ],
          ),
          FutureBuilder<List<Survey>>(
            future: serverService.getAllData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dividerThickness: 1.0,
                    columnSpacing: 100.0,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text('No'),
                      ),
                      DataColumn(
                        label: Text('Genre'),
                      ),
                      DataColumn(
                        label: Text('Reports'),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      _rowsPerPage,
                      (index) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text('${(_currentPage - 1) * _rowsPerPage + index + 1}')),
                          DataCell(Text(snapshot.data![(_currentPage - 1) * _rowsPerPage + index + 1].genre)),
                          DataCell(Text(snapshot.data![(_currentPage - 1) * _rowsPerPage + index + 1].reports)),
                        ],
                      ),
                    ),
                  ),
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
            }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _previousPage,
                child: Text('Previous'),
              ),
              Text('$_currentPage'),
              ElevatedButton(
                onPressed: _nextPage,
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

