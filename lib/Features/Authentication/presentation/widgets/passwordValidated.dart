import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_snap/Core/helpers/spacingApp.dart';

import '../../../../Core/Resources/app_colors.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations(
      {Key? key,
        required this.hasUpperCase,
        required this.hasLowerCase,
        required this.hasSpecialCharacters,
        required this.hasNumber,
        required this.hasMinLength})
      : super(key: key);

  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            passwordValidated('Has upperCase letter', hasUpperCase),
            verticalSpacing(2),
            passwordValidated('Has lowerCase letter ', hasLowerCase),
          ],
        ),
        verticalSpacing(5),
        Row(
          children: [
            passwordValidated('Has special character', hasSpecialCharacters),
            verticalSpacing(2),
            passwordValidated('Has numbers', hasNumber),
          ],
        ),
        verticalSpacing(5),
        passwordValidated('Min of  8 characters', hasMinLength),
      ],
    );
  }

  Widget passwordValidated(String text, bool hasValidation) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: hasValidation
            ? AppColors.buttonIconsColor.withOpacity(.7)
            : AppColors.textGrey.withOpacity(.2),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 6.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasValidation) ...[
              Icon(
                Icons.done,
                color: AppColors.textGrey,
                size: 15.sp,
              ),
            ],
            verticalSpacing(3),
            Text(
              text,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                decorationThickness: 2,
                color: hasValidation
                    ? AppColors.scaffoldColor
                    : AppColors.textGrey,
              ),
            )
          ],
        ),
      ),
    );
  }
}