import 'package:flutter/material.dart';
import 'header.dart';

class NewPlant extends StatefulWidget {
  const NewPlant({super.key});

  @override
  State<NewPlant> createState() => _NewPlantState();
}

class _NewPlantState extends State<NewPlant> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Header(),
      body: Text(
        "Enter a New Plant",
        style: TextStyle(),
      ),
    );
  }
}
