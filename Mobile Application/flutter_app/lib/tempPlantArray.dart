List<String> tempPlants = [];
//bool isThere = true;

class TempPlantArray {
  //List<String> tempPlants = [];

  TempPlantArray();

  bool toggleItemStatus(String plantName) {
    if (tempPlants.contains(plantName)) {
      tempPlants.remove(plantName);
      return false;
    } else {
      tempPlants.add(plantName);
      return true;
    }
  }

  bool getItemStatus(String plantId) {
    return tempPlants.contains(plantId);
  }
}
