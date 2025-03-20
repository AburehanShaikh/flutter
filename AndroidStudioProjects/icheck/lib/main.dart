import 'package:flutter/material.dart';
import 'login_signup.dart';
import 'screens/mainscreen.dart';
import 'otp.dart';
import 'registration.dart';
import 'splash.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}