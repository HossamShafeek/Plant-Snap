
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_snap/Features/Home/presentation/widgets/show_dailog.dart';
import '../../../../Core/Resources/app_assets.dart';
import '../../../../Core/Resources/app_colors.dart';
class SelectImage extends StatelessWidget {
  const SelectImage({super.key});
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      highlightColor: AppColors.buttonIconsColor,
      onTap: (){
       showDialogWidget(context);
      },
      child: Material(
        elevation: 5,
        shadowColor: AppColors.textGrey,
        color: AppColors.scaffoldColor ,
        child: Padding(
          padding:  EdgeInsets.all(8.0.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              imageWidget(
                image:AppAssets.iconScan,
              ),
              imageWidget(
                image:AppAssets.iconArrow,
              ),
              imageWidget(
                image:AppAssets.iconLoading,
              ),
              imageWidget(
                image:AppAssets.iconArrow,
              ),
              imageWidget(
                image:AppAssets.iconTreatment
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget imageWidget({required String image}){
    return Image.asset(
      image,
      fit: BoxFit.fill,
    );
  }
}
