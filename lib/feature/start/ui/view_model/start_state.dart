abstract class StartState{}
class StartInitState extends StartState{}
class ChangeIndexStartState extends StartState{}
class ChangeLangStartState extends StartState{}
class UserTokenStartState extends StartState{
  String? token;
  UserTokenStartState(this.token);
}