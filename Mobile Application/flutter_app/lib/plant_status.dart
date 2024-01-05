import 'package:flutter/material.dart';
import 'package:testapp/static_header.dart';
//import 'header.dart';
import 'package:http/http.dart';

class PlantStatus extends StatefulWidget {
  const PlantStatus({super.key});

  @override
  State<PlantStatus> createState() => _PlantStatusState();
}

class _PlantStatusState extends State<PlantStatus> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: StaticHeader(),
    );
  }
}
