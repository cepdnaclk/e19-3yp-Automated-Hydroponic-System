import 'package:flutter/material.dart';
import 'header.dart';

class PlantStatus extends StatefulWidget {
  const PlantStatus({super.key});

  @override
  State<PlantStatus> createState() => _PlantStatusState();
}

class _PlantStatusState extends State<PlantStatus> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Header(),
    );
  }
}
