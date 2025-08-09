import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({super.key,this.width,this.height,this.color,
    this.borderColor=AppColor.blackColor,this.radius,
    this.child,this.padding,this.margin,this.image,this.alignment});
 double? padding;
 double? margin;
  double? height;
 double? width;
 double? radius;
 Color? color;
 Color borderColor;
 Widget? child;
 DecorationImage? image;
 Alignment? alignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width:width ,
      height: height,
      padding:EdgeInsets.all(padding??8.w),
      margin:EdgeInsets.all(margin??8.w),
      decoration: BoxDecoration(
        image:image ,
        border: Border.all(color:borderColor ),
        borderRadius: BorderRadius.circular(radius??16.r),
        color: color
      ),
      child: child,
    );
  }
}
