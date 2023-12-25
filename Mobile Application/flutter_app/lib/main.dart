import 'package:flutter/material.dart';
import 'package:testapp/login_page.dart';
import 'package:testapp/plant_log.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color(0xFFFFFF);
    Color myGreenColor = const Color(0xFF0D7817);

    return MaterialApp(
      title: 'HydroGrowPro',
      theme: ThemeData (
        colorScheme: ColorScheme.fromSeed(seedColor: myGreenColor),
        useMaterial3: true,
      ),

      // Login Page
      //home: LoginPage(),
      home: PlantLog(),

      debugShowCheckedModeBanner: false,
    );
  }
}
