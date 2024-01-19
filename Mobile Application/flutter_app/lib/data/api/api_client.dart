import 'package:get/get.dart';
import 'package:testapp/utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  late Map<String,String> _mainHeaders;

  ApiClient({ required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOEKN;
    _mainHeaders = {
      'Content-type' : 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer $token',
    };
  }
  Future<Response> getData(String uri,) async {
    try {
      print("Hi from Api Client");
      Response response = await get(uri);
      return response;
    }
    catch(e){
      return Response(statusCode : 1, statusText: e.toString());
    }
  }
}