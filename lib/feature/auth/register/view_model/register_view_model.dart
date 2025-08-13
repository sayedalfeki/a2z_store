import 'dart:convert';

import 'package:a_to_z_store/feature/auth/register/view_model/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/register_use_case.dart';
import '../request_entity/register_request_entity.dart';
@injectable
class RegisterViewModel extends Cubit<RegisterState>
{
  RegisterViewModel(this.registerUseCase):super(RegisterInitialState());
  late RegisterUseCase registerUseCase;
  TextEditingController userNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passWordController=TextEditingController();
  TextEditingController confirmPassWordController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  bool isPasswordShowed=false;
  changeIsPasswordShowed()
  {
    isPasswordShowed=!isPasswordShowed;
    emit(ShowingPasswordState());
  }
  register()async
  {
    if(formKey.currentState!.validate())
    {
      emit(RegisterLoadingState());
      RegisterRequestEntity registerRequestEntity=RegisterRequestEntity(
        name: userNameController.text,
        email: emailController.text,
        password: passWordController.text,
        rePassword: confirmPassWordController.text,
        phone: phoneController.text
      );
      var response=await registerUseCase.invoke(registerRequestEntity);
      if(response.response!=null)
      {
       SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
       sharedPreferences.setString('user',jsonEncode(registerRequestEntity.toJson()));
       emit(RegisterSuccessState(response.response));
      }
      else
      {
        emit(RegisterErrorState(response.error));
      }
      //emit(RegisterNavigationState());
    }
  }
}