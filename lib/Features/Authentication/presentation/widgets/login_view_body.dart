
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_snap/Core/Resources/app_colors.dart';
import 'package:plant_snap/Core/Resources/app_string.dart';
import 'package:plant_snap/Core/Resources/fontWeightText.dart';
import 'package:plant_snap/Core/Widgets/custom_text_widget.dart';
import 'package:plant_snap/Core/helpers/spacingApp.dart';
import 'package:plant_snap/Features/Authentication/presentation/widgets/register_and_login_navigator.dart';
import 'package:plant_snap/Features/Authentication/presentation/widgets/titleAndsubtitle.dart';
import '../../../../Core/Resources/app_route.dart';
import '../../../../Core/Widgets/custom_text_button.dart';
import '../cubit/loginCubit/cubit.dart';
import 'loginCubit_listener.dart';
import 'loginFormField.dart';
import 'nameAndlogoApp.dart';
class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const NameAndLogoApp(),
              verticalSpacing(15),
              const TitleAndSubTitle(
                title: AppString.titleLogin,
                subTitle: AppString.subTitleLogIn,
              ),
              verticalSpacing(15),
             const LoginFormField(),
              verticalSpacing(15),
              CustomTextButton(
                size: 20.sp,
                function: (){
                  validationDataINlogIn(context);
                },
                widget: TextTitle(
                  size: 20.sp,
                  text: 'Sign in',
                  fontWeight: FontWeightAppText.bold,
                  color: AppColors.scaffoldColor,
                ),
              ),
              verticalSpacing(15),
              RegisterAndLoginNavigator(
                title: AppString.doNotAnyAccount,
                function: (){
                  Navigator.pushNamed(context,NameRoute.registerView);
                },
                titleButton: 'Sign up',
              ),
             const LogInCubitListener(),
            ],
          ),
        ),
      ),
    );
  }
  void validationDataINlogIn(BuildContext context){
    if(context.read<LogInCubit>().formKey.currentState!.validate()){
     context.read<LogInCubit>().userLogin(
         email: context.read<LogInCubit>().emailController.text.trim(),
         password: context.read<LogInCubit>().passwordController.text.trim(),
     );
    }
  }
}
