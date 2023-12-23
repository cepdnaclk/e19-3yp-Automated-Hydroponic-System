import 'package:flutter/material.dart';
import 'package:testapp/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color(0xFFFFFF);
    return MaterialApp(
      title: 'HydroGrowPro',
      theme: ThemeData (
        primaryColor: myColor,
        useMaterial3: true,
      ),

      // Login Page
      home: LoginPage(),

      debugShowCheckedModeBanner: false,
    );
  }
}
