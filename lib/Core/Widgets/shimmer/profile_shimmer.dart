import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../helpers/spacingApp.dart';
import 'container_shimmer.dart';
class ProfileWidgetShimmer extends StatelessWidget {
  const ProfileWidgetShimmer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.3),
            highlightColor:Colors.white.withOpacity(.8) ,
            child:  CircleAvatar(
              radius:  80.r,
            ),
          ),
          verticalSpacing(15),
          ShimmerContainerEffect(
            borderRadius: 15.r,
            width: double.infinity,
            height: 80.h,
            baseColor: Colors.grey.withOpacity(0.3),
            highlightColor:Colors.white.withOpacity(.8) ,
          ),
          verticalSpacing(15),
          ShimmerContainerEffect(
            borderRadius: 15.r,
              width: double.infinity,
              height: 80.h,
            baseColor: Colors.grey.withOpacity(0.3),
            highlightColor:Colors.white.withOpacity(.8) ,
          ),
          verticalSpacing(15),
          ShimmerContainerEffect(
            borderRadius: 15.r,
            width: double.infinity,
              height: 80.h,
            baseColor: Colors.grey.withOpacity(0.3),
            highlightColor:Colors.white.withOpacity(.8) ,
          ),
        ],
      ),
    );
  }
}