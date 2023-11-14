// File splash_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Color.fromARGB(255, 230, 218, 231)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                      "https://akupintar.id/documents/20143/0/LOGO+POLITEKNIK+NEGERI+MALANG.png/949b5c7d-1fd2-121d-c1ad-f275911cb955?version=1.0&t=1519104037264&imageThumbnail=1",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Welcome to the Polinema SurveyApp",
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                "Explore and Survey with Ease",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 3, 3, 3),
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 50),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
