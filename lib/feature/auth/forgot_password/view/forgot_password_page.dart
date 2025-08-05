import 'package:a_to_z_store/core/utils/images/images.dart';
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

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final ForgetPassWordViewModel forgetPassWordViewModel =
      ForgetPassWordViewModel(
        ForgetPassWordUseCase(
          ForgetPassWordRepositoryImpl(
            ForgetPassWordRemoteDataSourceImp(ApiManager()),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: forgetPassWordViewModel,
      listener: (context, state) {
        if (state is ForgetPassWordLoadingState) {
          AppDialogue.viewDialogue(context, '');
        }
        if (state is ForgetPassWordSuccessState) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context,AppRoutes.resetCodeRoute);

          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       contentPadding: EdgeInsets.zero,
          //       content: ResetCodeWidget(),
          //     );
          //   },
          // );
          //AppDialogue.viewDialogue(context,'');
        }
        if (state is ForgetPassWordErrorState) {
          Navigator.pop(context);
          AppDialogue.viewDialogue(context,state.errorMessage!,
              cancelText:'cancel',cancelAction: (){} );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: Theme.of(
            context,
          ).iconTheme.copyWith(color: AppColor.appYellowColor),
          backgroundColor: Colors.transparent,
          title: Text('forgot password', style: AppStyle.yellowRoboto14),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: forgetPassWordViewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppImages.ad1Image),
                SizedBox(height: 15),
                TextFormField(
                  cursorColor: AppColor.whiteColor,
                  validator: AppValidation.validateEmail,
                  controller: forgetPassWordViewModel.emailController,
                  style: AppStyle.whiteNormal15,
                  decoration: InputDecoration(
                    hintText: 'email',
                    labelText: 'email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    forgetPassWordViewModel.verifyEmail();
                    },
                  child: Text('verify email', style: AppStyle.blackRegular16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
