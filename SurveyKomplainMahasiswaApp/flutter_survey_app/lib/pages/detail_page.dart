import 'package:flutter/material.dart';
import 'package:flutter_survey_app/models/survey.dart';
import 'package:flutter_survey_app/services/server_services.dart';

class DetailPage extends StatefulWidget {
  final int dataLength;

  DetailPage(this.dataLength);

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
      if(_currentPage < ((widget.dataLength/_rowsPerPage)+0.5).round()){
        _currentPage++;
      }else{
        ((widget.dataLength/_rowsPerPage)+0.5).round();
      }
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
      body: Column(
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
          Expanded(
            child: FutureBuilder<List<Survey>>(
              future: serverService.getAllData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: _rowsPerPage,
                    itemBuilder: (context, index) {
                      if(((_currentPage - 1) * _rowsPerPage + index) < snapshot.data!.length){
                        Survey survey = snapshot.data![(_currentPage - 1) * _rowsPerPage + index];
                        return ExpansionTile(
                          // expandedAlignment: Alignment.centerLeft,
                          title: Text(survey.genre),
                          subtitle: Text(survey.reports),
                          trailing: Text(survey.nationality),
                          children: [
                            Divider(color: Colors.grey, height: 10, thickness: 2),
                            Container(
                              margin: EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan( // buat TextSpan pertama untuk bagian prefix
                                        text: 'Jenis Kelamin: ', // isi properti text dengan prefix
                                        style: TextStyle(fontWeight: FontWeight.bold), // isi properti style dengan gaya bold
                                        children: [ // isi properti children dengan TextSpan lain untuk bagian ${survey}
                                          TextSpan(
                                            text: '${survey.gender == "M"?"Laki-laki":"Perempuan"}', // isi properti text dengan ${survey}
                                            style: TextStyle(fontWeight: FontWeight.normal), // isi properti style dengan gaya normal
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.left, // rata kiri
                                    ),
                                    Text.rich( // ulangi langkah yang sama untuk baris berikutnya
                                      TextSpan(
                                        text: 'Umur: ',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: '${survey.age}',
                                            style: TextStyle(fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.left, // rata kiri
                                    ),
                                    Text.rich( // ulangi langkah yang sama untuk baris berikutnya
                                      TextSpan(
                                        text: 'IPK: ',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: '${survey.gpa}',
                                            style: TextStyle(fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.left, // rata kiri
                                    ),
                                    Text.rich( // ulangi langkah yang sama untuk baris berikutnya
                                      TextSpan(
                                        text: 'Tahun ke: ',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: '${survey.year}',
                                            style: TextStyle(fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.left, // rata kiri
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
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

