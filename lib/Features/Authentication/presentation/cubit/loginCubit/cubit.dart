import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_snap/Features/Authentication/presentation/cubit/loginCubit/states.dart';

import '../../../../../Core/Network/firebase_service.dart';

class LogInCubit extends Cubit <LoginState>{
  LogInCubit():super (InitialLoginStates());
 // FireBaseService fireBaseService;
  static LogInCubit get(BuildContext context)=>BlocProvider.of(context);

  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void userLogin({
    required String email,
    required String password,
}){
    emit(LoadingLoginStates());
    FireBaseService.userLogin(
      email: email,
      password: password
    ).then((value) {
      emit(SuccessLoginStates(value.user!.uid));
    }).catchError((error){
      emit(ErrorLoginStates(error.toString()));
    });
  }
}