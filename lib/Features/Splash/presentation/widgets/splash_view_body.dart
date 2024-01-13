
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_snap/Core/Resources/app_colors.dart';
import 'package:plant_snap/Core/Resources/app_string.dart';
import 'package:plant_snap/Core/Resources/fontWeightText.dart';
import 'package:plant_snap/Core/helpers/spacingApp.dart';
import '../../../../Core/Resources/app_assets.dart';
import '../../../../Core/Widgets/custom_text_widget.dart';
class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Image.asset(
          AppAssets.splashImage,
          width:  double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Align(
            alignment: AlignmentDirectional.center,
            child:  Text(
                AppString.appTitle,
                style:GoogleFonts.rubik80sFade(
                    fontWeight: FontWeightAppText.bold,
                    fontSize: 40.sp,
                    color: AppColors.scaffoldColor
                )
            ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 20.h),
          child:  Align(
            alignment: AlignmentDirectional.bottomCenter,
              child: CircularProgressIndicator(
                color: AppColors.scaffoldColor,
              )
          ),
        ),
      ],
    );
  }
}
