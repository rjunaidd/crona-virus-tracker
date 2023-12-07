import 'package:crona_virus/Views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // color: Colors.grey.shade900,
  debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
