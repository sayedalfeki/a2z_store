import 'package:a_to_z_store/core/utils/re_usable_widget/custome_container.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/error_widget.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/loading_widget.dart';
import 'package:a_to_z_store/feature/account/view_model/account_state.dart';
import 'package:a_to_z_store/feature/account/view_model/account_view_model.dart';
import 'package:a_to_z_store/feature/start/ui/view_model/start_state.dart';
import 'package:a_to_z_store/feature/start/ui/view_model/start_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AccountPage extends StatelessWidget {
   AccountPage({super.key});
  AccountViewModel accountViewModel=AccountViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountViewModel,AccountState>(
      bloc: accountViewModel..getUserData(),
      listener: (context, state)
      {

      },
      builder:(context, state) =>
          state is AccountErrorState?
      AppErrorWidget(error:state.errorMessage?? 'no user registered',
    onPressed: () {
        print(state.errorMessage);
      accountViewModel.getUserData();
    },
    ):state is AccountLoadingState?
      LoadingWidget():
      Column(
        spacing:20,
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('welcome ${accountViewModel.name}'),
              Text(accountViewModel.email),
            ],
          ),
          accountWidget('your full name',controller:accountViewModel.fullNameController,
          onPressed: accountViewModel.changeIsFullNameEdit,
            readOnly: accountViewModel.isFullNameEdit
          ),
          accountWidget('your E-mail',
              controller:accountViewModel.fullEmailController,
          onPressed:accountViewModel.changeIsFullEmailEdit,
          readOnly: accountViewModel.isFullEmailEdit
          ),
          accountWidget('your password', controller:accountViewModel.passwordController,
              onPressed:accountViewModel.changeIsPasswordEdit,
              readOnly: accountViewModel.isPasswordEdit,isPassword: true  ),
          accountWidget('your mobile number', controller:accountViewModel.mobileController,
              onPressed:accountViewModel.changeIsMobileEdit,
              readOnly: accountViewModel.isMobileEdit  ),
          accountWidget('your Address',  controller:accountViewModel.fullAddressController,
              onPressed:accountViewModel.changeIsFullAddressEdit,
              readOnly: accountViewModel.isFullAddressEdit  ),
          Flexible(child: Container())
          // Text(startViewModel.lang),
          // ElevatedButton(onPressed: () {
          //   startViewModel.changeLang(startViewModel.lang=='arabic'?'english':'arabic');
          // }, child:Text('change to ${startViewModel.lang=='arabic'?'english':'arabic'}'))
        ],
      ),
    );
    
  }
  accountWidget(String title, {required TextEditingController controller,
    required bool readOnly,
required void Function() onPressed,bool isPassword=false
  } )
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(height: 10,),
        TextFormField(
          controller: controller,
          readOnly:readOnly ,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed:onPressed,
                  icon: Icon(Icons.edit),

              ),
          ),
          obscureText: isPassword,
        )
      ],
    );
  }
}
