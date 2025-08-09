abstract class TokenState{}
class TokenInitState extends TokenState{}
class TokenSuccessState extends TokenState{
  final String? token;

  TokenSuccessState({required this.token});
}