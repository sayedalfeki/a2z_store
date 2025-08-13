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
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Flexible(
         // flex: 2,
          child: ListView(

            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'up to 25% OFF',
                      style:
                      index % 2 == 0
                          ? AppStyle.blueBold18.copyWith(
                        fontSize:18,
                      )
                          : AppStyle.whiteBold18.copyWith(
                          fontSize:18
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'For all Headphones & AirPods',
                      style:
                      index % 2 == 0
                          ? AppStyle.blueBold18.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal
                      )
                          : AppStyle.whiteBold18.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Expanded(
        //  // flex: 2,
        //
        // ),
        Flexible(
          child: CustomContainer(
            borderColor: AppColor.transparentColor,
            color: AppColor.mainColor,
            padding:0,
            radius: 4,
            margin: 4,
            child: Text('shop now',
                style: AppStyle.whiteBold18.copyWith(
                    fontSize: 14.sp
                )),
          ),
        ),
      ],
    );
  }
}
