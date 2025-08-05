import 'package:a_to_z_store/core/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/utils/colors/color.dart';
import '../../../../core/utils/re_usable_widget/app_dialoge.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/utils/validation/app_validation.dart';
import '../data/login_repository_impl.dart';
import '../data/remot_data_source/login_remot_data_source_dio_imp.dart';
import '../domain/login_use_case.dart';
import '../view_model/login_state.dart';
import '../view_model/login_view_model.dart';
class LoginPage extends StatelessWidget {
   LoginPage({super.key});
 final LoginViewModel loginViewModel=LoginViewModel(
   LoginUseCase(
     LoginRepositoryImpl(LoginRemoteDataSourceDioImp(ApiManager()))
   )
 );
  @override
  Widget build(BuildContext context) {
    double height=16.h;
    print(height);
    return BlocConsumer<LoginViewModel,LoginState>(
      bloc: loginViewModel,
      listener: (BuildContext context, LoginState state) {
        if(state is LoginLoadingState)
        {
          AppDialogue.viewDialogue(context,'');
        }
        if(state is LoginSuccessState)
        {
          Navigator.pop(context);
          AppDialogue.viewDialogue(context,'login successfully',
          acceptText: 'continue',
          acceptAction:(){
            Navigator.pushNamed(context, AppRoutes.startRoute);
          }
          );
        }
        if(state is LoginErrorState)
        {
          Navigator.pop(context);
          AppDialogue.viewDialogue(context,state.errorMessage!,
          cancelText: 'cancel',
            cancelAction: (){

            }
          );
        }
      },
      builder:(context, state) =>  Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.all(height),
            child: Form(
              key: loginViewModel.loginKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height:50.h,),
                  Container(
                   // color: AppColor.appRedColor,
                    height: 100.h,
                    child: Image.asset(
                        AppImages.ad1Image,
                    fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(height:100.h,),
                  TextFormField(
                    validator: AppValidation.validateEmail,
                    controller: loginViewModel.emailController,
                    style: AppStyle.whiteNormal15,
                    decoration: InputDecoration(
                      hintText: 'email',
                      labelText: 'email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  TextFormField(
                    validator: AppValidation.validatePassword,
                  controller: loginViewModel.passwordController,
                    style: AppStyle.whiteNormal15,
                    decoration: InputDecoration(
                      hintText: 'password',
                      labelText: 'password',
                      prefixIcon: Icon(Icons.lock),
                     suffixIcon : IconButton(
                         onPressed: ()
                         {
                           loginViewModel.changeIsPasswordShowed();
                           },
                         icon:Icon(loginViewModel.isPasswordShowed?
                         Icons.visibility:Icons.visibility_off)),

                    ),
                    obscureText: !loginViewModel.isPasswordShowed,
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context,AppRoutes.forgotPasswordRoute);
                          },
                          child: Text('forget password ?',style: AppStyle.yellowRoboto14,))
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  ElevatedButton(onPressed: () {
              loginViewModel.login();
                  },
                      child: Text('login',style: AppStyle.blackRegular16,)),
                  SizedBox(height: 15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('dont have account?',style: AppStyle.whiteNormal15,),
                      TextButton(onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.registerRoute);
                        },child: Text('create one',style: AppStyle.yellowRoboto14,))
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.h,
                        width: 100.w,
                        color: AppColor.appYellowColor,
                      ),
                      Text(' or ',style: AppStyle.yellowRoboto14,),
                      Container(
                        height: 1.h,
                        width: 100.w,
                        color: AppColor.appYellowColor,
                      )
                    ],
                  ),
                SizedBox(height: 20.h,),
                  ElevatedButton(onPressed: (){}, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('G',style: AppStyle.blackNormal20.copyWith(
                        fontSize:35,
                        color: AppColor.appLightBlackColor
                      ),),
                      SizedBox(width: 5.w,),
                      Text('login with google',
                        style:AppStyle.blackRegular16 ,),
                    ],
                  )),
                  SizedBox(height: 15.h,),
                  Row(
                    children: [
                      Spacer(),
                      //CustomLanguageWidget(),
                      Spacer()
                    ],
                  ),
                  SizedBox(height: 20.h,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
