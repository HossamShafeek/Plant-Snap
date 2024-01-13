
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_snap/Core/helpers/spacingApp.dart';
import 'package:plant_snap/Features/Authentication/presentation/widgets/passwordValidated.dart';

import '../../../../Core/Resources/app_colors.dart';
import '../../../../Core/Widgets/text_form_field_widget.dart';
import '../../../../Core/helpers/app_REGEXP.dart';
import '../../../../Core/helpers/validatio.dart';
import '../cubit/registerCubit/cubit.dart';

class RegisterFormField extends StatefulWidget {
  const RegisterFormField({super.key});

  @override
  State<RegisterFormField> createState() => _RegisterFormFieldState();
}

class _RegisterFormFieldState extends State<RegisterFormField> {
  late TextEditingController registerEmailController ;
  late TextEditingController registerPasswordController ;
  late  TextEditingController registerNameController ;
  late  TextEditingController registerPhoneController ;
  late TextEditingController registerGenderController ;
  late TextEditingController registerConfirmPasswordController ;
  bool isObscureTextConformPassword=true;
  bool isObscurePassword=true;
  bool hasUpperCase=false;

  bool hasLowerCase=false;

  bool hasSpecialCharacters=false;

  bool hasNumber=false;

  bool hasMinLength=false;
  @override
  void initState() {
    registerEmailController=context.read<RegisterCubit>().emailController;
    registerNameController=context.read<RegisterCubit>().userNameController;
    registerPasswordController=context.read<RegisterCubit>().passwordController;
    registerPhoneController=context.read<RegisterCubit>().phoneController;
    registerConfirmPasswordController=context.read<RegisterCubit>().conformPasswordController;
    setUpPasswordControllerListener();
    super.initState();
  }
  void setUpPasswordControllerListener() {
    registerPasswordController.addListener(() {
      setState(() {
        hasUpperCase=AppRegex.hasUpperCaseLetter(registerPasswordController.text);
        hasLowerCase=AppRegex.hasLowerCaseLetter(registerPasswordController.text);
        hasSpecialCharacters=AppRegex.specialCharacter(registerPasswordController.text);
        hasNumber=AppRegex.hasNumber(registerPasswordController.text);
        hasMinLength=AppRegex.minOf8Characters(registerPasswordController.text);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        children:
        [
          CustomTextFormFiled(
              hintText:'User name' ,
              textEditingController: context.read<RegisterCubit>().userNameController,
              textInputType: TextInputType.text,
              validate: (value){
                return MyValidation.nameValidation(value);
              }
          ),
          verticalSpacing(15),
          CustomTextFormFiled(
              hintText:'Email' ,
              textEditingController: context.read<RegisterCubit>().emailController,
              textInputType: TextInputType.emailAddress,
              validate: (value){
                return MyValidation.emailValidation(value);
              }
          ),
          verticalSpacing(15),
          CustomTextFormFiled(
              textInputFormatter:FilteringTextInputFormatter.digitsOnly,
              hintText:'Phone',
              textEditingController: context.read<RegisterCubit>().phoneController,
              textInputType: TextInputType.number,
              validate: (value){
                return MyValidation.phoneNumberValidation(value);
              }
          ),
          verticalSpacing(15),
          CustomTextFormFiled(
              hintText:'Password' ,
              textEditingController: context.read<RegisterCubit>().passwordController,
              textInputType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                onPressed: (){
                  setState(() {
                    isObscurePassword=!isObscurePassword;
                  });
                },
                icon: isObscurePassword? Icon(
                  Icons.visibility_off,
                  size: 17.sp,
                  color: AppColors.buttonIconsColor,
                ):Icon(
                  Icons.visibility,
                  size: 17.sp,
                  color: AppColors.buttonIconsColor,
                ),
              ),
              validate: (value){
                return MyValidation.passwordValidation(value);
              }
          ),
          verticalSpacing(10),
          PasswordValidations(
            hasLowerCase:hasLowerCase ,
            hasMinLength:hasMinLength ,
            hasNumber: hasNumber,
            hasSpecialCharacters: hasSpecialCharacters,
            hasUpperCase: hasUpperCase,
          ),
          verticalSpacing(15),
          CustomTextFormFiled(
              hintText:'Conform Password' ,
              textEditingController: context.read<RegisterCubit>().conformPasswordController,
              suffixIcon: IconButton(
                onPressed: (){
                  setState(() {
                    isObscureTextConformPassword=!isObscureTextConformPassword;
                  });
                },
                icon: isObscureTextConformPassword? Icon(
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
              validate: (value){
                return MyValidation.repeatPasswordValidation(
                    password:context.read<RegisterCubit>().passwordController.text,value: value
                );
              }
          ),
        ],
      ),
    );
  }
}
