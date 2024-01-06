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

  //int sensorValue = 15; // Example sensor value

  String getWaterLevelText(int sensorValue) {
    if (sensorValue >= 10 && sensorValue < 20) {
      return 'LOW';
    } else if (sensorValue >= 20 && sensorValue < 40) {
      return 'GOOD';
    }
    
    return 'Unknown'; 
  }
  Color getWaterLevelColor(int sensorValue) {
    if (sensorValue >= 10 && sensorValue < 20) {
      return Colors.red;
    } else if (sensorValue >= 20 && sensorValue < 40) {
      return Colors.green;
    }
    return Colors.black; // Default color if condition doesn't match
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     // appBar: StaticHeader(),
      body: Column(
        children: [
          Column(
            children: [
              Center(
                child: Text(
                  "pH Value",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 30,
                  ),
                ),
                ),
              Center(
                child: Text(
                  "32"+" ml",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 30,
                  ),
                ),
                ),
            ],
          ),
            Column(
              children: [
                Center(
                child: Text(
                  "Nutrition Value",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 30,
                  ),
                ),
                ),
              ],
            ),
            Column(
              children: [
                Center(
                child: Text(
                  "32"+" ml",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 30,
                  ),
                ),
                ),
              ],
            ),
            Column(
            children: [
              Center(
                child: Text(
                  "Water Level",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 30,
                  ),
                ),
                ),
              Center(
                child: Text(
                  getWaterLevelText(15),
                  style: TextStyle(
                    color: getWaterLevelColor(15),
                    fontFamily: 'Poppins',
                    fontSize: 30,
                  ),
                ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
