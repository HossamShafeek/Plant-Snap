abstract  class LoginState{}
class InitialLoginStates extends LoginState{}
class LoadingLoginStates extends LoginState{}
class SuccessLoginStates extends LoginState{
  final String uId;
  SuccessLoginStates(this.uId);
}
class ErrorLoginStates extends LoginState{
  final String errorMassage;

  ErrorLoginStates(this.errorMassage);

}
class LoginChangePasswordVisibilityState extends LoginState {}