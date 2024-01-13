import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_snap/Core/helpers/errorApp.dart';

import '../model/userModel.dart';

abstract class AuthenticationRepository{
  Future<Either<ErrorApp,UserCredential>> login(String email,String password);
  Future<Either<ErrorApp,UserCredential>> register(String email,String password);
}