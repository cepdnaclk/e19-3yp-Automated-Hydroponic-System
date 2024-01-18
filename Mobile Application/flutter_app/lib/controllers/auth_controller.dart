import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AuthController {

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future loginUser() async {

    //const url = 'http://192.168.232.2:8080/api/v1/auth/authenticate';
    const url = 'http://10.0.2.2:8080/api/v1/auth/authenticate';

    print(emailController.text);
    print(passwordController.text);

    try {
        var response = await http.post(Uri.parse(url), body: jsonEncode(
          {
            "email" : emailController.text,
            "password" : passwordController.text,
          }
        ));
        print('Response body: ${response.body}');

        if (response.statusCode == 200) {
          var loginArr = json.decode(response.body);
          print(loginArr);
        } else {
          var code = response.statusCode;
          print("Authentication Failed");
          print("Status Code : $code");
        }
      } catch (e) {
        print("Error during HTTP request: $e");
      }


    // var response = await http.post(Uri.parse(url), body: jsonEncode(
    // {
    //   "email" : emailController.text,
    //   "password" : passwordController.text,
    // }
    // ));

    // if (response.statusCode == 200) {
    //   var loginArr = json.decode(response.body);
    //   print(loginArr);
    // }
    // else {
    //   print(emailController);
    //   print("Authentication Failed");
    // }

  }
}