import 'package:a_to_z_store/core/utils/images/images.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';
import 'package:a_to_z_store/feature/product_home/ui/category/domain/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key,required this.dataEntity});
 final DataEntity dataEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundImage:NetworkImage(dataEntity.image??'',

          ),
        ),
        Expanded(child: Text(dataEntity.name??'',style: AppStyle.blueNormal14,))
      ],
    );
  }
}
