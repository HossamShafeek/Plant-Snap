abstract class ProfileState{}
class InitialProfileState extends ProfileState{}
class LoadingProfileState extends ProfileState{}
class SuccessProfileState extends ProfileState{}
class SuccessEditImageProfileState extends ProfileState{}
class ErrorEditImageProfileState extends ProfileState{
}
class ErrorProfileState extends ProfileState{
  final String error;
  ErrorProfileState(this.error);
}
class ErrorEditUserDataState extends ProfileState{
  final String error;
  ErrorEditUserDataState(this.error);
}
class LoadingEditProfileState extends ProfileState{}