import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../domain/forget_password_use_case.dart';
import 'forget_password_state.dart';
@injectable
class ForgetPassWordViewModel extends Cubit<ForgetPassWordState> {
  ForgetPassWordUseCase forgetPassWordUseCase;
  ForgetPassWordViewModel(this.forgetPassWordUseCase)
    : super(ForgetPassWordInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController resetCodeController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var resetCodeFormKey = GlobalKey<FormState>();
  var changePasswordFormKey = GlobalKey<FormState>();
  bool isPassWordHidden=true;
  changeIsPasswordHidden()
  {
    isPassWordHidden=!isPassWordHidden;
    emit(ChangeIsPasswordHiddenState());
  }
  verifyEmail() async {
    if (formKey.currentState!.validate()) {
      emit(ForgetPassWordLoadingState());
      final response = await forgetPassWordUseCase.verifyEmail(
        emailController.text,
      );
      if (response.response != null) {
        emit(ForgetPassWordSuccessState(response.response?.message));
      } else {
        emit(ForgetPassWordErrorState(response.error));
      }
    }
  }

  resetCode() async {
    if (resetCodeFormKey.currentState!.validate()) {
      emit(ResetCodeLoadingState());
      final response = await forgetPassWordUseCase.resetCode(
        resetCodeController.text,
      );
      if (response.response != null) {
        emit(ResetCodeSuccessState(response.response?.status));
      } else {
        emit(ResetCodeErrorState(response.error));
      }
    }
  }

  changePassword() async {
    if (changePasswordFormKey.currentState!.validate()) {
      emit(ChangePasswordLoadingState());
      final response = await forgetPassWordUseCase.changePassword(
        emailController.text,
        newPasswordController.text,
      );
      if (response.response != null) {
        emit(ChangePasswordSuccessState(response.response?.token));
      } else {
        emit(ChangePasswordErrorState(response.error));
      }
    }
  }
}
