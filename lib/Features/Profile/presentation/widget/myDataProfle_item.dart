
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_snap/Core/Resources/app_colors.dart';
import 'package:plant_snap/Core/Resources/fontWeightText.dart';
import 'package:plant_snap/Core/Widgets/custom_text_widget.dart';
import 'package:plant_snap/Core/helpers/spacingApp.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.name, required this.titleItem, required this.title});
final String name;
final String titleItem;
final String title;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(70.r),
          shadowColor: AppColors.black,
          color: AppColors.scaffoldColor,
          child:Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
              color: AppColors.scaffoldColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(name),
            ),
          )
        ),
        horizontalSpacing(10),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextTitle(
                text: titleItem,
                fontWeight: FontWeightAppText.medium,
                size: 19.sp,
              color: AppColors.textGrey,
            ),
            verticalSpacing(10),
            TextTitle(
              text: title,
              fontWeight: FontWeightAppText.bold,
              size: 21.sp,
              color: AppColors.black,
            ),
          ],
        ),
      ],
    );
  }
}
