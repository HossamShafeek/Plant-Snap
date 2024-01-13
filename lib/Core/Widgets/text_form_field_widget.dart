import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Resources/app_colors.dart';
import '../Resources/fontWeightText.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String hintText;
  final bool? obscureText;
  final Widget?suffixIcon;
  final String? Function(String?) validate;
  final  TextInputType textInputType;
  final TextEditingController textEditingController;
  final TextInputFormatter? textInputFormatter;
  final bool? readOnly;
  const CustomTextFormFiled({super.key,
    this.suffixIcon,
    required this.hintText,
    this.obscureText,
    required this.textEditingController,
    required this.textInputType,
    required this.validate,
    this.textInputFormatter,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      readOnly: readOnly??false,
      cursorColor:AppColors.buttonIconsColor,
      validator: (value){
        return validate(value);
      },
      keyboardType: textInputType,
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
            fontWeight: FontWeightAppText.regular,
            color: AppColors.textGrey,
            fontSize: 16.sp
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 18.w),
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color:AppColors. textGrey,
            width: 1.w,
          ),
        ),
        hintText: hintText,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: AppColors.errorColor, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: AppColors.buttonIconsColor, width: 1.w),
        ),
        focusedErrorBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: AppColors.errorColor, width: 1.w),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.sp),
            borderSide: BorderSide(
              color: AppColors.buttonIconsColor,
              width: 1.w,
            )
        ),
      ),
      obscureText: obscureText ?? false,
    );
  }
}