
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_snap/Core/Resources/app_colors.dart';
import 'package:plant_snap/Core/Resources/app_string.dart';
import 'package:plant_snap/Core/Resources/fontWeightText.dart';
import 'package:plant_snap/Core/Widgets/custom_text_button.dart';
import 'package:plant_snap/Core/Widgets/custom_text_widget.dart';
import 'package:plant_snap/Core/helpers/spacingApp.dart';
import 'package:plant_snap/Features/Authentication/presentation/cubit/registerCubit/cubit.dart';
import 'package:plant_snap/Features/Authentication/presentation/widgets/registerCubit_listener.dart';
import 'package:plant_snap/Features/Authentication/presentation/widgets/registerFormField.dart';
import 'package:plant_snap/Features/Authentication/presentation/widgets/register_and_login_navigator.dart';
import 'package:plant_snap/Features/Authentication/presentation/widgets/titleAndsubtitle.dart';
class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              children: [
               const TitleAndSubTitle(
                  title: AppString.registerTitle,
                  subTitle: AppString.registerSubTitle,
                ),
                verticalSpacing(20),
                const RegisterFormField(),
                verticalSpacing(20),
                CustomTextButton(
                    function: (){
                      validationDataINRegister(context);
                    },
                    size: 20.sp,
                    widget: TextTitle(
                      fontWeight: FontWeightAppText.bold,
                      text: 'Sign up',
                      size: 20.sp,
                      color: AppColors.scaffoldColor,
                    )
                ),
                verticalSpacing(10),
                RegisterAndLoginNavigator(
                  title: AppString.alreadyAccount,
                  function: (){
                    Navigator.pop(context);
                  },
                   titleButton: 'Sign in',
                ),
               const RegisterCubitListener(),
              ],
            ),
          ),
        )
    );
  }
  void validationDataINRegister(BuildContext context){
    if(context.read<RegisterCubit>().formKey.currentState!.validate()){
     context.read<RegisterCubit>().userRegister(
       password: context.read<RegisterCubit>().passwordController.text,
       email: context.read<RegisterCubit>().emailController.text,
       name: context.read<RegisterCubit>().userNameController.text,
       phone: context.read<RegisterCubit>().phoneController.text,
     );
    }
  }
}
