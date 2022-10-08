


import 'dart:convert';



import 'package:http/http.dart';
import 'package:oyo/controll/api/Api_Cleint.dart';
import 'package:oyo/controll/model/HotelModel.dart';

class HotelApi{
  ApiClient apiClient=ApiClient();
  Future<HotelModel>Hotels(String id,String indate, String outdate)async{
    String path="properties/list?destinationId=$id&pageNumber=1&pageSize=25&checkIn=$indate&checkOut=$outdate&adults1=1&sortOrder=PRICE&locale=en_US&currency=USD";
    Response response=await apiClient.invokeApi(path: path, method: "GET", body: null);
    return HotelModel.fromJson(jsonDecode(response.body));

  }
}