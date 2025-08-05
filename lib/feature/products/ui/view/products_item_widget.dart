import 'package:a_to_z_store/core/dto/product_dto.dart';
import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/images/images.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/custome_container.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/loading_widget.dart';
import 'package:a_to_z_store/feature/home/ui/brands/domain/category_product.dart';
import 'package:flutter/material.dart';

class ProductsItemWidget extends StatelessWidget {
  ProductsItemWidget({super.key,required this.productDataDto,
  required this.onFavoriteClicked,required this.isFavorite,
    required this.isLoading
  });
CategoryProductDataEntity productDataDto;
final void Function() onFavoriteClicked;
final bool isFavorite;
final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding:0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
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
          Padding(padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('nike air jordon'),
              Text('nike shoes flexible for wo..'),
              Row(
                children: [
                  Text('EGP 1,200'),
                  Text('200 EGP',
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Review (4.6)'),
                  Icon(Icons.star),
                  Spacer(),
                  CustomContainer(
                      width: 50,
                      height: 50,
                      radius: 25,
                      color: AppColor.mainColor,
                      child: Icon(Icons.add,color: AppColor.whiteColor,))
                ],
              )
            ],
          ),
          ),

        ],
      ),
    );
  }
}
