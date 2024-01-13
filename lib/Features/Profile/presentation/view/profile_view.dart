
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_snap/Core/Resources/app_colors.dart';
import 'package:plant_snap/Core/Resources/app_const.dart';
import 'package:plant_snap/Core/Resources/app_route.dart';
import 'package:plant_snap/Core/Resources/fontWeightText.dart';
import 'package:plant_snap/Core/Widgets/custom_text_widget.dart';
import 'package:plant_snap/Core/helpers/cach_helper.dart';
import 'package:plant_snap/Features/Profile/presentation/widget/profile_view_widget.dart';
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: TextTitle(
          size: 23.sp,
          text: 'Profile',
          fontWeight: FontWeightAppText.bold,
          color: AppColors.black,
        ),
        actions: [
          IconButton(
              onPressed: (){
                CashHelper.deleteData().then((value) {
                  Navigator.popAndPushNamed(context,NameRoute.loginView);
                });
              },
              icon:  Icon(
                 Icons.exit_to_app_outlined,
                color: AppColors.black,
                size: 20.sp,
              )
          )
        ],
      ),
      body: const ProfileViewBody(),
    );
  }
}
