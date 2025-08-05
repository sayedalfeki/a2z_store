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
class ResetCodeWidget extends StatelessWidget {

  final ForgetPassWordViewModel forgetPassWordViewModel=ForgetPassWordViewModel(
      ForgetPassWordUseCase(ForgetPassWordRepositoryImpl
        (ForgetPassWordRemoteDataSourceImp(ApiManager())))
  );

  ResetCodeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: forgetPassWordViewModel,
      listener: (context, state) {
        if (state is ResetCodeLoadingState) {
          AppDialogue.viewDialogue(context, '');
        }
        if (state is ResetCodeSuccessState) {
          print(state.message);
          Navigator.pop(context);
          AppDialogue.viewDialogue(context,state.message!,acceptText: 'continue',
          acceptAction: (){
             Navigator.pushReplacementNamed(context,AppRoutes.changePasswordRoute);
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
        if (state is ResetCodeErrorState) {
          Navigator.pop(context);
          AppDialogue.viewDialogue(context,state.errorMessage!,
              cancelText:'cancel',cancelAction: (){} );
        }
      },
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: forgetPassWordViewModel.resetCodeFormKey,
              child: Column(
               // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    cursorColor: AppColor.whiteColor,
                    validator: AppValidation.validateText,
                    controller: forgetPassWordViewModel.resetCodeController,
                    style: AppStyle.whiteNormal15,
                    decoration: InputDecoration(
                      hintText: 'enter sent code',
                      labelText: 'reset code',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 15,),
                  ElevatedButton(onPressed: () {
                    //Navigator.pop(context);
                    forgetPassWordViewModel.resetCode();
                  },
                      child: Text('reset code',style: AppStyle.blackRegular16,)),
                ],
              ),
            ),
          ),
      ),
      );

  }

}