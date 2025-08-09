import 'package:a_to_z_store/config/routes/routes.dart';
import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/error_widget.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/loading_widget.dart';
import 'package:a_to_z_store/feature/auth/forgot_password/view/forgot_password_page.dart';
import 'package:a_to_z_store/feature/auth/forgot_password/view/reset_code_widget.dart';
import 'package:a_to_z_store/feature/auth/login/view/login_page.dart';
import 'package:a_to_z_store/feature/auth/register/view/register_page.dart';
import 'package:a_to_z_store/feature/cart/ui/view/cart_page.dart';
import 'package:a_to_z_store/feature/cart/ui/view_model/cart_view_model.dart';
import 'package:a_to_z_store/feature/product/ui/view/product_page.dart';
import 'package:a_to_z_store/feature/token_state.dart';
import 'package:a_to_z_store/feature/token_view_model.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_state.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_view_model.dart';
import 'package:a_to_z_store/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/bloc_observer/bloc_observer.dart';
import 'config/themeing/light_theme.dart';
import 'core/di/di.dart';
import 'feature/start/ui/view/start_page.dart';
import 'feature/start/ui/view_model/start_state.dart';
import 'feature/start/ui/view_model/start_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  TokenViewModel tokenViewModel=TokenViewModel();
  final WishListViewModel wishListViewModel = getIt<WishListViewModel>();
  final CartViewModel cartViewModel = getIt<CartViewModel>();
  StartViewModel startViewModel=StartViewModel();
  //String? token;
  @override
  Widget build(BuildContext context) {

    return BlocProvider<TokenViewModel>(
      create:(context) => tokenViewModel..getToken() ,
      child: BlocConsumer<TokenViewModel,TokenState>(
        listener: (context, state) {
          // if (state is UserTokenStartState) {
          //   token = state.token;
          //   print('token is $token');
          // }
        },
        builder:
            (context, state) {

          return ScreenUtilInit(
              designSize: Size(430, 932),
              builder:
                  (context, child) =>
                      state is TokenSuccessState?
                      MaterialApp(
                    theme: LightTheme.lightTheme,
                    themeMode: ThemeMode.light,
                    initialRoute:
                    state.token == null ||state.token!.isEmpty
                            ? AppRoutes.loginRoute
                            : AppRoutes.startRoute,
                    routes: {
                      AppRoutes.startRoute:
                          (context) => BlocProvider<WishListViewModel>(
                            create:
                                (context) =>
                                    wishListViewModel
                                      ..getWishList(),
                            child: BlocConsumer<WishListViewModel,WishListState>(
                              listener: (context, state) {

                              },
                              builder:(context, state) =>  BlocProvider<StartViewModel>(
                                  create: (context) =>startViewModel ,
                                  child: BlocConsumer<StartViewModel,StartState>(
                                      listener: (context, state) {

                                      },
                                      builder:(context, state) =>  BlocProvider(
                                          create: (context) => cartViewModel,
                                          child: StartPage()))),
                            ),
                          ),
                      AppRoutes.testRoute: (context) => TestPage(),
                      AppRoutes.loginRoute: (context) => LoginPage(),
                      AppRoutes.registerRoute: (context) => RegisterPage(),
                      AppRoutes.resetCodeRoute: (context) => ResetCodeWidget(),
                      AppRoutes.forgotPasswordRoute:
                          (context) => ForgotPasswordPage(),
                      AppRoutes.productRoute: (context) => ProductPage(),
                      AppRoutes.cartRoute: (context) =>CartPage(),
                    },
                  ):Container()
            );

      }),
    );

  }
}
