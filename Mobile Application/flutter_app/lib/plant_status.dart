import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controllers/mqtt_controller.dart';
import 'package:testapp/sidebar.dart';
import 'package:testapp/static_header.dart';
//import 'header.dart';

class PlantStatus extends StatefulWidget {
  const PlantStatus({super.key});

  @override
  State<PlantStatus> createState() => _PlantStatusState();
}

class _PlantStatusState extends State<PlantStatus> {

    /*String getPhLevelText(int sensorValue) {
      if (sensorValue >= 8 && sensorValue < 5) {
        return 'Sorry your system has a low pH level !';
      } else if (sensorValue >= 5 && sensorValue < 8) {
        return 'Cool down your system\'s pH level is good !';
      }
      return 'Unknown'; 
    }
  Color getPhLevelColor(int sensorValue) {
    if (sensorValue >= 8 && sensorValue < 5) {
      return Colors.red;
    } else if (sensorValue >= 5 && sensorValue < 8) {
      return Colors.green;
    }
    return Colors.black; // Default color if condition doesn't match
  }

  String getTdsLevelText(int sensorValue) {
      if (sensorValue >= 2000 && sensorValue < 1200) {
        return 'Sorry your system has a low Nutrition level !';
      } else if (sensorValue >= 1200 && sensorValue < 2000) {
        return 'Cool down your system\'s Nutrition level is good !';
      }
      return 'Unknown'; 
    }
  Color getTdsLevelColor(int sensorValue) {
    if (sensorValue >= 2000 && sensorValue < 1200) {
      return Colors.red;
    } else if (sensorValue >= 1200 && sensorValue < 2000) {
      return Colors.green;
    }
    return Colors.black; // Default color if condition doesn't match
  }*/

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MqttController>(builder: (mqtt) {
      return Scaffold(
      appBar: StaticHeader(),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Container(
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                         // color: Color(0xFFE9F1E4),
                        ),
                child: Column(
                  children: [   
                    SizedBox(height: 20.0,)  ,                  
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/planticon.png',
                        height: 32,
                        width: 32,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "pH Level",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                    SizedBox(height: 20.0,)  ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FutureBuilder<String>(
                          future: mqtt.getPhData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return Text(
                                '${snapshot.data}',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                          
                                ),
                              );
                            }
                          },
                        ),
                        
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:20.0, right: 20.0, left: 20.0),
                      child: Text(
                            "It's better to have the pH range",
                            style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                            
                                  ),
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0, right: 20.0, left: 20.0),
                      child: Text(
                            "between 5 - 8",
                            style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                            
                                  ),
                          ),
                    )
                  ]),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: Divider(
                  color: Color(0xFF0D7817),
                  height: 1,
                  ),
              ),
              SizedBox(height: 5.0),
              Container(
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          //color: Color.fromARGB(255, 236, 237, 235),
                        ),
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/planticon.png',
                        height: 32,
                        width: 32,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "TDS Level",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                     SizedBox(height: 20.0,)  ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FutureBuilder<String>(
                          future: mqtt.getTdsData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return Text(
                                '${(snapshot.data)}',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                          
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          "ppm",
                          style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 30.0,
                                  color: Colors.black,
                          )
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:20.0, right: 20.0, left: 20.0),
                      child: Text(
                            "It's better to have the TDS range",
                            style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                            
                                  ),
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0, right: 20.0, left: 20.0),
                      child: Text(
                            "between 1200ppm - 1900ppm",
                            style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                            
                                  ),
                          ),
                    )
                  ]
                  ),
              ),
            ],),
        ),
      ),
         floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SideBarState(), 
            ),
          );
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF0D7817),
        shape: CircleBorder(),
        foregroundColor: Color.fromARGB(0, 25, 70, 2),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
    } 
    );
  }
}
