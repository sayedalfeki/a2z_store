import 'package:a_to_z_store/feature/account/view_model/account_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountViewModel extends Cubit<AccountState>
{
  AccountViewModel():super(AccountInitState());
  TextEditingController fullNameController=TextEditingController();
  TextEditingController fullEmailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController fullAddressController=TextEditingController();
  TextEditingController mobileController=TextEditingController();

}