import 'package:get/get.dart';
import 'package:testapp/open_screen.dart';
import 'package:testapp/plant_details.dart';

class RouteHelper {
  static const String initial = "/";
  static const String plantDetails = "/plant-detail";

  static String getInitial()=> '$initial';
  static String getPlantDetails(int pageId)=> '$plantDetails?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=> OpenScreen()),
    GetPage(name: plantDetails, page: () {
      var pageId = Get.parameters['pageId'];
      return PlantDetails(pageId: pageId != null ? int.parse(pageId) : 0);
    },
      transition: Transition.fadeIn
    ),
  ];
}