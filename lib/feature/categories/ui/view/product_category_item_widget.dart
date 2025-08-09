import 'package:a_to_z_store/core/utils/images/images.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/category.dart';

class ProductCategoryItemWidget extends StatelessWidget {
  const ProductCategoryItemWidget({super.key,required this.dataEntity});
 final CategoryDataEntity dataEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: dataEntity.image??"http://via.placeholder.com/200x150",
            imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: 50.r,
              backgroundImage:imageProvider,

              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //       image: imageProvider,
              //       fit: BoxFit.cover,
              //       colorFilter:
              //       ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
              // ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        // CircleAvatar(
        //   radius: 50.r,
        //   backgroundImage:CachedNetworkImageProvider(
        //     dataEntity.image??"http://via.placeholder.com/350x150",
        //    // placeholder: (context, url) => CircularProgressIndicator(),
        //    // errorWidget: (context, url, error) => Icon(Icons.error),
        //   ),
        //   //NetworkImage(dataEntity.image??'',
        //
        //   ),

        Expanded(child: Text(dataEntity.name??'',style: AppStyle.blueNormal14,))
      ],
    );
  }
}
