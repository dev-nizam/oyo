


import 'dart:convert';



import 'package:http/http.dart';
import 'package:oyo/controll/api/Api_Cleint.dart';
import 'package:oyo/controll/model/HotelModel.dart';

class HotelApi{
  ApiClient apiClient=ApiClient();
  Future<HotelModel>Hotels()async{
    String path="https://hotels4.p.rapidapi.com/properties/list?destinationId=11594&pageNumber=1&pageSize=25&checkIn=2022-09-27&checkOut=2022-09-28&adults1=1&sortOrder=PRICE&locale=en_US&currency=USD";
    Response response=await apiClient.invokeApi(path: path, method: "GET", body: null);
    return HotelModel.fromJson(jsonDecode(response.body));

  }
}