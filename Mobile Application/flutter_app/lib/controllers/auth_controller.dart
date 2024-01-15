import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AuthController {

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future loginUser() async {

    const url = 'https://192.168.232.2:8080/api/v1/auth/authenticate';
    //const url = 'https://localhost:8080/api/v1/auth/authenticate';

    var response = await http.post(Uri.parse(url), body: jsonEncode(
    {
      "username" : emailController.text,
      "password" : passwordController.text,
    }
    ));

    if (response.statusCode == 200) {
      var loginArr = json.decode(response.body);
      print(loginArr);
    }
    else {
      print(emailController);
      print("Authentication Failed");
    }

  }
}