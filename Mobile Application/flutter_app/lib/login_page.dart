//import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:testapp/base/show_custom_message.dart';
import 'package:testapp/controllers/auth_controller.dart';
//import 'package:testapp/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:testapp/controllers/mqtt_controller.dart';
import 'package:testapp/plant_log/plant_log.dart';
import 'package:testapp/routes/route_helper.dart';
import 'package:testapp/sidebar.dart';
//import 'package:testapp/plant_log/plant_log.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Size mediaSize;
  late Color myGreenColor;
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  void _login(AuthController authController) {

      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackbar("Sorry you have to fill all the fields!", title: "Field Error");
      }
      else if(!GetUtils.isEmail(email)) {
        showCustomSnackbar("It is not a valid email address!", title: "Email Address");
      }
      else if(password.isEmpty) {
        showCustomSnackbar("Sorry you have to fill all the fields!", title: "Field Error");
      }
      else {
        authController.login(email, password).then((status){
          if(status.isSuccess) {
            Get.toNamed(RouteHelper.getPlantLog());
            showCustomSnackbar("You are now in the system", title: "Congratulations !!!");
            print("Successful Authentication");
          }
          else {
            showCustomSnackbar(status.message);
          }
        });
      }
    }

  @override
  Widget build(BuildContext context) {
    
    myGreenColor = const Color(0xFF0D7817);
    mediaSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: myGreenColor,
        image: DecorationImage(image: AssetImage("assets/Login.png"))
      ),
      child: Scaffold(
      body: Stack(children: [
        Positioned(top: 0, child: _buildTop()),
        Positioned(bottom: 0, child: _buildBottom()),
      ]),
            )
    );
  }

  Widget _buildTop(){
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        color: myGreenColor,
        child: Padding(
          //padding: const EdgeInsets.all(32.0),
          padding: const EdgeInsets.only(left: 32.0, top: 32.0, right: 32.0, bottom: 120.0),
          child: Image.asset(
              "assets/Login.png",
              height: 350,
          ),
        ),
      ),
    );
  }

  Widget _buildBottom(){
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome",
            style: TextStyle(
              color: myGreenColor,
              fontSize: 32,
              fontWeight: FontWeight.w800,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(width: 8), // Add some space between the text and image
          Image.asset(
            'assets/planticon.png',
            height: 32,
            width: 32,
          ),
        ],
      ),
        const SizedBox(height: 30),
        _buildText("Enter your Email Address"),
        _buildInputField(emailController, false),
        const SizedBox(height: 30),
        _buildText("Enter your Password"),
        _buildInputField(passwordController, true),
        _buildRememberForgot(),
        const SizedBox(height: 40),
        _buildLoginButton(),
        const SizedBox(height: 40),

    ],
    );
  }

  Widget _buildText(String input) {
    return Text(
        input,
        style: TextStyle(
          fontFamily: 'Poppins',
        ),
    );
  }

  Widget _buildInputField(TextEditingController controller, bool isObsecure){
    return TextField(
      obscureText: isObsecure,
      controller: controller,
      decoration: InputDecoration(
        //hintText: 'Type Here',
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 10,
          color: Colors.grey,
        )
        //suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      //obscureText: isPassword,
    );
  }

  Widget _buildRememberForgot(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: (){
            Get.toNamed(RouteHelper.getPlantLog());
            Get.find<MqttController>().getIoTData();
          },
          child: Text("Check out the App",
            style: TextStyle(
              fontSize: 10,
              fontFamily: 'Poppins',
              color: Colors.blueAccent
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(){

    return GetBuilder<AuthController>(builder: (authController) {
      return !authController.isLoading ? ElevatedButton(

      onPressed: ()  {
        _login(authController);
      },

      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myGreenColor,
        backgroundColor: myGreenColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text("LOGIN",
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: 3.0,
        ),
      ),
    ) : Center(child: CircularProgressIndicator( color: Color(0xFF0D7817)));
    });
  }

}
















// if (emailController.text == 'customer@gmail.com' && passwordController.text == 'customer123') {
        //   Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(builder: (context) => SideBarState()),
        //     );
        // }
        // else {
        //   print('Failed to authenticate');
        //   Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(builder: (context) => LoginPage()),
        //     );
        // }
        // Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(builder: (context) => SideBarState()),
        //     );
        // String email = emailController.text;
        // String password = passwordController.text;

        // var url = Uri.http('https://localhost:8080/api/v1/auth/authenticate'); // api
        // var response = await http.post(url, body: {
        //   "email" : email,
        //   "password" : password,
        // });

        //if (response.statusCode == 200) {
            // Successful authentication
            //var responseData = json.decode(response.body);
            // Handle the responseData, such as setting authentication tokens or navigating to the next screen
            

          // } else {
            // Error in authentication
            //print('Failed to authenticate. Status code: ${response.statusCode}');
            //print('Response body: ${response.body}');
            // Display an error message to the user or handle the error accordingly
          //}
        //according to PHP file

