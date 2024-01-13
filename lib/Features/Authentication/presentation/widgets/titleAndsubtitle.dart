import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_snap/Core/Resources/app_colors.dart';
import 'package:plant_snap/Core/Resources/fontWeightText.dart';
import 'package:plant_snap/Core/Widgets/custom_text_widget.dart';
import 'package:plant_snap/Core/helpers/spacingApp.dart';

class TitleAndSubTitle extends StatelessWidget {
  const TitleAndSubTitle(
      {
        super.key,
        required this.title,
        required this.subTitle,
          this.sizeTitle,
          this.sizeSubTitle,
      });
  final String title;
  final String subTitle;
  final double? sizeTitle;
  final  double? sizeSubTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextTitle(
          text: title,
          fontWeight: FontWeightAppText.bold,
          size: sizeTitle??25.sp,
          color: AppColors.black,
        ),
        verticalSpacing(10),
        TextTitle(
          text: subTitle,
          fontWeight: FontWeightAppText.regular,
          size:sizeSubTitle?? 18.sp,
          color: AppColors.textGrey,
        ),
      ],
    );
  }
}
