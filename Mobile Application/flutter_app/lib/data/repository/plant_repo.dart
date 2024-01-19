import 'package:get/get.dart';
import 'package:testapp/data/api/api_client.dart';
import 'package:testapp/utils/app_constants.dart';

class PlantRepo extends GetxService {
  final ApiClient apiClient;
  PlantRepo({ required this.apiClient});

  Future<Response> getPlantList() async {
    return await apiClient.getData(AppConstants.ALL_PLANTS);
  }

  Future<Response> getPlant(int plantId) async {
    return await apiClient.getData("/api/v1/auth/plants/$plantId");
  }

}