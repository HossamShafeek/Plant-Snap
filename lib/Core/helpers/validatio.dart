class MyValidation{
  static String?nameValidation(String? name){
    if(name!.isEmpty){
      return 'please enter an username';
    }
    if(name.length<3||name.length>20){
      return 'Display name must be between  3 and 20 characters';
    }
    return null;
  }
  static String? emailValidation(String? value){
    if(value!.isEmpty){
      return 'please enter an email';
    }else if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
      return null;
    }
    return 'please enter a valid email';
  }
  static String? passwordValidation(String? value) {
    if (value!.isEmpty){
      return 'please enter an password';
    }else if(RegExp(r"(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$")
        .hasMatch(value)){
      return null;
    }else if(value.length<8){
      return'password must be at least 8 characters long';
    }
    return  'please enter an valid password';
  }
  static String? repeatPasswordValidation({String? value,String? password}){
    if(value !=password){
      return 'password do not match';
    }
    return null;
  }

  static String? phoneNumberValidation(String? value){
    if(value!.isEmpty){
      return 'please enter a phone number';
    }else if(RegExp(r'^\+?\d{1,3}[-.\s]?\(?\d{1,3}\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}$').hasMatch(value)){
      return null;
    }
    return 'please enter a valid number';
  }
}