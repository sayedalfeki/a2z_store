import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors/color.dart';
import '../../../../../core/utils/re_usable_widget/custome_container.dart';
import '../../../../../core/utils/styles/styles.dart';
class DiscountWidget extends StatelessWidget {
  const DiscountWidget({super.key,required this.index});
 final int index;
  @override
  Widget build(BuildContext context) {
    return  Container(
      //color: Colors.red,
      padding: EdgeInsets.all(8),
      width:MediaQuery.sizeOf(context).width*.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Text(
            'up to 25% OFF',
            style:
            index % 2 == 0
                ? AppStyle.blueBold18.copyWith(
              fontSize:22.sp,
            )
                : AppStyle.whiteBold18.copyWith(
                fontSize:22.sp
            ),
          ),
          Text(
            'For all Headphones & AirPods',
            style:
            index % 2 == 0
                ? AppStyle.blueBold18.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal
            )
                : AppStyle.whiteBold18.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal
            ),
          ),
          CustomContainer(
            borderColor: AppColor.transparentColor,
            color: AppColor.mainColor,
            padding:8,
            radius: 4,
            child: Text('shop now',
                style: AppStyle.whiteBold18.copyWith(
                    fontSize: 14.sp
                )),
          ),
        ],
      ),
    );
  }
}
