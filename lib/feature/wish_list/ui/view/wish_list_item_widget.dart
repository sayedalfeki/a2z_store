import 'package:a_to_z_store/config/routes/routes.dart';
import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/images/images.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/custome_container.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/image_icon_widget.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';
import 'package:a_to_z_store/feature/start/ui/view_model/start_view_model.dart';
import 'package:a_to_z_store/feature/wish_list/domain/wish_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../product/domain/Single_product_entity.dart';
class WishListItemWidget extends StatelessWidget {
  const WishListItemWidget({super.key,required this.wishListDataEntity,
  required this.onIconClicked,required this.isFavorite
  });
 final SingleProductDataEntity wishListDataEntity;
 final void Function() onIconClicked;
 final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    StartViewModel startViewModel=BlocProvider.of(context);
    return CustomContainer(
      padding: 0,
      height:130.h,
      child: Row(
       //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomContainer(
              borderColor: AppColor.transparentColor,
              margin: 0,
              padding: 0,
              radius:16,
              //color: Colors.red,
            //  width: 100,
            //  height: 100,
                image: DecorationImage(image: NetworkImage(wishListDataEntity.imageCover??''),fit: BoxFit.cover),
              //child:Image.asset(AppImages.ad1Image,fit: BoxFit.cover,)
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(wishListDataEntity.title??'',style: AppStyle.blackNormal20.copyWith(
                        fontSize: 14.sp
                      ),),
                    ),
                    Spacer(),
                    ImageIconWidget(
                      isFavorite:isFavorite ,
                      onFavoriteClicked: onIconClicked,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                      width: 10,
                      height: 10,
                      color: AppColor.blackColor,
                      radius: 30,
                      margin: 0,
                    ),
                    SizedBox(width: 5,),
                    Text('black color'),
                    Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  //color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('${wishListDataEntity.price}'),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('${wishListDataEntity.price}',
                          style: AppStyle.blackNormal14.copyWith(
                           // textBaseline:TextBaseline.alphabetic,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough
                          ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          startViewModel.pushToCart();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                         margin: EdgeInsets.all(4),
                         decoration: BoxDecoration(
                           color: AppColor.mainColor,
                           borderRadius: BorderRadius.circular(16)
                         ),
                          child: Text('Add to cart',
                          style: AppStyle.whiteNormal15.copyWith(
                            color: AppColor.whiteColor,
                            fontSize: 12
                          ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          ))
        ],
      ),
    );
  }
}
