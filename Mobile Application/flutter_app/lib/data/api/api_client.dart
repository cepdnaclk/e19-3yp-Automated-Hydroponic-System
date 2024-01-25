import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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

  // Update header
  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type' : 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer $token',
    };
  }

  // Get from API
  Future<Response> getData(String uri) async {
    try {
      print("Hi from Api Client");
      Response response = await get(uri);
      return response;
    }
    catch(e){
      return Response(statusCode : 1, statusText: e.toString());
    }
  }

  //Post to API
  Future<Response> postData(String uri, dynamic body) async {
    try{
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    }
    catch(e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  // Post to API without a body
  Future<Response> postIot(String uri) async {
    try {
      Response response = await post(uri, {}, headers: _mainHeaders);
      print("Yes you have tried postIoT");
     // print("response : $response");
      print("response code: ${response.statusCode}");
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 500, statusText: 'Error'); 
    }
  }
 

}