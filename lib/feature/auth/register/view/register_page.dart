
import 'package:a_to_z_store/core/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/utils/colors/color.dart';
import '../../../../core/utils/re_usable_widget/app_dialoge.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/utils/validation/app_validation.dart';
import '../data/register_remot_data_source/register_remot_dio_data_Source.dart';
import '../data/register_repository_impl.dart';
import '../domain/register_use_case.dart';
import '../view_model/register_state.dart';
import '../view_model/register_view_model.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});
  final RegisterViewModel registerViewModel=RegisterViewModel(
    RegisterUseCase(
      registerRepository: RegisterRepositoryImpl
        (registerDataSource:RegisterRemoteDioDataSource(ApiManager()) )
    )
  );
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterViewModel,RegisterState>(
      bloc: registerViewModel,
      listener:(context, state) {
             if(state is RegisterLoadingState)
             {
               //Navigator.pop(context);
               AppDialogue.viewDialogue(context,'');
             }
             if(state is RegisterSuccessState)
             {
               Navigator.pop(context);
               AppDialogue.viewDialogue(context,'registered successfully',
                   acceptText: 'continue',acceptAction: (){
                     Navigator.pushNamed(context,AppRoutes.startRoute);
               });
             }
             if(state is RegisterErrorState)
             {
               Navigator.pop(context);
               AppDialogue.viewDialogue(context,state.errorMessage!,
               cancelText: 'cancel',
                 cancelAction: (){}
               );
             }
      } ,
      builder:(context, state) =>  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: Theme.of(context).iconTheme.copyWith(
            color:AppColor.appYellowColor
          ),
          backgroundColor: Colors.transparent,
          title: Text('register',style: AppStyle.yellowRoboto14,),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: registerViewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Image.asset(AppImages.ad1Image),
                   Image.asset(AppImages.ad2Image),
                   Image.asset(AppImages.ad3Image),
                 ],
               ),
                Spacer(),
                TextFormField(
                  validator: AppValidation.validateText,
                  controller: registerViewModel.userNameController,
                  style: AppStyle.whiteNormal15,
                  decoration: InputDecoration(
                    hintText: 'name',
                    labelText: 'name',
                    prefixIcon: Icon(Icons.perm_contact_calendar_outlined),
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  validator: AppValidation.validateEmail,
                  controller: registerViewModel.emailController,
                  style: AppStyle.whiteNormal15,
                  decoration: InputDecoration(
                    hintText: 'email',
                    labelText: 'email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  validator: AppValidation.validatePassword,
                  controller: registerViewModel.passWordController,
                  style: AppStyle.whiteNormal15,
                  obscureText: !registerViewModel.isPasswordShowed,
                  decoration: InputDecoration(
                      hintText: 'password',
                      labelText: 'password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon : IconButton(
                          onPressed: () {
                            registerViewModel.changeIsPasswordShowed();
                          },
                          icon: Icon(registerViewModel.isPasswordShowed?
                          Icons.visibility:Icons.visibility_off))
                  ),

                ),
                SizedBox(height: 15,),
                TextFormField(
                  validator: (value) {
                    return AppValidation.validateConfirmPassword(value,
                        registerViewModel.passWordController.text);
                   },
                  controller: registerViewModel.confirmPassWordController,
                  style: AppStyle.whiteNormal15,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'confirm password',
                    labelText: 'confirm password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility_off)
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  validator: AppValidation.validatePhone,
                  controller: registerViewModel.phoneController,
                  style: AppStyle.whiteNormal15,
                  decoration: InputDecoration(
                    hintText: 'phone',
                    labelText: 'phone',
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: () {
                  registerViewModel.register();
                },
                    child: Text('create account',style: AppStyle.blackRegular16,)),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('already have an account??',style: AppStyle.whiteNormal15,),
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                    },child: Text('login',style: AppStyle.yellowRoboto14,))
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Spacer(),
                    //CustomLanguageWidget(),
                    Spacer()
                  ],
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}