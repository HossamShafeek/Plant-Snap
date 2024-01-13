import 'package:get_it/get_it.dart';

import 'package:plant_snap/Features/Authentication/presentation/cubit/registerCubit/cubit.dart';
import '../../Features/Authentication/presentation/cubit/loginCubit/cubit.dart';
import '../Network/firebase_service.dart';
final getIt=GetIt.instance;
void settUp(){
//firebaseDi
  //getIt.registerLazySingleton<FireBaseService>(() =>FireBaseService());
//LogInCubit Di
  getIt.registerLazySingleton<LogInCubit>(() =>LogInCubit());
  //registerCubit Di
  getIt.registerLazySingleton<RegisterCubit>(() =>RegisterCubit());
}