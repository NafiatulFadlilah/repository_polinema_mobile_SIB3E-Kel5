import 'package:flutter/material.dart';
import 'package:flutter_survey_app/pages/detail_page.dart';
// import 'package:flutter_survey_app/pages/detail_page.dart';
// import 'package:flutter_survey_app/pages/survey_list.dart';
import 'package:flutter_survey_app/services/server_services.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ServerService? service;
  List surveys = [];
  List itemByFactor = [];
  List surveysByFactor = [];
  int surveysCount = 0;
  int problemCount = 0;
  int totalByFactor = 0;
  String selectedProblemFactor = 'Sumberdaya dan\nDukungan Akademik'; // Nilai awal dropdown
  String selectedGender = 'Male'; // Nilai awal dropdown gender
  String selectedCountry = 'Indonesia'; // Nilai awal dropdown country

  Future initialize() async{
    surveys = [];
    surveys = (await service!.getAllData());
    surveysByFactor = await service!.getShowDataByFactor();
    setState(() {
      selectedProblemFactor = surveysByFactor[0]["genre"];
      problemCount = surveysByFactor[0]["total"];
      surveysCount = surveys.length;
      surveys = surveys;
      surveysByFactor = surveysByFactor;
    });
  }

  @override
  void initState(){
    service = ServerService();
    initialize();
    super.initState();
  }


  void _viewDetailPressed(BuildContext context) {
    // Fungsi ini akan dipanggil ketika "View Detail" ditekan
    // Anda dapat menambahkan logika navigasi ke halaman lain di sini
    // Contoh sederhana: Navigator.pushNamed(context, '/halaman_lain');
    MaterialPageRoute route = MaterialPageRoute(
      builder: (_) => DetailPage()
    );
    Navigator.push(context, route);
  }

  Future _sumByCategory() async {
    var item = surveysByFactor.firstWhere(
      (element) => element["genre"] == selectedProblemFactor);
    // Mengambil nilai total dari objek tersebut
    problemCount = item["total"];
    // List surveyByCat = [];
    // surveyByCat = (await service!.getShowDataByFactor());
    // if(selectedProblemFactor == 'Sumberdaya dan\nDukungan Akademik'){
    //   problemCount = surveyByCat[int.parse('total')];
    //   // var genre = 'Academic Support and Resources';
    //   // int total = surveyByCat.firstWhere((total) => total['genre'] == genre, orElse: () => 0);
    //   // problemCount = total;
    //   // print(surveyByCat[int.parse('total')]);
    // } else if (selectedProblemFactor == 'Layanan Kantin dan Makanan') {
    //   // var genre = 'Food and Cantines';
    //   // int total = surveyByCat.firstWhere((total) => total['genre'] == genre, orElse: () => 0);
    //   // problemCount = total;
    // } else {
    //   // var total = 0;
    //   // surveysCount = total;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Main Page'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    color: Colors.white,
                    elevation: 4.0,
                    child: Container(
                      width: 150.0,
                      height: 130.0,
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Total Survey',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                surveysCount.toString()+' ',
                                style: TextStyle(
                                  fontSize: 38.0,
                                  color: const Color(0xFF000000),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 0,
                              ),
                              Text(
                                'Respon',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: const Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () => _viewDetailPressed(context),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'View Detail',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jumlah Setiap Faktor\n'+
                        'Permasalahan',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      DropdownButton<String>(
                        value: selectedProblemFactor,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedProblemFactor = newValue!;
                          });
                        },
                        items: surveysByFactor.map((item) {
                          return DropdownMenuItem<String>(
                            value: item["genre"],
                            child: Text(item["genre"], style: TextStyle(fontSize: 12),),
                          );
                        }).toList(),
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 4.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // Text(
                              //   'Academic Support and Resour',
                              //   style: TextStyle(
                              //     fontSize: 10.0,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 10.0,
                              // ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    problemCount.toString()+' ',
                                    style: TextStyle(
                                      fontSize: 32.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'respon',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),

              Row(
                children: [
                  Container(
                    width: 170.0,
                    height: 185.0,
                    child: Card(
                      elevation: 4.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sum of respondents based on gender',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          DropdownButton<String>(
                            value: selectedGender,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedGender = newValue!;
                              });
                            },
                            items: <String>['Male', 'Female']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          Card(
                            color: Colors.white,
                            elevation: 4.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    selectedGender,
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        '329 ',
                                        style: TextStyle(
                                          fontSize: 32.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'persons',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    width: 160.0,
                    child: Card(
                      elevation: 4.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sum of respondents based on country of origin',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          DropdownButton<String>(
                            value: selectedCountry,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCountry = newValue!;
                              });
                            },
                            items: <String>['Indonesia', 'Korea Selatan', 'Palestina']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          Card(
                            elevation: 4.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    selectedCountry,
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        '829 ',
                                        style: TextStyle(
                                          fontSize: 32.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'persons',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80.0,
              ),
              Card(
                color: Color.fromARGB(255, 1, 28, 85),
                elevation: 4.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.yellow, // Garis kuning pemisah
                      height: 2.0,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                    ),
                    Center(
                      child: Text(
                        'Average of Age',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Warna teks putih
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Center(
                      child: Text(
                        avgAge.toString(),
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Warna teks putih
                        ),
                    ),
                )],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),

              Card(
                color: Color.fromARGB(255, 1, 28, 85), // Warna latar belakang biru
                elevation: 4.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.yellow, // Garis kuning pemisah
                      height: 2.0,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                    ),
                    Center(
                      child: Text(
                        'Average of GPA',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Warna teks putih
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Center(
                      child: Text(
                        avgGPA.toString(),
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Warna teks putih
                        ),
                    ),
                )],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
