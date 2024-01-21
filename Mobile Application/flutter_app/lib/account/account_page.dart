import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controllers/auth_controller.dart';
import 'package:testapp/routes/route_helper.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

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
                      size: 18,
                      color: Color(0xFF0D7817),
                    ),
                  ),
                ),
              ],
            ),
          Container(
                    margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                      image: DecorationImage(
                        //should come from the network
                        image: AssetImage("assets/Profile.jpg"),
                      ),
                    ),
              ),
          SizedBox(height: 20.0),
          Text(
            "Yashoda" + " " +" De Silva",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 17,
              color: Color(0xFF0D7817),
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "yashodhasilva@gmail.com",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              color: Color(0xFF0D7817),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 30.0),
            
            child: Center(
              child: TextButton(
                onPressed: () {
                  if (Get.find<AuthController>().userLoggedIn()) {
                    Get.find<AuthController>().clearSharedData();
                    Get.offNamed(RouteHelper.initial);
                  }
                  
                }, 
                child: Text(
                  'Logout ?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 17, 73, 216),
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}