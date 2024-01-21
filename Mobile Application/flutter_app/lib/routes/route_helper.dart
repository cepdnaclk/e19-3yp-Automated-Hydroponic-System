import 'package:get/get.dart';
import 'package:testapp/login_page.dart';
import 'package:testapp/open_screen.dart';
import 'package:testapp/plant_details.dart';
import 'package:testapp/sidebar.dart';

class RouteHelper {
  static const String initial = "/";
  static const String plantDetails = "/plant-detail";
  static const String plantLog = "/plant-log";
  static const String loginPage = "/login";

  static String getInitial()=> '$initial';
  static String getPlantLog()=> '$plantLog';
  static String getLoginPage()=> '$loginPage';
  static String getPlantDetails(int pageId)=> '$plantDetails?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=> OpenScreen()),
    GetPage(name: plantLog, page: ()=> SideBarState()),
    GetPage(name: loginPage, page: ()=> LoginPage(),
      transition: Transition.fade,
    ),
    GetPage(name: plantDetails, page: () {
      var pageId = Get.parameters['pageId'];
      return PlantDetails(pageId: pageId != null ? int.parse(pageId) : 0);
    },
      transition: Transition.fadeIn
    ),
  ];
}