import 'package:a_to_z_store/core/api/api_manager.dart';
import 'package:a_to_z_store/core/utils/helper/helper_function.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/error_widget.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/loading_widget.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';
import 'package:a_to_z_store/feature/product_home/ui/brands/domain/category_product.dart';
import 'package:a_to_z_store/feature/product_home/ui/category/data/category_repository_impl.dart';
import 'package:a_to_z_store/feature/product_home/ui/category/data/online_data_source/online_category_data_source_impl.dart';
import 'package:a_to_z_store/feature/product_home/ui/category/domain/category.dart';
import 'package:a_to_z_store/feature/product_home/ui/category/domain/category_use_case.dart';
import 'package:a_to_z_store/feature/product_home/ui/category/view/category_item_widget.dart';
import 'package:a_to_z_store/feature/product_home/ui/category/view_model/category_state.dart';
import 'package:a_to_z_store/feature/product_home/ui/category/view_model/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../brands/view/brand_widget.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});
  final CategoryViewModel categoryViewModel = CategoryViewModel(
    categoryUseCase: CategoryUseCase(
      categoryRepository: CategoryRepositoryImpl(
        categoryDataSource: OnlineCategoryDataSourceImpl(
          apiManager: ApiManager.instance,
        ),
      ),
    ),
  );
  List<DataEntity> categories = [];
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
          (context, state) => Container(
            //height:500.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [Text('categories',
                style: AppStyle.blueNormal14,), Spacer(),
                  Text('view all',style: AppStyle.blueNormal14,)]),
                SizedBox(height: 15.h),
                categories.isNotEmpty
                    ? Container(
                      height:450.h,
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
                                    child: CategoryItemWidget(
                                      dataEntity: categories[index],
                                    ),
                                  ),
                            ),
                          ),
                          SizedBox(height: 15.h,),
                          Expanded(
                            child: BrandWidget(
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
          ),
    );
  }
}
