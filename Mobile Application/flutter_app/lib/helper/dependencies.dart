import 'package:get/get.dart';
import 'package:testapp/controllers/plant_controller.dart';
import 'package:testapp/data/api/api_client.dart';

import '../data/repository/plant_repo.dart';

Future<void> init() async {

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "url"));

  //repos
  Get.lazyPut(() => PlantRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PlantController(plantRepo: Get.find()));


}