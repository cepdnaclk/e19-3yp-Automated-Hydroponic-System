import 'package:get/get.dart';
import 'package:testapp/data/repository/plant_repo.dart';

class PlantController extends GetxController {
  final PlantRepo plantRepo;

  PlantController({ required this.plantRepo});

  List<dynamic> _plantList = [];
  List<dynamic> get plantList => _plantList; //using plantList, we will be able to read data easily in the UI. It'll be a simple list.

  Future<void> getPlantList() async {
    Response response = await plantRepo.getPlantList();
    if (response.statusCode == 200) {
      _plantList = [];
     // _plantList.addAll(model);
      update();
    }
    else {
      
    }
  }
}