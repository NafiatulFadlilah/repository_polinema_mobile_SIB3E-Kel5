import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.network(
              "https://akupintar.id/documents/20143/0/LOGO+POLITEKNIK+NEGERI+MALANG.png/949b5c7d-1fd2-121d-c1ad-f275911cb955?version=1.0&t=1519104037264&imageThumbnail=1",
            fit: BoxFit.contain,),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'your_email_account@gmail.com',
      // validator: (value) {
      //             if (value == null || value.isEmpty) {
      //               return 'Please enter your email';
      //             }
      //             if (!value.contains('@')) {
      //               return 'Please enter a valid email';
      //             }
      //             return null;
      //           },
      decoration: InputDecoration(
        hintText: 'Email',
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'some password',
      obscureText: true,
      // validator: (value) {
      //             if (value == null || value.isEmpty) {
      //               return 'Please enter your password';
      //             }
      //             if (value.length < 8) {
      //               return 'Please enter a password with at least 8 characters';
      //             }
      //             return null;
      //           },
      decoration: InputDecoration(
        hintText: 'Password',
        prefixIcon: Icon(Icons.lock),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding( 
      padding: EdgeInsets.symmetric(vertical: 16.0), 
      child: ElevatedButton( 
        style: ElevatedButton.styleFrom( 
          shape: RoundedRectangleBorder( 
            borderRadius: BorderRadius.circular(24), ), 
            backgroundColor: Color.fromARGB(255, 0, 88, 160), 
            padding: EdgeInsets.all(12), ),
             // onPressed: () { // Navigator.of(context).pushNamed(HomePage.tag); // }, 
            onPressed: () {  },
            child: Text("Sign In", style: TextStyle(color: Colors.white)), 
        ), 
      );

    final signUpButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0), 
      child: ElevatedButton( 
        style: ElevatedButton.styleFrom( 
          shape: RoundedRectangleBorder( 
            borderRadius: BorderRadius.circular(24), ), 
            backgroundColor: Colors.white, 
            padding: EdgeInsets.all(12), ),
             // onPressed: () { // Navigator.of(context).pushNamed(SignUpPage.tag); // }, 
            onPressed: () {  },
            child: Text("Sign Up", style: TextStyle(color: Color.fromARGB(255, 0, 88, 160))), 
        ), 
      );

    final forgotLabel = ElevatedButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            signUpButton,
            forgotLabel,
          ],
        ),
      ),
    );
  }
}