import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/controllers/auth_controller.dart';
import 'package:testapp/controllers/plant_controller.dart';
import 'package:testapp/data/api/api_client.dart';
import 'package:http/http.dart';
import 'package:testapp/data/repository/auth_repo.dart';
import 'package:testapp/utils/app_constants.dart';
import '../data/repository/plant_repo.dart';

Future<void> init() async {

  // print("In dependencies");

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PlantRepo(apiClient: Get.find()));
  Get.lazyPut(() => PlantRepo(apiClient: Get.find()));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //controllers
  Get.put(PlantController(plantRepo: Get.find()));
  Get.put(AuthController(authRepo: Get.find()));

  print("In dependencies");

}