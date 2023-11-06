import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_survey_app/models/by_gender.dart';
import 'package:flutter_survey_app/models/by_nationality.dart';
import 'package:flutter_survey_app/pages/detail_page.dart';
import 'package:flutter_survey_app/services/server_services.dart';
import 'package:fl_chart/fl_chart.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ServerService? service;
  List surveys = [];
  // List byFactor = [];
  List<ByGender> byGender = [];
  List<ByNationality> byNationality = [];
  double avgAge = 0;
  double avgGPA = 0;
  List surveysByFactor = [];
  int surveysCount = 0;
  int problemCount = 0;
  // int totalByFactor = 0;
  int totalByGender = 0;
  int totalByNationality = 0;
  String selectedProblemFactor =
      'Sumberdaya dan Dukungan Akademik'; // Nilai awal dropdown
  String selectedGender = 'M'; // Nilai awal dropdown gender
  String selectedCountry = 'Indonesia'; // Nilai awal dropdown country

  List<Color> natChartColors = [];
  List<double> natChartOpacities = [];
  List<Color> jkChartColors = [];
  List<double> jkChartOpacities = [];

  late Future myInit;

  Color getRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  void changeOpacity(int index, length, String change) {
    setState(() {
      switch (change) {
        case "nat":
          natChartOpacities[index] = 1.0;
          for (int i = 0; i < length; i++) {
            if (i != index) {
              natChartOpacities[i] = 0.3;
            }
          }
          break;
        case "gender":
          jkChartOpacities[index] = 1.0;
          for (int i = 0; i < length; i++) {
            if (i != index) {
              jkChartOpacities[i] = 0.3;
            }
          }
          break;
        default:
      }
    });
  }

  Future initialize() async {
    surveys = [];
    surveys = (await service!.getAllData());
    byGender = (await service!.getShowDataByGender());
    byNationality = (await service!.getShowDataByNationality());
    surveysByFactor = await service!.getShowDataByFactor();
    avgAge = (await service!.getAvgAge());
    avgGPA = (await service!.getAvgGPA());
    setState(() {
      selectedProblemFactor = surveysByFactor[0]["genre"];
      problemCount = surveysByFactor[0]["total"];
      surveysCount = surveys.length;
      surveys = surveys;
      surveysByFactor = surveysByFactor;
      byGender = byGender;
      totalByGender =
          byGender.firstWhere((item) => item.gender == selectedGender).total;
      byNationality = byNationality;
      totalByNationality = byNationality
          .firstWhere((item) => item.nationality == selectedCountry)
          .total;
      natChartColors =
          List.generate(byNationality.length, (index) => getRandomColor());
      natChartOpacities = List.generate(byNationality.length, (index) => 1.0);
      jkChartColors =
          List.generate(byGender.length, (index) => getRandomColor());
      jkChartOpacities = List.generate(byGender.length, (index) => 1.0);
    });
    changeOpacity(
        byNationality
            .indexWhere((element) => element.nationality == selectedCountry),
        byNationality.length,
        "nat");
    changeOpacity(
        byGender.indexWhere((element) => element.gender == selectedGender),
        byGender.length,
        "gender");
  }

  @override
  void initState() {
    service = ServerService();
    // initialize();
    myInit = initialize();
    super.initState();
  }

  void _viewDetailPressed(BuildContext context) {
    // Fungsi ini akan dipanggil ketika "View Detail" ditekan
    MaterialPageRoute route =
        MaterialPageRoute(builder: (_) => DetailPage(surveysCount));
    Navigator.push(context, route);
  }

  Future _sumByCategory() async {
    var item = surveysByFactor
        .firstWhere((element) => element["genre"] == selectedProblemFactor);
    // Mengambil nilai total dari objek tersebut
    problemCount = item["total"];
  }

  Future<List<ByGender>> getDataByGender() async {
    byGender = (await service!.getShowDataByGender());
    return byGender;
  }

  Future<List<ByNationality>> getDataByNationality() async {
    byNationality = (await service!.getShowDataByNationality());
    return byNationality;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Main Page'),
          backgroundColor: Color.fromARGB(255, 0, 88, 160),
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //bag total survey
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
                              surveysCount.toString() + ' ',
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
                SizedBox(
                  height: 30.0,
                ),
                //bag by faktor
                Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Jumlah Setiap Faktor Permasalahan',
                          style: TextStyle(
                            fontSize: 15.0,
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
                            _sumByCategory();
                          },
                          items: surveysByFactor.map((item) {
                            return DropdownMenuItem<String>(
                              value: item["genre"],
                              child: Text(
                                item["genre"],
                                style: TextStyle(fontSize: 15),
                              ),
                            );
                          }).toList(),
                        ),
                        Column(
                          children: [
                            Card(
                              color: Colors.white,
                              elevation: 4.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          problemCount.toString() + ' ',
                                          style: TextStyle(
                                            fontSize: 35.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Respon',
                                          style: TextStyle(
                                            fontSize: 12.0,
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
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),

                //untuk bagian chart jk dan
                Column(
                  children: [
                    // Chart JK
                    Card(
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Jumlah berdasarkan jenis kelamin',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            FutureBuilder(
                              future: myInit,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 200,
                                        child: PieChart(
                                          PieChartData(
                                            sections: List.generate(
                                              byGender.length,
                                              (index) => PieChartSectionData(
                                                color: jkChartColors[index]
                                                    .withOpacity(
                                                        jkChartOpacities[
                                                            index]),
                                                value: byGender[index].total /
                                                    (byGender.fold(
                                                        0,
                                                        (sum, item) =>
                                                            sum + item.total)) *
                                                    100,
                                                title: '',
                                                radius: selectedGender ==
                                                        byGender[index].gender
                                                    ? 82
                                                    : 78,
                                              ),
                                            ),
                                            sectionsSpace: 4,
                                            centerSpaceRadius: 5,
                                            pieTouchData: PieTouchData(
                                              touchCallback:
                                                  (pieTouchResponse) {
                                                if (pieTouchResponse
                                                        .touchedSection !=
                                                    null) {
                                                  int index = pieTouchResponse
                                                      .touchedSection!
                                                      .touchedSectionIndex;
                                                  if (index != -1) {
                                                    setState(() {
                                                      selectedGender =
                                                          byGender[index]
                                                              .gender;
                                                      totalByGender = byGender
                                                          .firstWhere((item) =>
                                                              item.gender ==
                                                              selectedGender)
                                                          .total;
                                                      changeOpacity(
                                                          index,
                                                          byGender.length,
                                                          "gender");
                                                    });
                                                  }
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Legend for JK Chart
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: byGender.map((item) {
                                          return Row(
                                            children: [
                                              Container(
                                                width: 10,
                                                height: 10,
                                                color: jkChartColors[
                                                    byGender.indexOf(item)],
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                item.gender == "M"
                                                    ? "Laki-laki"
                                                    : "Perempuan",
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Chart Country
                    Card(
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Jumlah berdasarkan negara asal',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            FutureBuilder(
                              future: myInit,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: SizedBox(
                                              height: 200,
                                              width: 300,
                                              child: PieChart(
                                                PieChartData(
                                                  sections: List.generate(
                                                    byNationality.length,
                                                    (index) =>
                                                        PieChartSectionData(
                                                      color: natChartColors[
                                                              index]
                                                          .withOpacity(
                                                              natChartOpacities[
                                                                  index]),
                                                      value: byNationality[
                                                                  index]
                                                              .total /
                                                          (byNationality.fold(
                                                              0,
                                                              (sum, item) =>
                                                                  sum +
                                                                  item.total)) *
                                                          100,
                                                      title: selectedCountry ==
                                                              byNationality[
                                                                      index]
                                                                  .nationality
                                                          ? ((byNationality[index]
                                                                          .total /
                                                                      (byNationality.fold(
                                                                          0,
                                                                          (sum, item) =>
                                                                              sum +
                                                                              item.total)) *
                                                                      100)
                                                                  .round()
                                                                  .toString() +
                                                              "%")
                                                          : '',
                                                      radius: selectedCountry ==
                                                              byNationality[
                                                                      index]
                                                                  .nationality
                                                          ? 82
                                                          : 78,
                                                    ),
                                                  ),
                                                  sectionsSpace: 4,
                                                  centerSpaceRadius: 5,
                                                  pieTouchData: PieTouchData(
                                                    touchCallback:
                                                        (pieTouchResponse) {
                                                      if (pieTouchResponse
                                                              .touchedSection !=
                                                          null) {
                                                        int index = pieTouchResponse
                                                            .touchedSection!
                                                            .touchedSectionIndex;
                                                        if (index != -1) {
                                                          setState(() {
                                                            selectedCountry =
                                                                byNationality[
                                                                        index]
                                                                    .nationality;
                                                            totalByNationality =
                                                                byNationality
                                                                    .firstWhere((item) =>
                                                                        item.nationality ==
                                                                        selectedCountry)
                                                                    .total;
                                                            changeOpacity(
                                                                index,
                                                                byNationality
                                                                    .length,
                                                                "nat");
                                                          });
                                                        }
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 25.0,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children:
                                                  byNationality.map((item) {
                                                return Row(
                                                  children: [
                                                    Container(
                                                      width: 10,
                                                      height: 10,
                                                      color: natChartColors[
                                                          byNationality
                                                              .indexOf(item)],
                                                    ),
                                                    SizedBox(width: 5),
                                                    Text(item.nationality),
                                                  ],
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 30.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Card(
                        color: const Color.fromARGB(255, 10, 59, 99), // Warna latar belakang
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Membuat sudut kartu melengkung
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              color: Colors.yellow, // Garis kuning pemisah
                              height: 2.0,
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Rata-rata Umur',
                                  style: TextStyle(
                                    fontSize:
                                        18.0, // Ukuran teks yang lebih besar
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  avgAge.round().toString(),
                                  style: TextStyle(
                                    fontSize:
                                        36.0, // Ukuran teks yang lebih besar
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        color: const Color.fromARGB(255, 10, 59, 99), // Warna latar belakang
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Membuat sudut kartu melengkung
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              color: Colors.yellow, // Garis kuning pemisah
                              height: 2.0,
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Rata-rata IPK',
                                  style: TextStyle(
                                    fontSize:
                                        18.0, // Ukuran teks yang lebih besar
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  avgGPA.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontSize:
                                        36.0, // Ukuran teks yang lebih besar
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
