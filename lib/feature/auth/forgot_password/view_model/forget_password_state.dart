abstract class ForgetPassWordState{}
class ForgetPassWordInitialState extends ForgetPassWordState{}
class ForgetPassWordLoadingState extends ForgetPassWordState{}
class ForgetPassWordErrorState extends ForgetPassWordState{
  String? errorMessage;

  ForgetPassWordErrorState(this.errorMessage);
}
class ForgetPassWordSuccessState extends ForgetPassWordState{
  String? message;

  ForgetPassWordSuccessState(this.message);

}
class ResetCodeErrorState extends ForgetPassWordState{
  String? errorMessage;

  ResetCodeErrorState(this.errorMessage);
}
class ResetCodeLoadingState extends ForgetPassWordState{}
class ResetCodeSuccessState extends ForgetPassWordState{
  String? message;

  ResetCodeSuccessState(this.message);

}
class ChangePasswordErrorState extends ForgetPassWordState{
  String? errorMessage;

  ChangePasswordErrorState(this.errorMessage);
}
class ChangePasswordLoadingState extends ForgetPassWordState{}
class ChangePasswordSuccessState extends ForgetPassWordState{
  String? token;

  ChangePasswordSuccessState(this.token);

}
class ChangeIsPasswordHiddenState extends ForgetPassWordState{}

