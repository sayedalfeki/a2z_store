import 'package:a_to_z_store/core/utils/re_usable_widget/custome_container.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors/color.dart';

class ProductInfoContainer extends StatelessWidget {
   ProductInfoContainer({super.key,required this.title,required this.items});
final String title;
List<Widget> items;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: 0,
      margin: 0,
      borderColor: AppColor.transparentColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(
              visible: title.isNotEmpty,
              child: Text(title,style: AppStyle.blueBold18,)),
          Row(

            children:items
          ),
        ],
      ),
    );
  }
}
