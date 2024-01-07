import 'package:flutter/material.dart';
import 'package:testapp/new_plant.dart';
import 'package:testapp/plant_details.dart';
import 'package:testapp/plant_log/models/Plant.dart';
import 'package:testapp/plant_log/models/plant_service.dart';
import 'package:testapp/plant_status/loading.dart';
import 'package:testapp/plant_status/plant_status.dart';
//import 'header.dart';
import 'package:http/http.dart';

class PlantLog extends StatefulWidget {
  const PlantLog({super.key});

  @override
  State<PlantLog> createState() => _PlantLogState();
}

class _PlantLogState extends State<PlantLog> {
//   late Future<List<Plant>> _futurePlants;

//   @override
//   void initState() {
//     super.initState();
//     _futurePlants = PlantService.fetchPlants();
//   }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //appBar: Header(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Text(
              "Plant Log",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          // FutureBuilder<List<Plant>>(
          //   future: _futurePlants,
          //   builder: (context,snapshot) {
          //     if (snapshot.hasData) {
          //       List<Plant> plants = snapshot.data!;
          //       return ListView.builder(
          //         itemCount: plants.length,
          //         itemBuilder: (context, index) {
          //           Plant currentPlant = plants[index];
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 25),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset(
                              "assets/aloevera.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PlantDetails(), 
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Aloe Vera',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF0D7817),
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(12, 0, 2, 0),
                                  child: Text(
                                    'Press "GO" to check the status of the plant',
                                    style: TextStyle(
                                      color: Colors.grey,
                                        fontSize: 8,
                                        fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlantStatus(), // Replace with "Loading()"
                                  ),
                                );
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF0D7817),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3), // Shadow color
                                      spreadRadius: 2, // Spread radius
                                      blurRadius: 5, // Blur radius
                                      offset: Offset(0, 3), // Offset from the button
                                    ),
                                  ],
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'GO',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    letterSpacing: 1,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  
                        ],
                      ),
                    ),
                  ),
        ]
    ),

    floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewPlant(), 
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF0D7817),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );

    
                  
          //       );
          //   } else if (snapshot.hasError) {
          //   return Center(
          //     child: Text('Error fetching data'),
          //   );
          // }
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
       // },
       //   ),
       // ],
     // ),
      
    // );
  }
}

