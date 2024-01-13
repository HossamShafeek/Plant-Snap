import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant_snap/Core/Resources/app_const.dart';
import 'package:plant_snap/main_class.dart';
import 'Core/Di/service_locator.dart';
import 'Core/helpers/cach_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  settUp();
  await Firebase.initializeApp();
  AppConsts.uIdUser= await CashHelper.readData()??'';
  runApp(const PlantSnap());
}




