// import 'package:dartz/dartz.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:plant_snap/Features/Authentication/data/repository/Authentication_repository.dart';
// import '../../../../Core/Network/firebase_service.dart';
// import '../../../../Core/helpers/errorApp.dart';
//
// class  AuthenticationRepositoryImp implements  AuthenticationRepository{
//   AuthenticationRepositoryImp(this.fireBaseService);
//   FireBaseService fireBaseService;
//   @override
//   Future<Either<ErrorApp,UserCredential>> login(String email, String password) {
//     // TODO: implement login
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Either<ErrorApp,dynamic>> register(String email, String password) {
//    try{
//      var finalData=FireBaseService.userRegister(
//        email: email,
//        password: password
//      );
//      return Right(finalData);
//    }  catch(error){
//     return Left(FireBaseError(error.toString()));
//    }
//   }
//
// }