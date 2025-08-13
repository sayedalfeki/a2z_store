import 'package:a_to_z_store/core/utils/helper/helper_function.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/custome_container.dart';
import 'package:a_to_z_store/feature/home/ui/ad/view/ads_widget.dart';
import 'package:a_to_z_store/feature/products/ui/view/products_widget.dart';
import 'package:a_to_z_store/feature/categories/ui/view/product_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductHomePage extends StatelessWidget {
  const ProductHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: AdsWidget()),
        Expanded(
            flex: 3,
            child: ProductCategoryWidget()),
      ],
    );
  }
}
