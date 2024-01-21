import 'package:flutter/material.dart';

class AppConstants {
  static const Color MAIN_COLOR = Color(0xFF085810);
  static const String APP_NAME = "HydrpGrowPro";
  static const int APP_VERSION = 1;

  static const String BASE_URL = "http://10.0.2.2:8080";

  //plant endpoints
  static const String ALL_PLANTS = "/api/v1/auth/plants/all";
  //static const String PLANT_BY_ID = "/api/v1/auth/plants/2";

  //auth endpoints
  static const String  LOGIN_URI= "/api/v1/auth/authenticate";

  static const String TOEKN = "";
  static const String EMAIL = "";
  static const String PASSWORD = "";

  // Selected Plants array
  List<String> SELECTED_PLANTS = [];
  
}