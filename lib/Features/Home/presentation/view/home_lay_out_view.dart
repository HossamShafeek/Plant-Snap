
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_snap/Core/Resources/app_colors.dart';
import '../cubit/buttom_navigation_bar_cubit/cubit.dart';
import '../cubit/buttom_navigation_bar_cubit/states.dart';
class HomeLayOut extends StatelessWidget {
  const HomeLayOut({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonNavigationBarCubit,ButtonNavigationBarState>(
      builder: (context,state){
        var cubitData=context.read<ButtonNavigationBarCubit>();
        return Scaffold(
          body:cubitData.screens[cubitData.currentIndex] ,
          bottomNavigationBar:CurvedNavigationBar(
            height: 70.h,
            index:cubitData.currentIndex,
            backgroundColor: AppColors.buttonIconsColor,
            items: cubitData.buttonItems,
            onTap: (index) {
              cubitData.changeIndex(index);
            },
          ),
        );
      },
    );
  }
}
