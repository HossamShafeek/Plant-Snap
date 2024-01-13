import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:plant_snap/Features/Home/presentation/cubit/buttom_navigation_bar_cubit/states.dart';
import '../../../../ChatBot/presentation/view/chat_bot_view.dart';
import '../../../../Profile/presentation/view/profile_view.dart';
import '../../view/home_view.dart';
class ButtonNavigationBarCubit extends Cubit<ButtonNavigationBarState>{
  ButtonNavigationBarCubit():super(InitialState());
  static ButtonNavigationBarCubit get(BuildContext context)=>BlocProvider.of(context);

  int currentIndex=0;

  void changeIndex(int index){
    currentIndex=index;
    emit(ChangeIndexState());
  }

  List<Widget>screens=[
    const HomeView(),
    const ProfileView(),
  ];

  List<Icon>buttonItems=[
    Icon(
        BoxIcons.bx_home,
        size: 25.sp
    ),
    Icon(
        Icons.person,
        size: 25.sp
    ),
  ];
}