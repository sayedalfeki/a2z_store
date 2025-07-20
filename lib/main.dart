import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/themeing/light_theme.dart';
import 'feature/start/ui/view/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430,932),
      builder:(context, child) =>  MaterialApp(
        theme: LightTheme.lightTheme,
      themeMode: ThemeMode.light,
      home: StartPage(),
      ),
    );
  }
}


