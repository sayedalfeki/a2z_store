import 'package:a_to_z_store/core/api/api_manager.dart';
import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/custome_container.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/error_widget.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/loading_widget.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';
import 'package:a_to_z_store/feature/product_home/ui/brands/data/category_product_repository_impl.dart';
import 'package:a_to_z_store/feature/product_home/ui/brands/data/online_data_source/online_data_source_impl.dart';
import 'package:a_to_z_store/feature/product_home/ui/brands/domain/category_product_use_case.dart';
import 'package:a_to_z_store/feature/product_home/ui/brands/view/brand_item_widget.dart';
import 'package:a_to_z_store/feature/product_home/ui/brands/view_model/category-product_view_model.dart';
import 'package:a_to_z_store/feature/product_home/ui/brands/view_model/category_product_state.dart';
import 'package:a_to_z_store/feature/product_home/ui/category/view_model/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandWidget extends StatelessWidget {
   BrandWidget({super.key, required this.categoryName,required this.categoryId});
  final String categoryName;
  final String categoryId;
  final CategoryProductViewModel categoryProductViewModel =
      CategoryProductViewModel(
        categoryProductUseCase: CategoryProductUseCase(
          categoryProductRepository: CategoryProductRepositoryImp(
            categoryProductDataSource: CategoryProductOnlineDataSourceImpl(
              apiManager: ApiManager.instance,
            ),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryProductViewModel,CategoryProductState>(
     bloc: categoryProductViewModel..getCategoryProducts(categoryId),
      listener: (context, state) {

      },
      builder:(context, state) =>  Container(
        //height: 225.h,
        //color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(categoryName,style: AppStyle.blueNormal14,),
      state is CategoryProductLoadingState?
            LoadingWidget():
          state is CategoryProductErrorState?
            AppErrorWidget(error: state.errorMessage,
            onPressed: () {
              categoryProductViewModel.getCategoryProducts(categoryId);
            },
            ):
              state is CategoryProductSuccessState?
            state.data.isNotEmpty?Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:state.data.length,
                itemBuilder: (context, index) {
                  return BrandItemWidget(
                    categoryProductDataEntity: state.data[index],
                  );
                },
              )
            ):CustomContainer(
              borderColor: AppColor.mainColor,
              child: Text('no products in this category',
              style: AppStyle.blueBold18,
              ),
            ):Container()
          ],
        ),
      ),
    );
  }
}
