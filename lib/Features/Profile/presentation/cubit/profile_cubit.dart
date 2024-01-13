import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_snap/Core/Resources/app_const.dart';
import 'package:plant_snap/Features/Profile/presentation/cubit/prodile_ststes.dart';

import '../../../Authentication/data/model/userModel.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit():super(InitialProfileState());
  static ProfileCubit get(context)=>BlocProvider.of(context);
  UserModel? userCreate;
  // File? image;
  // final picker=ImagePicker();
  // var pickedImage;
  // XFile? _imageFiles;
  //
  // Future uploadImage() async {
  //   pickedImage= await picker.pickImage(source: ImageSource.gallery);
  //   if(pickedImage != null){
  //     image = File(pickedImage!.path);
  //     _imageFiles = pickedImage;
  //     print(_imageFiles);
  //     emit(SuccessEditImageProfileState());
  //   }else{
  //     print('Image not Found');
  //     emit(ErrorEditImageProfileState());
  //   }
  // }

  void getUserData(){
    emit(LoadingProfileState());
    FirebaseFirestore.instance.collection('users').doc(AppConsts.uIdUser).get().then((value) {
      userCreate=UserModel.fromJson(value.data()!);
      emit(SuccessProfileState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorProfileState(error));
    });
  }
  // Future uploadProfileImage(File file) async{
  //   firebase_storage.
  //   FirebaseStorage.instance.ref().
  //   child('users/${Uri.file(pickedImage.path).pathSegments.last}').putFile(pickedImage).then((value){
  //     value.ref.getDownloadURL().then((value) {
  //       print('+++++++++++++++++++');
  //       print(value);
  //       print('+++++++++++++++++++');
  //     }).catchError((error){
  //       print('pppppppppppppppppppp');
  //       print(error.toString());
  //       print('pppppppppppppppppppp');
  //     });
  //   }).catchError((error){
  //   });
  // }

  // void updateUserData({
  //   required name,
  //   required phone,
  //   //required image,
  // }){
  //   emit(LoadingEditProfileState());
  //   SocialUserModel model =SocialUserModel(
  //       name: name,
  //       phone: phone,
  //       email: userCreate!.email,
  //       image: userCreate!.image,
  //       uId: userCreate!.uId
  //   );
  //   FirebaseFirestore.instance.collection('users').doc(model.uId).update(model.toMap()).then((value) {
  //     getUserData();
  //   }).catchError((error){
  //     emit(ErrorEditUserDataState(error.tostring()));
  //   });
  // }
}