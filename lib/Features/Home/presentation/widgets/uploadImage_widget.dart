import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_snap/Core/Resources/app_route.dart';
import 'package:plant_snap/Features/Home/presentation/cubit/plant%20_disease_cubit/cubit.dart';
import 'package:plant_snap/Features/Home/presentation/cubit/plant%20_disease_cubit/states.dart';

import '../../../../Core/Resources/app_assets.dart';
import '../../../../Core/Resources/app_colors.dart';
import '../../../../Core/helpers/spacingApp.dart';

class UploadImageWidget extends StatelessWidget {
  const UploadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_)=>ScanCubit(),
      child: BlocBuilder<ScanCubit,ScanState>(
        builder: (context,state){
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  context.read<ScanCubit>().uploadImage().then((value) {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                        context,NameRoute.resultView,
                        arguments:ResultVariables(
                            imagePath: ScanCubit.get(context).selectedImage!,
                            prediction: value['Prediction'],
                            confidence: value['confidence'])
                    );
                  });
                },
                child: Image.asset(
                    AppAssets.iconGallery
                ),
              ),
              horizontalSpacing(15),
              Image.asset(
                  AppAssets.iconCamera
              ),
            ],
          );
        },
      ),
    );
  }
}
