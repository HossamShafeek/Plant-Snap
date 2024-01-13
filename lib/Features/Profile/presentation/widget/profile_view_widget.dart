
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_snap/Core/Resources/app_assets.dart';
import 'package:plant_snap/Core/Resources/app_colors.dart';
import 'package:plant_snap/Core/helpers/spacingApp.dart';
import 'package:plant_snap/Features/Profile/presentation/cubit/prodile_ststes.dart';
import '../../../../Core/Widgets/shimmer/profile_shimmer.dart';
import '../../../Authentication/data/model/userModel.dart';
import '../cubit/profile_cubit.dart';
import 'myDataProfle_item.dart';
class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
   BlocProvider.of<ProfileCubit>(context).getUserData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ProfileCubit,ProfileState>(
      builder: (context,state){
        UserModel? model=ProfileCubit.get(context).userCreate;
        if(state is ErrorProfileState){
         return CircularProgressIndicator(
           color: AppColors.errorColor,
         );
        }else if(state is SuccessProfileState){
          return SafeArea(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        width: 120.w,
                        height: 120.h,
                        decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.textGrey
                        ),
                        child: Image.asset('assets/profile_text.png'),
                      ),
                    ),
                    verticalSpacing(30),
                    ProfileItem(
                      title: model!.email,
                      titleItem: 'Email',
                      name: AppAssets.iconEmail,
                    ),
                    verticalSpacing(15),
                    ProfileItem(
                      title:model.name,
                      titleItem: 'Name',
                      name: AppAssets.iconPerson,
                    ),
                    verticalSpacing(15),
                    ProfileItem(
                      title: model.phone,
                      titleItem: 'Phone',
                      name: AppAssets.iconPhone,
                    ),
                  ],
                ),
              )
          );
        }else {
         return const ProfileWidgetShimmer();
        }
      }
    );
  }
}
