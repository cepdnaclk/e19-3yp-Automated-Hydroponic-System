import 'package:get/get.dart';
import 'package:testapp/data/api/api_client.dart';

class PlantRepo extends GetxService {
  final ApiClient apiClient;
  PlantRepo({ required this.apiClient});

  Future<Response> getPlantList() async {
    return await apiClient.getData("end point url");
  }

}