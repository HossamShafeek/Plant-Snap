

import 'package:dio/dio.dart';
import 'package:plant_snap/Core/const.dart';

class WeatherCall{
  Dio? dio;
  WeatherCall(){
    BaseOptions baseOptions=BaseOptions(
      baseUrl: EndPoint.basUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 8),
    );
    dio=Dio(baseOptions);
  }

   Future<Map<String,dynamic>>getWeather({
  required String endpoint,
     required Map<String,dynamic>parameters,
})async{
    Response response=await dio!.get(
      endpoint,queryParameters: parameters,
    );
    return response.data;
 }
}