import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({super.key,this.width,this.height,this.color,
    this.borderColor=AppColor.blackColor,this.radius,
    this.child,this.padding,this.margin});
 double? padding;
 double? margin;
  double? height;
 double? width;
 double? radius;
 Color? color;
 Color borderColor;
 Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:width ,
      height: height,
      padding:EdgeInsets.all(padding??8.w),
      margin:EdgeInsets.all(margin??8.w),
      decoration: BoxDecoration(
        border: Border.all(color:borderColor ),
        borderRadius: BorderRadius.circular(radius??16.r),
        color: color
      ),
      child: child,
    );
  }
}
