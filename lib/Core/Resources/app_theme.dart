import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'fontWeightText.dart';

class ThemApp{
  static ThemeData themeData(){
    return ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldColor,
      brightness:Brightness.light,
      //main color

      primaryColor: AppColors.scaffoldColor,

      //CardView theme

      cardTheme: CardTheme(
        color:AppColors.scaffoldColor,
        shadowColor: AppColors.buttonIconsColor,
        elevation: 4,
      ),


      // App BarTheme

      appBarTheme: AppBarTheme(
          color:  AppColors.scaffoldColor,
          centerTitle: false,
          elevation:0,
          titleTextStyle:TextStyle(
              color: AppColors.scaffoldColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500
          ),
          actionsIconTheme: IconThemeData(
              color: AppColors.black
          )
      ),

//TextButtonStyle
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              AppColors.buttonIconsColor
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: MaterialStateProperty.all( Size(double.infinity, 48.h)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r)
              )
          ),
        ),
      ),

      //bottomNavigationBarTheme
      bottomNavigationBarTheme:BottomNavigationBarThemeData(
        backgroundColor:AppColors.scaffoldColor,
        elevation: 60,
        selectedItemColor: AppColors.buttonIconsColor,
        unselectedItemColor: AppColors.textGrey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: GoogleFonts.lora(
            fontSize: 14.sp,
            fontWeight: FontWeightAppText.medium
        ),
        unselectedLabelStyle: GoogleFonts.lora(
            fontSize: 14.sp,
            fontWeight: FontWeightAppText.regular
        ),
      ),

    );
  }
}