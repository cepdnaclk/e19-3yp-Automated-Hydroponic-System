import 'dart:ffi';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                  child: IconButton(
                    onPressed: () {
                      // Handle onPressed action
                    },
                    icon: Icon(
                      Icons.edit,
                      size: 16,
                      color: Color(0xFF0D7817),
                    ),
                  ),
                ),
              ],
            ),
          Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/Profile.jpg"),
                  ),
                ),
          ),
          Text(
            "Yashoda De Silva",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              color: Color(0xFF0D7817),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              "Farmer ID : 12",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),

          Divider(thickness: 0.2,),

          Padding(
            padding: const EdgeInsets.only(top:20.0,left: 40.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Plants owned",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20.0,left: 40.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image(
                    //size: 14,
                    height: 15.0,
                    image: AssetImage("assets/planticon.png"),
                    // Additional properties like size, color, etc., can be added here
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    "Aloe Vera",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}