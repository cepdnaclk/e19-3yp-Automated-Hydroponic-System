import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/controllers/mqtt_controller.dart';
import 'package:testapp/data/api/api_client.dart';
import 'package:testapp/utils/app_constants.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences
  });

  bool userLoggedIn(){
    return sharedPreferences.containsKey(AppConstants.TOEKN);
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppConstants.TOEKN) ?? "None";
  }

  Future<Response> login(String email, String password) async{
    print("In AuthRepo");
    return await apiClient.postData(AppConstants.LOGIN_URI, {
      "email" : email,
      "password" : password,
    });
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token  = token;
    apiClient.updateHeader(token);
    
    return await sharedPreferences.setString(AppConstants.TOEKN, token);
  }

  Future<void> saveUserEmailAndPassword(String email, String password) async {
    try{
      await sharedPreferences.setString(AppConstants.EMAIL, email);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    }
    catch(e) {
      throw e;
    }
  }

  // Future<void> saveSelectedPlants(List<String> array) async {
  //   try{
  //     await sharedPreferences.setStringList(AppConstants.SELECTED_PLANTS, array);
  //   }
  //   catch(e) {
  //     throw e;
  //   }
  // }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.TOEKN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.EMAIL);
    apiClient.token = '';
    apiClient.updateHeader('');
    Get.find<MqttController>().disconnectIoT();
    return true;
  }

}