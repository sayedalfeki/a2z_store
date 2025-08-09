import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle
{
  static  TextStyle blackNormal14=GoogleFonts.cairo(
    color:AppColor.black26Color,
    fontSize: 14.sp ,
    fontWeight: FontWeight.normal
  );
  static  TextStyle sloganStyle=GoogleFonts.aclonica(
    fontSize: 18.sp,
    color: AppColor.mainColor
  );
  static  TextStyle blueBold18=GoogleFonts.cairo(
      fontSize: 18.sp,
      color: AppColor.mainColor
  );
  static  TextStyle blueNormal14=GoogleFonts.cairo(
      fontSize: 14.sp,
      color: AppColor.mainColor
  );
  static  TextStyle whiteBold18=GoogleFonts.cairo(
      fontSize: 18.sp,
      color: AppColor.whiteColor
  );
  static  TextStyle whiteNormal15=TextStyle(
      fontSize: 15.sp,
      color: AppColor.whiteColor,
      fontWeight: FontWeight.normal
  );
  static  TextStyle whiteBold24=TextStyle(
      fontSize: 24.sp,
      color: AppColor.whiteColor,
      fontWeight: FontWeight.bold
  );
  static  TextStyle blackRegular16=TextStyle(
      fontSize: 16.sp,
      color: AppColor.mainColor,
      fontWeight: FontWeight.w400
  );
  static  TextStyle blackNormal20=TextStyle(
      fontSize:20.sp,
      color: AppColor.mainColor,
      fontWeight: FontWeight.normal
  );
  static  TextStyle yellowRoboto14=TextStyle(
      fontSize: 14.sp,
      color: AppColor.appYellowColor,
      fontWeight: FontWeight.w500
  );
}