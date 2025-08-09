import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/images/images.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/custome_container.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/image_icon_widget.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';
import 'package:a_to_z_store/feature/cart/domain/cart_entity.dart';
import 'package:a_to_z_store/feature/wish_list/domain/wish_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/re_usable_widget/counter_widget.dart';
import '../../../product/domain/Single_product_entity.dart';
class CartItemWidget extends StatelessWidget {
  CartItemWidget({super.key, this.cartProductEntity,required this.onDelete});
  //final CartProductEntity? cartProductEntity;
  final SingleProductDataEntity? cartProductEntity;
  final void Function() onDelete;
 // int counter = 1;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: 0,
      height: 150.h,
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomContainer(
              borderColor: AppColor.transparentColor,
              margin: 0,
              padding: 0,
              radius: 16,
              //color: Colors.red,
              //  width: 100,
              //  height: 100,
              image: DecorationImage(
                image:
                    cartProductEntity == null
                        ? AssetImage(AppImages.ad1Image)
                        : NetworkImage(cartProductEntity?.imageCover ?? ''),
                fit: BoxFit.cover,
              ),
              //child:Image.asset(AppImages.ad1Image,fit: BoxFit.cover,)
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          cartProductEntity?.title ?? 'nike air jordan',
                          style: AppStyle.blackNormal20.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(onPressed:onDelete, icon: Icon(Icons.delete)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainer(
                        width: 10,
                        height: 10,
                        color: AppColor.blackColor,
                        radius: 30,
                        margin: 0,
                      ),
                      SizedBox(width: 5),
                      Text('black color'),
                      SizedBox(width: 5,),
                      Container(
                        width: 1,
                        height: 15,
                        color: AppColor.blackColor,
                      ),
                      SizedBox(width: 5,),
                      Text('Size:40'),

                      Spacer(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                       Expanded(child: Text('3500')),
                      Expanded(child: CounterWidget()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
