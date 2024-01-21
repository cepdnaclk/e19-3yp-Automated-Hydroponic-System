import 'package:testapp/storage/data_storage.dart';

List<String> tempPlants = [];
//bool isThere = true;

class TempPlantArray {
  //List<String> tempPlants = [];

  TempPlantArray();

  Future<void> toggleItemStatus(String plantId) async {
    tempPlants = await DataStorage.loadSelectedPlants();

    if (tempPlants.contains(plantId)) {
      tempPlants.remove(plantId);
    } else {
      tempPlants.add(plantId);
    }

    await DataStorage.saveSelectedPlants(tempPlants);
  }

  // bool toggleItemStatus(String plantName) {
  //   if (tempPlants.contains(plantName)) {
  //     tempPlants.remove(plantName);
  //     return false;
  //   } else {
  //     tempPlants.add(plantName);
  //     return true;
  //   }
  // }

  bool getItemStatus(String plantId) {
    return tempPlants.contains(plantId);
  }
}
