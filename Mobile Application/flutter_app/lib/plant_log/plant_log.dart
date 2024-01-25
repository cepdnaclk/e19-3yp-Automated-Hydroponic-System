import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controllers/auth_controller.dart';
import 'package:testapp/controllers/mqtt_controller.dart';
import 'package:testapp/controllers/plant_controller.dart';
import 'package:testapp/new_plant.dart';
import 'package:testapp/plant_details.dart';
// import 'package:testapp/plant_log/models/Plant.dart';
// import 'package:testapp/plant_log/models/plant_service.dart';
// import 'package:testapp/plant_status/loading.dart';
import 'package:testapp/dustbin/plant_status/plant_status.dart';
//import 'header.dart';
import 'package:http/http.dart';
import 'package:testapp/plant_status.dart';
import 'package:testapp/routes/route_helper.dart';
import 'package:testapp/tempPlantArray.dart';
import 'package:testapp/utils/app_constants.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';



class PlantLog extends StatefulWidget {
  const PlantLog({super.key});

  @override
  State<PlantLog> createState() => _PlantLogState();
}

class _PlantLogState extends State<PlantLog> {

  //TempPlantArray tempPlantArray = TempPlantArray();

//   late Future<List<Plant>> _futurePlants;

//   @override
//   void initState() {
//     super.initState();
//     _futurePlants = PlantService.fetchPlants();
//   }

  @override
  Widget build(BuildContext context) {

    MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
        final getColor = (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return colorPressed;
          }
          else {
            return color;
          }
        };
        return MaterialStateProperty.resolveWith(getColor);
    }

    return Scaffold(
      //appBar: Header(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0,right: 60.0,left: 60.0,bottom: 40.0),
            child: ElevatedButton(
              onPressed: () {

                if(Get.find<AuthController>().userLoggedIn()) {
                  print("login checked");
                  Get.find<MqttController>().subscribeToTopics();
                  Get.find<MqttController>().getPhData();
                  Get.find<MqttController>().getTdsData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlantStatus(), 
                    ),
                  );
                }
                else {
                  Get.toNamed(RouteHelper.loginPage);
                }
              }, 
              style: ButtonStyle(
                shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
                elevation: MaterialStateProperty.all<double>(5),
                shadowColor: MaterialStateProperty.all<Color>(Color(0xFF0D7817)),
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0D7817)),
                minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(60)),
                overlayColor: getColor(Color.fromARGB(255, 7, 148, 33), Color.fromARGB(255, 9, 43, 13)),
              ),
                    child: const Text(
                      "CHECK OUT THE PLANTS",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                      ),
                    ),
            ),
          ),

          Divider(
            height: 1.0,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text(
              "Plant Log",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            ),
          ),

          GetBuilder<PlantController>(builder: (plant) {
            return plant.isLoaded ? Expanded(
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              //plant.(tempPlants[index]);
              //shrinkWrap: true,
              //itemCount: 5,

              itemCount: tempPlants.length,
              itemBuilder: (context,index) {
                return GestureDetector(
                  onTap: () {
                    //print("index is : $index");
                    Get.toNamed(RouteHelper.getPlantDetails(int.parse(tempPlants[index])-1));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
                    child: Row(
                      children: [
                        Container(
                          width: 160,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Color.fromARGB(97, 89, 135, 64),
                            
                            image: DecorationImage(
                              image: AssetImage(
                                //"https://images.pexels.com/photos/1454288/pexels-photo-1454288.jpeg?auto=compress&cs=tinysrgb&w=600"
                                //(AppConstants.BASE_URL + "/api/v1/auth/plants/" + (tempPlants[index])),
                                
                                "assets/aloevera.jpg"
                              ), 
                              fit: BoxFit.cover,
                            )
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: Color(0xFFE9F1E4),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top:20.0,left: 20.0, right: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    plant.plantList[int.parse(tempPlants[index])-1].name!,
                                    //'Aloe Vera',
                                    //plant.uniquePlant.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      color: Color(0xFF0D7817),
                                    ),
                                  ),
                                  Text(
                                    plant.plantList[int.parse(tempPlants[index])-1].details!,
                                    //'Description is something like this I think this will work fine! Please do work fine !!!',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ],
                              ), 
                            ),
                          ),
                        )
                      ]
                      ),
                  ),
                );
              }
            ),
          ) : Center(child: Container(
            height: 70,
            width: 70,
            child: CircularProgressIndicator( color: Color(0xFF0D7817))));
          }) 

////////////////////////////////////////// CARD /////////////////////////////////////////////////

                /*  Card(
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
                              "assets/aloevera.jpg", //from JSON
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            flex: 3,
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
                                    'Aloe Vera', //from JSON
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF0D7817),
                                        decoration: TextDecoration.underline,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(12, 0, 2, 0),
                                  child: Text(
                                    'Press "GO TO STATUS" button to check the status of the plant',
                                    style: TextStyle(
                                      color: Colors.grey,
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  
                        ],
                      ),
                    ),
                  ),*/
        ]
    ),

    floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(Get.find<AuthController>().userLoggedIn()) {
                  print("login checked");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewPlant(), 
                    ),
                  );
          }
          else {
                  Get.toNamed(RouteHelper.loginPage);
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF0D7817),
        shape: CircleBorder(),
        foregroundColor: Color.fromARGB(0, 25, 70, 2),
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// FutureBuilder<List<Plant>>(
          //   future: _futurePlants,
          //   builder: (context,snapshot) {
          //     if (snapshot.hasData) {
          //       List<Plant> plants = snapshot.data!;
          //       return ListView.builder(
          //         itemCount: plants.length,
          //         itemBuilder: (context, index) {
          //           Plant currentPlant = plants[index];


/*
                          Expanded(
                            flex: 0,
                            
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
                          ),*/