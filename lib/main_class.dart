
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/Resources/app_route.dart';
import 'Core/Resources/app_theme.dart';
class PlantSnap extends StatelessWidget {
  const PlantSnap({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize:const Size(375,812) ,
      splitScreenMode: true,
      builder: (context,child)=>MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:ThemApp.themeData(),
        onGenerateRoute:GenerateRoute.goRoute ,
      ),
    );
  }
}