
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_snap/Core/const.dart';
import 'package:plant_snap/Features/Home/data/weather_api.dart';
import 'package:plant_snap/Features/Home/data/weather_model.dart';
import 'package:plant_snap/Features/Home/presentation/cubit/weather_cubit/weather_state.dart';


class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit(this.weatherCall):super (WeatherInitialState());
  static WeatherCubit get(BuildContext context)=>BlocProvider.of(context);
  WeatherModel? weatherModel;
  final WeatherCall weatherCall;
  void getWeather({
   required String lat,
   required String long,
}){
    emit(WeatherLoadingState());
    weatherCall.getWeather(
        endpoint: EndPoint.forecast,parameters:{
        'q':'$lat,$long',
        'Key':EndPoint.key,
        'days':3,
      }).then((value){
        weatherModel=WeatherModel.fromJson(value);
        emit(WeatherSuccessState());
        print('**********************************');
        print(weatherModel?.current!.tempC);
        print('**********************************');
      }).catchError((error){
        emit(WeatherErrorState(error.toString()));
      });
  }
}