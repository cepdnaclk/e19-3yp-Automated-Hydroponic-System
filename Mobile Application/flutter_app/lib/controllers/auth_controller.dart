import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:testapp/controllers/mqtt_controller.dart';
import 'package:testapp/data/repository/auth_repo.dart';
import 'package:testapp/models/response_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController ({
    required this.authRepo,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> login(String email, String password) async {
    _isLoading = true;
    update();

    print("In authController");

    Response response = await authRepo.login(email, password);

    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["access_token"]);
      responseModel = ResponseModel(true, response.body["access_token"]);
      print("token: "+ response.body["access_token"]);
      Get.find<MqttController>().getIoTData();
    }
    else {
      var code = response.statusCode;
      print("status code of your error : $code");
      responseModel = ResponseModel(false, ("$code Error : Authentication Failed"));
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserEmailAndPassword(String email, String password) async {
    authRepo.saveUserEmailAndPassword(email, password);
  }

  bool userLoggedIn(){
    return authRepo.userLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }

}

//     const url = 'http://10.0.2.2:8080/api/v1/auth/authenticate';

//     print(emailController.text);
//     print(passwordController.text);