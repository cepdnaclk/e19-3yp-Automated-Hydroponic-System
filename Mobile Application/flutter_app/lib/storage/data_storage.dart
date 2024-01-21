import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  static const String SELECTED_PLANTS_KEY = 'selectedPlants';

  static Future<void> saveSelectedPlants(List<String> array) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(SELECTED_PLANTS_KEY, array);
    } catch (e) {
      print('Error saving selected plants: $e');
      throw e;
    }
  }

  static Future<List<String>> loadSelectedPlants() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getStringList(SELECTED_PLANTS_KEY) ?? [];
    } catch (e) {
      print('Error loading selected plants: $e');
      throw e;
    }
  }
}
