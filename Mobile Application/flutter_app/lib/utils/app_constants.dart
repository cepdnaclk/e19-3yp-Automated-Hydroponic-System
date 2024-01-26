import 'package:flutter/material.dart';

class AppConstants {
  static const Color MAIN_COLOR = Color(0xFF085810);
  static const String APP_NAME = "HydrpGrowPro";
  static const int APP_VERSION = 1;

  static const String BASE_URL = "http://10.0.2.2:8080";

  //plant endpoints
  static const String ALL_PLANTS = "/api/v1/auth/plants/all";

  //auth endpoints
  static const String  LOGIN_URI= "/api/v1/auth/authenticate";

  //mqtt endpoints
  static const String IOT_CONNECT = "/api/v1/auth/connect-iot";
  static const String IOT_DISCONNECT = "/api/v1/auth/connect-iot";
  static const String SUBSCRIBE = "/api/v1/auth/subscribeToTopics";

  //topics
  static const String PH_DATA = "/api/v1/auth/get-ph-data";
  static const String TDS_DATA = "/api/v1/auth/get-tds-data";

  static const String TOEKN = "";
  static const String EMAIL = "";
  static const String PASSWORD = "";

  // Selected Plants array
  List<String> SELECTED_PLANTS = [];
  
}