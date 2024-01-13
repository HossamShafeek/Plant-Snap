
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_snap/Core/helpers/spacingApp.dart';
import 'package:plant_snap/Features/Authentication/presentation/widgets/passwordValidated.dart';

import '../../../../Core/Resources/app_colors.dart';
import '../../../../Core/Widgets/text_form_field_widget.dart';
import '../../../../Core/helpers/app_REGEXP.dart';
import '../../../../Core/helpers/validatio.dart';
import '../cubit/loginCubit/cubit.dart';

class LoginFormField extends StatefulWidget {
  const LoginFormField({super.key});

  @override
  State<LoginFormField> createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<LoginFormField> {
  bool isObscureText=true;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool hasUpperCase=false;
  bool haseLowerCase=false;
  bool haseSpecialCharacters=false;
  bool hasNumber=false;
  bool hasMinLength=false;

  @override
  void initState() {
    super.initState();
    emailController=context.read<LogInCubit>().emailController;
    passwordController=context.read<LogInCubit>().passwordController;
    setUpPasswordControllerListener();
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasUpperCase=AppRegex.hasUpperCaseLetter(passwordController.text);
        haseLowerCase=AppRegex.hasLowerCaseLetter(passwordController.text);
        haseSpecialCharacters=AppRegex.specialCharacter(passwordController.text);
        hasNumber=AppRegex.hasNumber(passwordController.text);
        hasMinLength=AppRegex.minOf8Characters(passwordController.text);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LogInCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormFiled(
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
            textEditingController: context.read<LogInCubit>().emailController,
            validate: (value){
              return MyValidation.emailValidation(value);
            },
          ),
          verticalSpacing(20),
          CustomTextFormFiled(
            hintText: 'Password',
            obscureText:isObscureText,
            textEditingController: context.read<LogInCubit>().passwordController,
            validate: (value){
              return MyValidation.passwordValidation(value);
            },
            suffixIcon: IconButton(
              onPressed: (){
                setState(() {
                  isObscureText=!isObscureText;
                });
              },
              icon: isObscureText? Icon(
                Icons.visibility_off,
                size: 17.sp,
                color: AppColors.buttonIconsColor,
              ):Icon(
                Icons.visibility,
                size: 17.sp,
                color: AppColors.buttonIconsColor,
              ),
            ),
            textInputType: TextInputType.visiblePassword,
          ),
          verticalSpacing(20),
          PasswordValidations(
            hasUpperCase:hasUpperCase,
            hasLowerCase:haseLowerCase,
            hasSpecialCharacters:haseSpecialCharacters,
            hasNumber:hasNumber,
            hasMinLength:hasMinLength,
          ),
        ],
      ),
    );
  }
}
