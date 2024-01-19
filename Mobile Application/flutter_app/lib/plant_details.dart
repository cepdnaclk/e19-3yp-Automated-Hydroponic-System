import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controllers/plant_controller.dart';
import 'package:testapp/widgets/expandable_text.dart';

class PlantDetails extends StatelessWidget {
  //final String text;
  final int pageId;
  const PlantDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var plant = Get.find<PlantController>().plantList[pageId];
    print("Page Id is "+pageId.toString());
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            child: Container(
              width: double.maxFinite,
              height: 370,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.pexels.com/photos/1454288/pexels-photo-1454288.jpeg?auto=compress&cs=tinysrgb&w=600"
                    //"https://images.pexels.com/photos/1840270/pexels-photo-1840270.jpeg?auto=compress&cs=tinysrgb&w=600",
                    //"assets/aloevera.jpg",

                  ),
                  fit: BoxFit.cover, 
                ),
              ),
            ),
          ),
          
          Positioned(
            top: 340.0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(top: 40,right: 30, left: 30),
              decoration: BoxDecoration(
                color: Color(0xFFF5F9F2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plant.name!,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0D7817),
                    ),
                  ),

                  SizedBox(height: 20.0),

                  Text(
                    "Your Happy, Healthy Plant!",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height:14.0),

                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(
                        text: plant.details!,
                       //text: "HI",
                        //text: "Meet Aloe Vera, the green superhero of your garden! Originally from the Arabian Peninsula, this special plant with thick, green leaves is famous worldwide. Its magical gel is loaded with vitamins and good things, making it a natural remedy for happy skin and a healthy you. Aloe Vera is a skin spa, healing cuts and enhancing beauty. Sip its juice for a stomach hug, and harness essential nutrients for overall well-being. Your health's best friend! For Aloe Vera joy in hydroponics, aim for a slightly sour pH (6.0-7.0) – like lemonade. Maintain TDS sensor levels at 1000-1600 ppm for the perfect nutrient mix. Aloe Vera ensures a happy, green paradise!",
                        ),
                    ),
                  )
                ],
              ),
            ),
          )
          
        ],
      )
    );
  }
}






















/*
class PlantDetails extends StatefulWidget {
  const PlantDetails({super.key});

  @override
  State<PlantDetails> createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //appBar: Header(),
      appBar: StaticHeader(),
      body: Stack(
        children: [
          Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Text(
                  "Aloe Vera",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Center(
              child: Image.asset(
                "assets/aloevera.jpg",
                fit: BoxFit.contain,
                height: 300,
                width: 300,
              ),
            ),
            Container(
              padding: EdgeInsets.all(25.0),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "CropID : 123",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    "Description goes here. This can be a longer description text.",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
          Positioned(
            bottom: 20,
            left: 60,
            right: 60,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.0), // Adjust padding as needed
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlantStatus(), // Replace YourAddPage with the add page widget
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    elevation:10,
                    shadowColor: Color(0xFF0D7817),
                    backgroundColor: Color(0xFF0D7817),
                    minimumSize: const Size.fromHeight(60),
                  ),
                  child: const Text(
                    "GO TO STATUS",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
