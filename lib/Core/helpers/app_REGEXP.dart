class AppRegex{
  static bool hasUpperCaseLetter(String password){
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }
  static  bool hasLowerCaseLetter(String password){
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }
  static  bool hasNumber(String password){
    return RegExp(r'^(?=.*[0-9])').hasMatch(password);
  }
  static bool  specialCharacter(String password){
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }
  static  bool minOf8Characters(String password){
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }
}