import 'package:get/get.dart';
import 'package:testapp/data/api/api_client.dart';
import 'package:testapp/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class MqttRepo extends GetxService {
  final ApiClient apiClient;
  MqttRepo({required this.apiClient});

  Future<Response> getIoTData() async {
    return await apiClient.postIot(AppConstants.IOT_CONNECT);
  }

  Future<Response> subscribeToTopics() async {
    return await apiClient.getData(AppConstants.SUBSCRIBE);
  }

  Future<Response> getPhData() async {
    return await apiClient.getData(AppConstants.PH_DATA);
  }

  Future<Response> getTdsData() async {
    return await apiClient.getData(AppConstants.PH_DATA);
  }

}
