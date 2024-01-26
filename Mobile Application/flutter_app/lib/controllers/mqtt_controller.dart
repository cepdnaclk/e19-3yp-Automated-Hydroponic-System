import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/base/show_custom_message.dart';
import 'package:testapp/data/repository/mqtt_repo.dart';

class MqttController extends GetxController {
  final MqttRepo mqttRepo;

  MqttController({required this.mqttRepo});

  bool _isConnected = false;
  bool get isConnected => _isConnected;

  // Connection to IoT ("/connect-iot")
  Future<void> getIoTData() async {
    Response response = await mqttRepo.getIoTData(); 
    if (response.statusCode == 200) {
      _isConnected = true;
      showCustomSnackbar("Successfully connected to your Hydroponic System!", title: "Congratulations !!!");
      print("Successfully connected to IoT device!");
    } else {
      showCustomSnackbar("You're not connected! Try Login again", title: "Error!");
      print("Status code of connect-iot is ${response.statusCode}. Try again, please.");
    }
    _isConnected = false;
    update();
  }

  // Disonnection to IoT ("/disconnect-iot")
  Future<void> disconnectIoT() async {
    Response response = await mqttRepo.disconnectIoT(); 
    if (response.statusCode == 200) {
      print("Successfully disconnected IoT device!");
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
  Future<double> getPhData() async {
  Response response = await mqttRepo.getPhData(); 
  if (response.statusCode == 200) {
    print("pH_data = ${response.body}");

    try {
      //double phValue = double.parse(response.body);
      print("Successfully got the pH data");
      return response.body;
    } catch (e) {
      print("Error parsing pH data: $e");
      return 3.0; // or any default value
    }
  } else {
    print("Status code of ph data is ${response.statusCode}. Try again, please.");
    return 6.0; // or any default value
  }
}


  // ("//get-tds-data")
  Future<double> getTdsData() async {
    Response response = await mqttRepo.getTdsData(); 
    if (response.statusCode == 200) {
      print("tds_data = ${(response.body).toString()}");
      print("Successfully got the tds data");
      return response.body;
    } else {
      print("Status code of tds data is ${response.statusCode}. Try again, please.");
      return 3.0;
    }
  }

}
