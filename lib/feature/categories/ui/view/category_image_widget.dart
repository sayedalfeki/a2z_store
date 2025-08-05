import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors/color.dart';
import '../../../../core/utils/re_usable_widget/custome_container.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../start/ui/view_model/start_view_model.dart';

class CategoryImageWidget extends StatelessWidget {
  const CategoryImageWidget({super.key,required this.categoryName,required this.imagePath});
  final String imagePath;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    StartViewModel startViewModel=BlocProvider.of<StartViewModel>(context);

    return  Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            image: DecorationImage(image:NetworkImage(
              imagePath
              //
                 //   ??''
            ),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    // color: Colors.red,
                    width:66.w,
                    child: Expanded(
                      child: Text(
                        categoryName
                       //
                        ,style: AppStyle.blueBold18.copyWith(
                          fontSize:20,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print(startViewModel.selectedIndex);
                    startViewModel.pushToProduct();
                  },
                  child: CustomContainer(
                    color: AppColor.mainColor,
                    child: Text('shop now'),
                  ),
                ),
              ],
            )
            //Image.asset(AppImages.ad1Image),
          ],
        ));
  }
}
