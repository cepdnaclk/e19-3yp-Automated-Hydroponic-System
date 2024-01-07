import 'package:flutter/material.dart';

class UserGuide extends StatefulWidget {
  const UserGuide({super.key});

  @override
  State<UserGuide> createState() => _UserGuideState();
}

class _UserGuideState extends State<UserGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          "User Guide",
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            
          ),
        ),
      ),
    );
  }
}