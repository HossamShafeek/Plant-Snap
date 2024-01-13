import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_snap/Features/Authentication/data/model/userModel.dart';
import 'package:plant_snap/Features/Authentication/presentation/cubit/registerCubit/states.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitialRegisterState());
  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //var formKey = GlobalKey<FormState>();
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(LoadingRegisterState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(
        uId: value.user!.uid,
        email: email,
        phone: phone,
        name: name,
      );
    // emit(SuccessRegisterState());
    }).catchError((error) {
      emit(ErrorRegisterState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    UserModel model =
        UserModel(
            email: email,
            phone: phone,
            name: name,
            uId: uId,
           // image: 'https://banner2.cleanpng.com/20180725/hrj/kisspng-computer-icons-person-5b58a2a82e0cd6.9562737315325354641886.jpg'
        );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(RegisterCreateUserSuccess(model));
    }).catchError((error) {
      emit(RegisterCreateUserError(error.toString()));
    });
  }
}
