import 'dart:io';

import 'package:a_to_z_store/config/routes/routes.dart';
import 'package:a_to_z_store/feature/start/ui/view_model/start_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
class StartViewModel extends Cubit<StartState>
{
  StartViewModel():super(StartInitState());
  int selectedIndex=0;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  List<String> pagesRoute=[AppRoutes.homeRoute,AppRoutes.categoriesRoute,
    AppRoutes.wishRoute,AppRoutes.accountRoute];
  String lang='arabic';
  changeLang(String newLang)
  {
    lang=newLang;
    emit(ChangeLangStartState());
  }

  changeSelectedIndex(int value)
  {
    selectedIndex=value;
    navigatorKey.currentState?.pushReplacementNamed(pagesRoute[selectedIndex]);
    // print(selectedIndex);
    emit(ChangeIndexStartState());
  }
  void pushToProduct() {
    navigatorKey.currentState?.pushNamed(AppRoutes.productsRoute);
    //emit(ChangeIndexStartState());
  }
  void pushToSingleProduct(String productId) {
    navigatorKey.currentState?.pushNamed(AppRoutes.productRoute,arguments: productId);
    //emit(ChangeIndexStartState());
  }
  pushToCart()
  {
    navigatorKey.currentState?.pushNamed(AppRoutes.cartRoute);
  }
  void goBack()
  {
    navigatorKey.currentState?.pop();
  }
  logoutUser()async
  {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.remove('token');
    exit(0);
  }
}