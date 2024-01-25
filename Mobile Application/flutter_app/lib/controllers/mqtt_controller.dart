import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/data/repository/mqtt_repo.dart';

class MqttController extends GetxController {
  final MqttRepo mqttRepo;

  MqttController({required this.mqttRepo});

  // Connection to IoT ("/connect-iot")
  Future<void> getIoTData() async {
    Response response = await mqttRepo.getIoTData(); 
    if (response.statusCode == 200) {
      print("Successfully connected to IoT device!");
    } else {
      print("Status code of connect-iot is ${response.statusCode}. Try again, please.");
    }
  }

  // Subscribe to topics ("/subscribeToTpics")
  Future<void> subscribeToTopics() async {
    Response response = await mqttRepo.subscribeToTopics(); 
    if (response.statusCode == 200) {
      print("Successfully subscribed to the topics");
    } else {
      print("Status code of subscribeToTopics is ${response.statusCode}. Try again, please.");
    }
  }

  // ("//get-ph-data")
  Future<String> getPhData() async {
    Response response = await mqttRepo.getPhData(); 
    if (response.statusCode == 200) {
      print("pH_data = ${response.body}");
      return (response.body).toString();
      print("Successfully got the pH data");
    } else {
      print("Status code of ph data is ${response.statusCode}. Try again, please.");
      return "null";
    }
  }

  // ("//get-tds-data")
  Future<String> getTdsData() async {
    Response response = await mqttRepo.getTdsData(); 
    if (response.statusCode == 200) {
      print("tds_data = ${(response.body).toString()}");
      print("Successfully got the tds data");
      return (response.body).toString();
    } else {
      print("Status code of tds data is ${response.statusCode}. Try again, please.");
      return "null";
    }
  }

}
