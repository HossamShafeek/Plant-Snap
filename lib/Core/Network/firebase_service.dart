import 'package:firebase_auth/firebase_auth.dart';

class FireBaseService{
 static Future<UserCredential> userRegister({required String email,required String password})async{
    var data=await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    return data;
  }
  static Future<UserCredential>userLogin({required String email,required String password})async{
    var data=await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    return data;
  }
}