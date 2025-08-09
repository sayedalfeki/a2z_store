import 'package:a_to_z_store/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/utils/colors/color.dart';
import '../../../../core/utils/re_usable_widget/app_dialoge.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/utils/validation/app_validation.dart';
import '../data/forget_password_remote_data_source_impl.dart';
import '../data/forget_password_repository_imp.dart';
import '../domain/forget_password_use_case.dart';
import '../view_model/forget_password_state.dart';
import '../view_model/forget_password_view_model.dart';

class ChangePasswordWidget extends StatelessWidget {
  final ForgetPassWordViewModel forgetPassWordViewModel=getIt<ForgetPassWordViewModel>();
  ChangePasswordWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPassWordViewModel,ForgetPassWordState>(
      bloc: forgetPassWordViewModel,
      listener: (context, state) {
        if (state is ChangePasswordLoadingState) {
          AppDialogue.viewDialogue(context, '');
        }
        if (state is ChangePasswordSuccessState) {

          Navigator.pop(context);
          AppDialogue.viewDialogue(context,'password changes please login ',acceptText: 'continue',
              acceptAction: (){
                Navigator.pushReplacementNamed(context,AppRoutes.loginRoute);
              });
          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       contentPadding: EdgeInsets.zero,
          //       content: ChangePasswordWidget(),
          //     );
          //   },
          // );
          //AppDialogue.viewDialogue(context,'');
        }
        if (state is ChangePasswordErrorState) {
          Navigator.pop(context);
          AppDialogue.viewDialogue(context,state.errorMessage!,
              cancelText:'cancel',cancelAction: (){} );
        }
      },
      builder:(context, state) =>  Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: forgetPassWordViewModel.changePasswordFormKey,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    cursorColor: AppColor.whiteColor,
                    validator: AppValidation.validateEmail,
                    controller: forgetPassWordViewModel.emailController,
                    style: AppStyle.whiteNormal15,
                    decoration: InputDecoration(
                      hintText: 'email',
                      labelText: 'email',
                      labelStyle: AppStyle.yellowRoboto14,
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    cursorColor: AppColor.whiteColor,
                    validator: AppValidation.validatePassword,
                    controller: forgetPassWordViewModel.newPasswordController,
                    style: AppStyle.whiteNormal15,
                    decoration: InputDecoration(
                      labelStyle: AppStyle.yellowRoboto14,
                      hintText: 'enter new password',
                      labelText: 'password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          forgetPassWordViewModel.changeIsPasswordHidden();
                        },
                        icon: Icon(forgetPassWordViewModel.isPassWordHidden?
                        Icons.visibility_off:Icons.visibility),
                      ),

                    ),
                    obscureText: forgetPassWordViewModel.isPassWordHidden,
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      forgetPassWordViewModel.changePassword();
                    },
                    child: Text('change password', style: AppStyle.blackRegular16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
