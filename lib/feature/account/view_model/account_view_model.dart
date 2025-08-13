import 'dart:convert';
import 'package:a_to_z_store/feature/account/view_model/account_state.dart';
import 'package:a_to_z_store/feature/auth/register/request_entity/register_request_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AccountViewModel extends Cubit<AccountState>
{
  AccountViewModel():super(AccountInitState());
  TextEditingController fullNameController=TextEditingController(text: 'sayed elfeki');
  TextEditingController fullEmailController=TextEditingController(text: 'sayed@yahoo.com');
  TextEditingController passwordController=TextEditingController(text: '***************');
  TextEditingController fullAddressController=TextEditingController(text: '6 october street giza');
  TextEditingController mobileController=TextEditingController(text: '123456789');
 bool isFullNameEdit=true;
 bool isFullEmailEdit=true;
 bool isPasswordEdit=true;
 bool isFullAddressEdit=true;
 bool isMobileEdit=true;
 String name='';
 String email='';
 changeIsFullNameEdit()
 {
   isFullNameEdit=!isFullNameEdit;
   emit(AccountChangeParamsState());
 }
  changeIsFullEmailEdit()
  {
    isFullEmailEdit=!isFullEmailEdit;
    emit(AccountChangeParamsState());
  }
  changeIsPasswordEdit()
  {
    isPasswordEdit=!isPasswordEdit;
    emit(AccountChangeParamsState());
  }
  changeIsFullAddressEdit()
  {
    isFullAddressEdit=!isFullAddressEdit;
    emit(AccountChangeParamsState());
  }
  changeIsMobileEdit()
  {
    isMobileEdit=!isMobileEdit;
    emit(AccountChangeParamsState());
  }
  getUserData()async
  {
    try {
      emit(AccountLoadingState());
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? user = preferences.getString('user');
      //print(user);
      if (user != null) {
        var userData = jsonDecode(user);
        print(userData);
        RegisterRequestEntity registerRequestEntity = RegisterRequestEntity.
        fromJson(userData);
        fullNameController.text = registerRequestEntity.name ?? '';
        fullEmailController.text = registerRequestEntity.email ?? '';
        passwordController.text = registerRequestEntity.password ?? '';
        mobileController.text = registerRequestEntity.phone ?? '';
        name=registerRequestEntity.name??'';
        email=registerRequestEntity.email??'';
        emit(AccountSuccessState());
      }
      else {
        emit(AccountErrorState());
      }
    }catch(e,s)
    {
      emit(AccountErrorState(
        errorMessage: 'Exception is $e in\n $s'
      ));
    }
  }
}