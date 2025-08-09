import 'package:a_to_z_store/core/dto/product_dto.dart';
import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/images/images.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/custome_container.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/loading_widget.dart';
import 'package:flutter/material.dart';
import '../../../product/domain/Single_product_entity.dart';
import '../../domain/products_entity.dart';
class ProductsItemWidget extends StatelessWidget {
  ProductsItemWidget({super.key,required this.productDataDto,
  required this.onFavoriteClicked,required this.isFavorite,
    required this.isLoading,required this.onAddToCartClicked
  });
SingleProductDataEntity productDataDto;
final void Function() onFavoriteClicked;
final bool isFavorite;
final bool isLoading;
final void Function() onAddToCartClicked;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding:0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
           // flex:3,
              child: Container(
            alignment: Alignment.topRight,
            //margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(
              productDataDto.imageCover??'',
              ),fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16)
              )
            ),
            child: GestureDetector(
              onTap:onFavoriteClicked ,
              child: CustomContainer(
                alignment: Alignment.center,
                width:35,
                height:35,
                radius:50,
                color: AppColor.whiteColor,
                child:isLoading?
                LoadingWidget():
                Icon(isFavorite?
                Icons.favorite_outlined:
                Icons.favorite_border_outlined,size: 20,),
              ),
            ),
          )),
          Expanded(
            //flex: 2,
            child: Padding(padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productDataDto.title??''),
                Text(productDataDto.slug??''),
                Row(
                  children: [
                    Text('${productDataDto.price} EGP'),
                    //Text('200 EGP',),
                  ],
                ),
                Row(
                  children: [
                    Text('Review (${productDataDto.ratingsAverage})'),
                    Icon(Icons.star),
                    Spacer(),
                    GestureDetector(
                      onTap:onAddToCartClicked ,
                      child: CustomContainer(
                          width: 50,
                          height: 50,
                          radius: 25,
                          color: AppColor.mainColor,
                          child: Icon(Icons.add,color: AppColor.whiteColor,)),
                    )
                  ],
                )
              ],
            ),
            ),
          ),
        ],
      ),
    );
  }
}
