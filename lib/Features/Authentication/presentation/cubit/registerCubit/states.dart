import 'package:plant_snap/Features/Authentication/data/model/userModel.dart';

abstract  class RegisterState{}
class InitialRegisterState extends RegisterState{}
class LoadingRegisterState extends RegisterState{}
class SuccessRegisterState extends RegisterState{}
class ErrorRegisterState extends RegisterState{
  final String errorMassage;

  ErrorRegisterState(this.errorMassage);

}

class RegisterCreateUserSuccess extends RegisterState {
  final UserModel userModel;
  RegisterCreateUserSuccess(this.userModel);
}
class RegisterCreateUserError extends RegisterState {
  final String errorMassage;
  RegisterCreateUserError(this.errorMassage);
}