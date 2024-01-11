// import 'package:flutter/material.dart';
// import 'package:testapp/plant_status/mqtt_client.dart';
// import 'package:testapp/static_header.dart';
// //import 'header.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class PlantStatus extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: StaticHeader(),
//       body: Center(
//         child: Text(
//           'Show Sensor Data',
//           style: TextStyle(
//             fontFamily: 'Poppins',
//           ),
//         ),
//       ),
//     );
//   }
// }





// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:mqtt_client/mqtt_client.dart';
// import 'package:testapp/plant_status/certificates.dart';
// import 'package:testapp/static_header.dart'; 
// import 'package:mqtt_client/mqtt_server_client.dart';

// import 'package:flutter/services.dart' show rootBundle;

// class PlantStatus extends StatefulWidget {
//   const PlantStatus({Key? key}) : super(key: key);

//   @override
//   State<PlantStatus> createState() => _PlantStatusState();
// }

// class _PlantStatusState extends State<PlantStatus> {
//   late MqttClient client;
//   bool isTdsSwitched = false;
//   bool isAcidSwitched = false;

//   int tdsValue = 0; // Example sensor values
//   int phValue = 0;
//   int floatSwitchValue = 0;

//   @override
//   void initState() {
//   super.initState();
//   connectToMqtt();
//   }

  


// void connectToMqtt() async {
//   client = MqttClient('a398am5o3vbqfl-ats.iot.ap-south-1.amazonaws.com', 'client_id');
//   client.port = 8883; // MQTT over TLS port for AWS IoT Core

//   // Configure other necessary parameters (security credentials, etc.)
//   SecurityContext context = SecurityContext.defaultContext
//     ..setTrustedCertificatesBytes(utf8.encode(Certificates.AWS_CERT_CA))
//     ..useCertificateChainBytes(utf8.encode(Certificates.AWS_CERT_CRT))
//     ..usePrivateKeyBytes(utf8.encode(Certificates.AWS_CERT_PRIVATE));

//   try {
//     await client.connect(context: context); // Connect to AWS IoT Core with the security context
//     client = MqttClient('a398am5o3vbqfl-ats.iot.ap-south-1.amazonaws.com', 'client_id');
//     client.port = 8883; // MQTT over TLS port for AWS IoT Core
//     client.secure = true; // Enable secure connection
//     client.securityContext = context; // Set the security context

//     await client.connect();

//     // Subscribe to the three MQTT topics
//     client.subscribe('phsensor', MqttQos.atMostOnce);
//     client.subscribe('tdssensor', MqttQos.atMostOnce);
//     client.subscribe('floatsensor', MqttQos.atMostOnce);

//     // Listen for incoming MQTT messages
//     client.updates?.listen((List<MqttReceivedMessage<MqttMessage>>? c) {
//       if (c != null && c.isNotEmpty) {
//         final receivedMessage = c[0].payload.toString();
//         final topic = c[0].topic;

//         // Parse received messages from different topics and update UI accordingly
//         if (topic == 'tdssensor') {
//           setState(() {
//             tdsValue = int.tryParse(receivedMessage) ?? 0; // Update tdsValue
//           });
//         } else if (topic == 'phsensor') {
//           setState(() {
//             phValue = int.tryParse(receivedMessage) ?? 0; // Update phValue
//           });
//         } else if (topic == 'floatsensor') {
//           setState(() {
//             floatSwitchValue = receivedMessage == '1' ? 1 : 0; // Update floatSwitchValue
//           });
//         }
//       }
//     });
//   } catch (e) {
//     print('Connection failed: $e');
//     // Handle the connection failure, possibly with UI feedback or retries.
//   }
// }

// void connectToMQTT() async {
//   String uniqueId = 'client_id'; // Replace with your unique identifier
//   bool isConnected = await MQTT_Service.mqttConnect(uniqueId);

//   if (isConnected) {
//     // Connection successful, perform actions or update UI accordingly
//     print('Connected to MQTT');
//   } else {
//     // Handle failed connection
//     print('Failed to connect to MQTT');
//   }
// }



//   Color getColor(int sensorValue) {
//     if (sensorValue < 20) {
//       return Colors.red;
//     } else if (sensorValue >= 20 && sensorValue < 40) {
//       return Colors.green;
//     }
//     return Colors.black; 
//   }
/*
  @override
  void dispose() {
    client.disconnect();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Plant Status'),
      // ),
      appBar: StaticHeader(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'TDS Value', // Display TDS value
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        
                        ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$tdsValue', // Display TDS value
                          style: TextStyle(
                            fontSize: 80,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: getColor(tdsValue),
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: Text(
                            ' ppm', // Display TDS value
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: getColor(tdsValue),
                              ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Switch(
                            value: isTdsSwitched, 
                            onChanged: (value) {
                              setState(() {
                                isTdsSwitched = value;
                              });
                            }
                          ),
                          Text(
                            'Turn ON/OFF the Nutrient pump',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: Color.fromARGB(255, 50, 49, 49),
                              ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'pH Value', // Display ph value
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        //color: Color(0xFF0D7817),
                        ),
                    ),
                    Text(
                      '$phValue', // Display ph value
                      style: TextStyle(
                        fontSize: 80,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: getColor(phValue),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               Switch(
                                value: isAcidSwitched, 
                                onChanged: (value) {
                                  setState(() {
                                    isAcidSwitched = value;
                                  });
                                }
                               ),
                               Text(
                                'Turn ON/OFF the Acid pump',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 50, 49, 49),
                                  ),
                               ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               Switch(
                                value: isAcidSwitched, 
                                onChanged: (value) {
                                  setState(() {
                                    isAcidSwitched = value;
                                  });
                                }
                               ),
                               Text(
                                'Turn ON/OFF the Base pump',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 50, 49, 49),
                                  ),
                               ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Float Switch', // Display fs value
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        //color: Color(0xFF0D7817),
                        
                        ),
                    ),
                    Text(
                      '$floatSwitchValue', // Display fs value
                      style: TextStyle(
                        fontSize: 80,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: getColor(floatSwitchValue),
                        ),
                    ),
                  ],
                ),
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}


*/




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
     appBar: StaticHeader(),
     body: Center(child: Text('Sensor data')),
      // body: Column(
      //   children: [
      //     Column(
      //       children: [
      //         Center(
      //           child: Text(
      //             "pH Value",
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontFamily: 'Poppins',
      //               fontSize: 30,
      //             ),
      //           ),
      //           ),
      //         Center(
      //           child: Text(
      //             "32"+" ml",
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontFamily: 'Poppins',
      //               fontSize: 30,
      //             ),
      //           ),
      //           ),
      //       ],
      //     ),
      //       Column(
      //         children: [
      //           Center(
      //           child: Text(
      //             "Nutrition Value",
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontFamily: 'Poppins',
      //               fontSize: 30,
      //             ),
      //           ),
      //           ),
      //         ],
      //       ),
      //       Column(
      //         children: [
      //           Center(
      //           child: Text(
      //             "32"+" ml",
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontFamily: 'Poppins',
      //               fontSize: 30,
      //             ),
      //           ),
      //           ),
      //         ],
      //       ),
      //       Column(
      //       children: [
      //         Center(
      //           child: Text(
      //             "Water Level",
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontFamily: 'Poppins',
      //               fontSize: 30,
      //             ),
      //           ),
      //           ),
      //         Center(
      //           child: Text(
      //             getWaterLevelText(15),
      //             style: TextStyle(
      //               color: getWaterLevelColor(15),
      //               fontFamily: 'Poppins',
      //               fontSize: 30,
      //             ),
      //           ),
      //           ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
