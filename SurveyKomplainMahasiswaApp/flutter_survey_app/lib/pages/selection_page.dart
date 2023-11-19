import 'package:flutter/material.dart';
import 'package:flutter_survey_app/pages/homepage.dart';
import 'package:flutter_survey_app/widgets/button_widget.dart';

class SelectionPage extends StatefulWidget {
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage>{
  @override
  Widget build(BuildContext context){
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Pilih Salah Satu', style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              ButtonWidget(
                text: 'Dashboard',
                backColor: isDarkMode ? [Colors.black, Colors.black] : const [Color(0xff92A3FD), Color(0xff9DCEFF)],
                textColor: const [Colors.white, Colors.white],
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => MyApp()));
                },
              ),
              SizedBox(height: 20),
              ButtonWidget(
                text: 'Pengaduan Kekerasan Seksual',
                backColor: isDarkMode ? [Colors.black, Colors.black] : const [Color(0xff92A3FD), Color(0xff9DCEFF)],
                textColor: const [Colors.white, Colors.white],
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => MyApp()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}