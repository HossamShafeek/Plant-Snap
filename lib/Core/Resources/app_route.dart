import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_snap/Core/Di/service_locator.dart';
import 'package:plant_snap/Features/Authentication/presentation/cubit/loginCubit/cubit.dart';
import 'package:plant_snap/Features/Authentication/presentation/view/register_view.dart';
import 'package:plant_snap/Features/Home/data/weather_api.dart';
import 'package:plant_snap/Features/Home/presentation/cubit/weather_cubit/weather_cubit.dart';
import 'package:plant_snap/Features/Home/presentation/view/home_lay_out_view.dart';
import 'package:plant_snap/Features/Home/presentation/view/home_view.dart';

import '../../Features/Authentication/presentation/cubit/registerCubit/cubit.dart';
import '../../Features/Authentication/presentation/view/login_view.dart';
import '../../Features/Home/presentation/cubit/buttom_navigation_bar_cubit/cubit.dart';
import '../../Features/Home/presentation/cubit/plant _disease_cubit/cubit.dart';
import '../../Features/Home/presentation/view/ResultView.dart';
import '../../Features/Profile/presentation/cubit/profile_cubit.dart';
import '../../Features/Splash/presentation/view/splash_view.dart';
class NameRoute{
  static const String splashView='/';
  static const String homeLayOutView='/homeLayOutView';
  static const String homeView='/homeView';
  static const String resultView='/resultView';
  static const String loginView='/loginView';
  static const String registerView='/registerView';
  static const String profileView='/profileView';
  static const String detailsView='/detailsView';
}
class ResultVariables {
  final File imagePath;
  final String prediction;
  final double confidence;

  const ResultVariables(
      {required this.imagePath,
        required this.prediction,
        required this.confidence});
}
class GenerateRoute{
 static Route<dynamic> goRoute(RouteSettings settings){
    switch(settings.name){
      case NameRoute.splashView:
        return MaterialPageRoute(builder: (_)=>const SplashView());
       case NameRoute.resultView:
         final data = settings.arguments as ResultVariables;
        return MaterialPageRoute(builder: (_)=> ResultView(
          prediction:data.prediction,
          imagePath:data.imagePath ,
          confidence:data.confidence ,
        ));
       case NameRoute.homeLayOutView:
        return MaterialPageRoute(builder: (_)=>MultiBlocProvider(
          providers: [
            BlocProvider(create: (_)=>ButtonNavigationBarCubit()),
            BlocProvider(create: (context) => ScanCubit()),
            BlocProvider(create: (context) => ProfileCubit()),
            BlocProvider(create: (context) => WeatherCubit(WeatherCall()),),
          ],
            child: const HomeLayOut()));
        case NameRoute.homeView:
        return MaterialPageRoute(builder: (_)=>const HomeView());
       case NameRoute.registerView:
        return MaterialPageRoute(builder: (_)=>BlocProvider(
          create: (_)=>getIt<RegisterCubit>(),
            child: const RegisterView()));
       case NameRoute.loginView:
        return MaterialPageRoute(builder: (_)=>BlocProvider(
          create: (_)=>getIt<LogInCubit>(),
            child: const LogInView()));
    }
   return noFoundRoute();
  }
  static Route<dynamic> noFoundRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('NO FOUND ROUT'),
          ),
        ));
  }
}