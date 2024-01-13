import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_snap/Core/Resources/app_assets.dart';
import 'package:plant_snap/Core/Resources/app_colors.dart';
import 'package:plant_snap/Core/Resources/app_string.dart';
import 'package:plant_snap/Core/Resources/fontWeightText.dart';
import 'package:plant_snap/Core/Widgets/custom_text_widget.dart';
import 'package:plant_snap/Core/helpers/spacingApp.dart';
import 'package:plant_snap/Features/Home/presentation/cubit/plant%20_disease_cubit/cubit.dart';
import 'package:plant_snap/Features/Home/presentation/cubit/plant%20_disease_cubit/states.dart';
import 'package:plant_snap/Features/Home/presentation/widgets/uploadImage_widget.dart';

Future<dynamic> showDialogWidget(BuildContext context){
  return showDialog(
      context: context,
      builder: (context){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AlertDialog(
            icon: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon:  Icon(
                Icons.close_outlined,
                color: AppColors.errorColor,
              )
            ),
            actionsAlignment: MainAxisAlignment.center,
            alignment: AlignmentDirectional.center,
            elevation: 5,
            backgroundColor: AppColors.scaffoldColor,
            title: TextTitle(
              size: 22.sp,
              text:AppString.selectMethod,
              fontWeight: FontWeightAppText.bold,
            ),
            content: const UploadImageWidget(),
          ),
        );
      }
  );
}
