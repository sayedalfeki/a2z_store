import 'package:a_to_z_store/feature/token_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenViewModel extends Cubit<TokenState>
{
  TokenViewModel():super(TokenInitState());
  String? token;
  getToken()async
  {
    SharedPreferences preferencesAsync=await SharedPreferences.getInstance();
    token= preferencesAsync.getString('token');
    print('token is : $token');
    emit(TokenSuccessState(token: token));
  }

}