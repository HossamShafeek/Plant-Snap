
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_snap/Core/Resources/app_assets.dart';
import 'package:plant_snap/Core/Resources/app_colors.dart';
import 'package:plant_snap/Core/Resources/app_string.dart';
import 'package:plant_snap/Core/Resources/fontWeightText.dart';
import 'package:plant_snap/Core/Widgets/custom_text_widget.dart';
import 'package:plant_snap/Features/Authentication/presentation/widgets/titleAndsubtitle.dart';
import 'package:plant_snap/Features/Home/presentation/widgets/select_image_widget.dart';
import 'package:plant_snap/Features/Home/presentation/widgets/weather_widget.dart';

import '../../../../Core/helpers/spacingApp.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.sp),
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacing(25),
              TitleAndSubTitle(
                sizeSubTitle: 17.sp,
                  sizeTitle: 24.sp,
                  title: AppString.titleHome,
                  subTitle:AppString.subTitleHome,
              ),
              verticalSpacing(30),
              TextTitle(
                  text: 'Select image',
                  fontWeight: FontWeightAppText.medium,
                  size: 22,
                color: AppColors.black,
              ),
              verticalSpacing(20),
              const SelectImage(),
              verticalSpacing(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  TextTitle(
                      text: 'Step 1:- Select the image',
                      fontWeight: FontWeightAppText.medium,
                      size: 19.sp,
                    color: AppColors.textGrey,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextTitle(
                      text: 'Step 2:- Wait a few minutes Select the image',
                      fontWeight: FontWeightAppText.medium,
                      size: 19.sp,
                    color: AppColors.textGrey,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextTitle(
                      text: 'Step 3:-Click on the treatment button to see the treatment',
                      fontWeight: FontWeightAppText.medium,
                      size: 19.sp,
                    color: AppColors.textGrey,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Divider(
                    height: 1.h,
                    thickness: 1.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'The application helps to explore two potato diseases, which are the most common',
                    maxLines: 2,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color:AppColors.black,
                    ),
                  ),
                  const WeatherWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
