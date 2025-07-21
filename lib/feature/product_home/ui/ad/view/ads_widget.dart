import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/re_usable_widget/custome_container.dart';
import '../view_model/ad_state.dart';
import '../view_model/ad_view_model.dart';
class AdsWidget extends StatelessWidget {
  AdsWidget({super.key});
  final AdViewModel adViewModel = AdViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdViewModel, AdState>(
      bloc: adViewModel..move(),
      listener: (context, state) {
        if (state is AdChangeIndexState) {
          adViewModel.move();
        }
      },
      builder:
          (context, state) => PageView.builder(
            controller: adViewModel.pageController,
            itemCount: adViewModel.images.length,
            itemBuilder:
                (context, index) => CustomContainer(
                  borderColor: AppColor.transparentColor,
                  // padding: 0,
                  width: double.infinity,
                  height: 200.h,
                  image: DecorationImage(
                    image: AssetImage(adViewModel.images[index]),
                    fit: BoxFit.cover,
                  ),
                  child:

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:
                        index % 2 == 0
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.end,
                    children: [
                      Text(
                        'up to 25% OFF',
                        style:
                            index % 2 == 0
                                ? AppStyle.blueBold18
                                : AppStyle.whiteBold18,
                      ),
                      Text(
                        'For all Headphones & AirPods',
                        style:
                            index % 2 == 0
                                ? AppStyle.blueBold18
                                : AppStyle.whiteBold18,
                      ),
                      CustomContainer(
                        borderColor: AppColor.transparentColor,
                        color: AppColor.mainColor,
                        child: Text('shop now', style: AppStyle.whiteBold18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:
                            adViewModel.images.map((e) {
                              return CustomContainer(
                                padding: 0,
                                radius: 25.r,
                                width: 10.w,
                                height: 10.h,
                                color:
                                    index == adViewModel.images.indexOf(e)
                                        ? AppColor.mainColor
                                        : AppColor.whiteColor,
                              );
                            }).toList(),
                      ),
                    ],
                  ),
                ),
          ),
    );
  }


}
