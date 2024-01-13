
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_snap/Core/Resources/app_route.dart';
import 'package:plant_snap/Core/Widgets/custom_text_widget.dart';
import '../../../../Core/Resources/app_colors.dart';
import '../../../../Core/Resources/app_string.dart';
import '../../../../Core/Resources/fontWeightText.dart';

class RegisterAndLoginNavigator extends StatelessWidget {
  const RegisterAndLoginNavigator({super.key, required this.title, required this.titleButton, required this.function});
final String title;
final String titleButton;
final Function function;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextTitle(
          text: title,
          fontWeight: FontWeightAppText.regular,
          size: 15.sp,
          color: AppColors.textGrey,
        ),
        GestureDetector(
          onTap: () {
           function();
          },
          child: TextTitle(
            text: titleButton,
            fontWeight: FontWeightAppText.medium,
            size: 17.sp,
            color: AppColors.buttonIconsColor,
          ),
        )
      ],
    );
  }
}
