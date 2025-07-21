import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle
{
  static  TextStyle blackNormal14=GoogleFonts.acme(
    color:AppColor.black26Color,
    fontSize: 14.sp ,
    fontWeight: FontWeight.normal
  );
  static  TextStyle sloganStyle=GoogleFonts.aclonica(
    fontSize: 18.sp,
    color: AppColor.mainColor
  );
  static  TextStyle blueBold18=GoogleFonts.acme(
      fontSize: 18.sp,
      color: AppColor.mainColor
  );
  static  TextStyle whiteBold18=GoogleFonts.nobile(
      fontSize: 18.sp,
      color: AppColor.whiteColor
  );

}