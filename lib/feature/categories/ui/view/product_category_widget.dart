import 'package:a_to_z_store/core/api/api_manager.dart';
import 'package:a_to_z_store/core/di/di.dart';
import 'package:a_to_z_store/core/utils/helper/helper_function.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/error_widget.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/loading_widget.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';
import 'package:a_to_z_store/feature/categories/ui/view/product_category_item_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../products/ui/view/products_widget.dart';
import '../../domain/category.dart';
import '../view_model/category_state.dart';
import '../view_model/category_view_model.dart';
class ProductCategoryWidget extends StatelessWidget {
  ProductCategoryWidget({super.key});
  final CategoryViewModel categoryViewModel = getIt<CategoryViewModel>();
  List<CategoryDataEntity> categories = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryViewModel, CategoryState>(
      bloc: categoryViewModel..getCategories(),
      listener: (context, state) {
        if (state is CategorySuccessState) {
          categories = state.categories;
        }
      },
      builder:
          (context, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [Text('categories',
              style: AppStyle.blueNormal14,), Spacer(),
                Text('view all',style: AppStyle.blueNormal14,)]),
              SizedBox(height: 15.h),
              categories.isNotEmpty
                  ? Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  childAspectRatio:
                                      isLargeWidth(context)
                                          ? 1
                                          : 2.25.w / 3.h,
                                ),
                            itemCount:8,
                            itemBuilder:
                                (context, index) => GestureDetector(
                                  onTap: () {
                                    categoryViewModel.changeSelectedIndex(
                                      index,
                                    );
                                  },
                                  child: ProductCategoryItemWidget(
                                    dataEntity: categories[index],
                                  ),
                                ),
                          ),
                        ),
                        SizedBox(height: 15.h,),
                        Expanded(
                          child: ProductsWidget(
                            categoryName:
                                categories[categoryViewModel.selectedIndex]
                                    .name ??
                                '',
                            categoryId: categories[categoryViewModel.selectedIndex].id??'',
                          ),
                        ),
                      ],
                    ),
                  )
                  : state is CategoryLoadingState
                  ? LoadingWidget()
                  : state is CategoryErrorState
                  ? AppErrorWidget(error: state.errorMessage,
              onPressed: () {
                categoryViewModel.getCategories();
              },
              )
                  : Container(),
            ],
          ),
    );
  }
}
