
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:plant_snap/Core/Resources/app_const.dart';
import 'package:plant_snap/Core/Resources/fontWeightText.dart';
import 'package:plant_snap/Core/helpers/cach_helper.dart';
import 'package:plant_snap/Features/Authentication/presentation/cubit/registerCubit/cubit.dart';
import 'package:plant_snap/Features/Authentication/presentation/cubit/registerCubit/states.dart';
import '../../../../Core/Resources/app_colors.dart';
class RegisterCubitListener extends StatelessWidget {
  const RegisterCubitListener({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit,RegisterState>(
        listener: (context,state){
          if(state is RegisterCreateUserSuccess){
            Navigator.pop(context);
            CashHelper.setDataMorePrivet(tokenValue: state.userModel.uId);
            AppConsts.uIdUser=state.userModel.uId;
            Fluttertoast.showToast(
                msg: "Account successfully created,please login now",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 18.sp
            );
          }else if(state is ErrorRegisterState){
            Dialogs.materialDialog(
              msgStyle: TextStyle(
                color: AppColors.black,
                fontSize: 19.sp,
                fontWeight: FontWeightAppText.medium
              ),
                msg: state.errorMassage.toString(),
                title: "Error",
                color: Colors.white,
                context: context,
                actions: [
                  IconsOutlineButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Cancel',
                    iconData: Icons.cancel_outlined,
                    textStyle: const TextStyle(color: Colors.grey),
                    iconColor: Colors.red,
                  ),
                ]);
          }else if(state is LoadingRegisterState){
             showDialog(
              context: context,
              builder: (context)=>Center(
                child: CircularProgressIndicator(
                  color: AppColors.buttonIconsColor,
                ),
              ),
            );
          }
        },
        child: const SizedBox.shrink());
  }

}
