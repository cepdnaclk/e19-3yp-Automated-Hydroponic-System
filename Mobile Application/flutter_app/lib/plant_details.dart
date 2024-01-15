import 'package:flutter/material.dart';

class PlantDetails extends StatelessWidget {
  final String text;
  const PlantDetails({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage(
                    "assets/aloevera.jpg",

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0D7817),
                    ),
                  ),
                  
                  SizedBox(height: 25.0),
              
                  Text(
                    "Description goes here. This can be a longer description text.",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                    ),
                  ),
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
