
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_snap/Core/Resources/app_assets.dart';
import 'package:plant_snap/Core/Resources/app_colors.dart';
import 'package:plant_snap/Core/Resources/app_string.dart';

import '../../../../Core/Widgets/shimmer/text_shimmer_colors.dart';
import '../../../../Core/helpers/spacingApp.dart';

class NameAndLogoApp extends StatelessWidget {
  const NameAndLogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.center,
      child: Column(
        children: [
          ShimmerText(
            baseColor: AppColors.buttonIconsColor,
            highlightColor: AppColors.blueLight,
            textTitle: AppString.appTitle,
            size: 30,
          ),
          verticalSpacing(20),
          Image.asset(
            AppAssets.iconAppImage,
            height: 100.h,
            width: 100.w,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
