import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectedProblemFactor = 'Problem Factor 1'; // Nilai awal dropdown
  String selectedGender = 'Male'; // Nilai awal dropdown gender

  void _viewDetailPressed(BuildContext context) {
    // Fungsi ini akan dipanggil ketika "View Detail" ditekan
    // Anda dapat menambahkan logika navigasi ke halaman lain di sini
    // Contoh sederhana: Navigator.pushNamed(context, '/halaman_lain');
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Menggeser Card dan elemen-elemen lainnya ke kanan
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
                          SizedBox(height: 18.0), // Jarak antara tulisan dan angka
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Menggeser teks ke sebelah kiri
                            children: [
                              Text(
                                '1,006 ',
                                style: TextStyle(
                                  fontSize: 38.0,
                                  color: const Color(0xFF000000),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 0), // Jarak antara angka dan tulisan
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
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Menggeser elemen-elemen ini ke sebelah kanan Card
                    children: [
                      Text(
                        'Sum of Problem Factors',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      DropdownButton<String>(
                        value: selectedProblemFactor,
                        onChanged: (String? newValue) {
                          // Tambahkan logika ketika dropdown berubah
                          setState(() {
                            selectedProblemFactor = newValue!;
                          });
                        },
                        items: <String>['Problem Factor 1', 'Problem Factor 2', 'Problem Factor 3']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 2.0),
                      Card(
                        color: Colors.white,
                        elevation: 4.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'Academic Support and Resour', // 1. Tambahkan tulisan di atas "Total: 500"
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: [
                                  SizedBox(width: 5.0),
                                  Text(
                                    '278 ', // 2. Ganti "Total: 500" menjadi "278 problem"
                                    style: TextStyle(
                                      fontSize: 32.0, // 2. Ukuran font 20 untuk "278"
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'problem', // 2. Ukuran font 10 untuk "problem"
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
              SizedBox(height: 35.0), // Tambahkan jarak

              Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Ratakan elemen-elemen ini ke sebelah kiri
                children: [
                  Text(
                    'Sum of respondents based on gender',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  DropdownButton<String>(
                    value: selectedGender,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGender = newValue!;
                      });
                    },
                    items: <String>['Male', 'Female'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 2.0),
                  // Mengatur elemen-elemen dalam Card untuk memindahkan mereka ke sebelah kiri
                  Card(
                    color: Colors.white,
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Male',
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            '329',
                            style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ' persons',
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
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
    );
  }
}
