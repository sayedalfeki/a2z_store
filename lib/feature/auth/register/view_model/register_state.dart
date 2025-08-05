
import '../domain/register_entity.dart';

abstract class RegisterState{}
class RegisterInitialState extends RegisterState{}
class RegisterLoadingState extends RegisterState{}
class RegisterErrorState extends RegisterState{
  String? errorMessage;
  RegisterErrorState(this.errorMessage);
}
class RegisterSuccessState extends RegisterState{
  RegisterEntity? registerEntity;
  RegisterSuccessState(this.registerEntity);
}
class RegisterNavigationState extends RegisterState{}
class ShowingPasswordState extends RegisterState{}
