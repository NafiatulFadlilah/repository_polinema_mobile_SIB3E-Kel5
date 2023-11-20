import 'package:flutter/material.dart';
import 'package:flutter_survey_app/models/report.dart';
import 'package:flutter_survey_app/services/reports_services.dart';
import 'package:intl/intl.dart';

class ListReports extends StatefulWidget {
  @override
  _ListReportsState createState() => _ListReportsState();
}

class _ListReportsState extends State<ListReports> {
  // deklarasikan variabel untuk menyimpan list reports
  List<Report> reports = [];
  ReportService service = ReportService();

  // buat fungsi untuk mendapatkan data reports dari server
  Future<void> getReports() async {
    reports = await service.getAllData();
    setState(() {
      reports = reports;
    });
  }
  @override
  void initState() {
    getReports();
    super.initState();
  }
  bool _isExpanded = false;

  // buat widget untuk halaman list reports
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('List Reports'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // buat button untuk mendapatkan data reports
            ElevatedButton(
              onPressed: getReports,
              child: Text('Refresh Reports'),
            ),
            SizedBox(height: 10.0),
            // buat widget untuk menampilkan list reports
            Expanded(
              child: ListView.builder(
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  // dapatkan report sesuai dengan index
                  Report report = reports[index];
                  // buat card untuk menampilkan report
                  return Card(
                    child: Column(
                      children: [
                        ExpansionTile(
                          // tampilkan id sebagai leading
                          leading: Text((index+1).toString()),
                          // tampilkan nim dan type sebagai title
                          title: Text('${report.nim} - ${report.type}'),
                          // tampilkan chronology sebagai subtitle
                          subtitle: _isExpanded
                            ? Text(report.chronology)
                            : Text(
                                report.chronology,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                          // tampilkan evidence sebagai trailing
                          children: [
                            Image.network("http://192.168.1.77:8000/surveyapi/reports/${report.id}/image",height: 200,fit: BoxFit.fitHeight,),
                            Container(
                              color: Colors.black54,
                              padding: const EdgeInsets.all(10),
                              // gunakan column untuk menampilkan nim dan chronology
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // gunakan text style untuk memberi warna dan ukuran text
                                  Text(
                                    '${report.nim} - ${report.student.name} - ${report.student.phone}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '${DateFormat('dd MMMM yyyy, HH:mm:ss').format(DateTime.parse(report.updated_at))}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          onExpansionChanged: (value) {
                            setState(() {
                              _isExpanded = value;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}