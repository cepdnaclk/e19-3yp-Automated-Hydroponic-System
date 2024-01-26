import 'package:get/get.dart';
import 'package:testapp/data/repository/plant_repo.dart';
import 'package:testapp/models/plant_model.dart';


class PlantController extends GetxController {
  final PlantRepo plantRepo;

  PlantController({ required this.plantRepo});

  // late var _uniquePlant;
  // String get uniquePlant => _uniquePlant;

  List<dynamic> _plantList = [];
  List<dynamic> get plantList => _plantList; 
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPlantList() async {
    Response response = await plantRepo.getPlantList();
    if (response.statusCode == 200) {
      print("Got Plants");
      final List<dynamic> decodedList = response.body;
      _plantList = decodedList
        .map((plantJson) => PlantModel.fromJson(plantJson))
        .toList();
     //print(_plantList);
     _isLoaded = true;
      update();
    }
    else {
      
    }
  }

  



}