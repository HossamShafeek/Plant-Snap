
import 'package:flutter/material.dart';
import 'package:plant_snap/Core/Resources/app_const.dart';
import 'package:plant_snap/Core/Resources/app_route.dart';
import '../widgets/splash_view_body.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    nextPage();
    super.initState();
  }
  void nextPage(){
    Future.delayed(const Duration(seconds: 5),(){
     if(AppConsts.uIdUser.isEmpty){
      return Navigator.pushReplacementNamed(context, NameRoute.loginView);
     }else{
       return Navigator.pushReplacementNamed(context, NameRoute.homeLayOutView);
     }
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody() ,
    );
  }
}
