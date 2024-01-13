
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_snap/Core/Widgets/shimmer/text_shimmer_colors.dart';
import 'package:plant_snap/Core/functions/get_location.dart';
import 'package:plant_snap/Features/Home/data/weather_api.dart';
import 'package:plant_snap/Features/Home/presentation/cubit/weather_cubit/weather_cubit.dart';
import '../../../../Core/Resources/app_colors.dart';
import '../../../../Core/Resources/app_string.dart';
import '../widgets/home_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    LocationService locationService=LocationService();
    locationService.determinePosition()
        .then((value) {
          print('==========================');
          print(value.latitude.toString());
      WeatherCubit.get(context).getWeather(lat: value.latitude.toString(),long: value.longitude.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ShimmerText(
          baseColor: AppColors.buttonIconsColor,
          highlightColor: AppColors.blueLight,
          textTitle: AppString.appTitle,
          size: 30,
        ),
      ),
      body:const HomeViewBody(),
    );
  }
}
