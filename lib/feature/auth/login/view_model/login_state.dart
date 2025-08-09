abstract class LoginState{}
class LoginInitialState extends LoginState{}
class LoginErrorState extends LoginState{
  String? errorMessage;
  LoginErrorState(this.errorMessage);
}
class LoginSuccessState extends LoginState{}
class LoginLoadingState extends LoginState{}
class ShowingPasswordState extends LoginState{}
