import 'package:get/get.dart';
import 'package:testapp/controllers/plant_controller.dart';
import 'package:testapp/data/api/api_client.dart';
import 'package:http/http.dart';
import 'package:testapp/utils/app_constants.dart';
import '../data/repository/plant_repo.dart';

Future<void> init() async {

  print("In dependencies");
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PlantRepo(apiClient: Get.find()));

  //controllers
  Get.put(PlantController(plantRepo: Get.find()));



}