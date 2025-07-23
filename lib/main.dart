import 'package:a_to_z_store/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/bloc_observer/bloc_observer.dart';
import 'config/themeing/light_theme.dart';
import 'feature/start/ui/view/start_page.dart';

void main() {
  Bloc.observer=MyBlocObserver();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430,932),
      builder:(context, child) =>  MaterialApp(
        theme: LightTheme.lightTheme,
      themeMode: ThemeMode.light,
      home:StartPage(),
      ),
    );
  }
}


