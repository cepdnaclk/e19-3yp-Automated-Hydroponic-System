// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart';

// class Loading extends StatefulWidget {
//   const Loading({super.key});

//   @override
//   State<Loading> createState() => _LoadingState();
// }

// class _LoadingState extends State<Loading> {

//   @override
//   void initState() {
//     super.initState();
//     getSensorData();
//   }

//   void getSensorData() async {
//     Response response = await get(
//       //api
//       if(response.statusCode == 200) {
//         String data = response.body;

//         var sensorData = jsonDecode(data);

//         double tdsValue = ;
//         double phValue = ;
//         double floatSwitch = ;

//         print(tdsValue);
//         print(phValue);
//         print(floatSwitch);



//       }
//       else {
//         print(response.statusCode);
//       }
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }