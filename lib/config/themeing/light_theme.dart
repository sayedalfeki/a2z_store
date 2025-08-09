import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LightTheme
{
 static ThemeData lightTheme=ThemeData(
   scaffoldBackgroundColor: AppColor.blackColor,
   iconTheme: IconThemeData(
     color: AppColor.mainColor
   ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
        borderSide: BorderSide(color: AppColor.mainColor),
        gapPadding: 16.w
      ),
        hintStyle:AppStyle.blackNormal14
    )
  );
}