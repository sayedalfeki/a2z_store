import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/images/images.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../product/domain/Single_product_entity.dart';
import '../../domain/products_entity.dart';

class HomeProductsItemWidget extends StatelessWidget {
  const HomeProductsItemWidget({super.key,required this.categoryProductDataEntity,
  this.isFavorite=false,required this.onFavoritePressed
  });
 final SingleProductDataEntity categoryProductDataEntity;
 final bool isFavorite;
 final void Function() onFavoritePressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158.w,
      height: 200.h,
      alignment: Alignment.topRight,
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical:16.h),
      decoration: BoxDecoration(
        image: DecorationImage(image:NetworkImage(
          categoryProductDataEntity.imageCover??'',
        ),fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(16.r)
      ),
      child: GestureDetector(
        onTap: onFavoritePressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColor.whiteColor
          ),
          child: Icon(isFavorite?Icons.favorite_outlined:Icons.favorite_border),
        ),
      ),

    );
  }
}
