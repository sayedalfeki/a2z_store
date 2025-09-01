

import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/custome_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/category.dart';
class CategoryWidgetItem extends StatelessWidget {
  const CategoryWidgetItem({super.key,required this.selected,
  required this.dataEntity
  });
final bool selected;
final CategoryDataEntity dataEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: selected?EdgeInsets.all(2):EdgeInsets.zero,
     // margin: selected?EdgeInsets.all():EdgeInsets.zero,
     decoration: BoxDecoration(
         color: selected?AppColor.whiteColor:AppColor.transparentColor,
       // border: Border(
       //     top: BorderSide(color:selected? AppColor.mainColor:AppColor.transparentColor),
       // left:BorderSide(color: AppColor.mainColor),
       // ),
       // borderRadius:!isTop?null: BorderRadius.only(
       //   topLeft: Radius.circular(8)
       // )
     ),
      child: Row(
        children: [
          Visibility(
            visible: true,
            child: CustomContainer(
              borderColor: Colors.transparent,
              padding: 0,
              margin:8,
             // width:7,
              height:90.h,
              color:selected?AppColor.mainColor:AppColor.transparentColor,
              radius: 35,
            ),
          ),
          Expanded(child: Text(dataEntity.name??''))
        ],
      ),
    );
  }
}
