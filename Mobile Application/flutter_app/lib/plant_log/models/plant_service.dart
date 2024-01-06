import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Plant.dart'; // Import the Plant model

class PlantService {
  static Future<List<Plant>> fetchPlants() async {
    final response = await http.get(Uri.parse('https://backend-url/plants')); //put the correct api

    if (response.statusCode == 200) {
      // Parse the JSON response and create Plant objects
      List<dynamic> plantData = json.decode(response.body);
      List<Plant> plants = plantData.map((json) => Plant.fromJson(json)).toList();
      return plants;
    } else {
      throw Exception('Failed to fetch plant data');
    }
  }
}
