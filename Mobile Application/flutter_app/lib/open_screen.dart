import 'package:flutter/material.dart';
import 'package:testapp/login_page.dart';
import 'package:get/get.dart';
import 'package:testapp/controllers/auth_controller.dart';
import 'package:testapp/routes/route_helper.dart';
import 'package:testapp/sidebar.dart';

class OpenScreen extends StatefulWidget {
  const OpenScreen({super.key});

  @override
  State<OpenScreen> createState() => _OpenScreenState();
}

class _OpenScreenState extends State<OpenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          
          onPressed: () {
            if(Get.find<AuthController>().userLoggedIn()) {
                  print("login checked");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SideBarState(), 
                    ),
                  );
            }
            else {
                  Get.toNamed(RouteHelper.loginPage);
            }
          },
          child: Text(
            'GET STARTED',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
          ),
          ),
        )
    );
  }
}