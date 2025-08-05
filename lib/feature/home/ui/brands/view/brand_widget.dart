import 'package:a_to_z_store/core/api/api_manager.dart';
import 'package:a_to_z_store/core/di/di.dart';
import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/custome_container.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/error_widget.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/loading_widget.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';
import 'package:a_to_z_store/feature/home/ui/brands/data/category_product_repository_impl.dart';
import 'package:a_to_z_store/feature/home/ui/brands/data/online_data_source/online_data_source_impl.dart';
import 'package:a_to_z_store/feature/home/ui/brands/domain/category_product.dart';
import 'package:a_to_z_store/feature/home/ui/brands/domain/category_product_use_case.dart';
import 'package:a_to_z_store/feature/home/ui/brands/view/brand_item_widget.dart';
import 'package:a_to_z_store/feature/home/ui/brands/view_model/category-product_view_model.dart';
import 'package:a_to_z_store/feature/home/ui/brands/view_model/category_product_state.dart';
import 'package:a_to_z_store/feature/home/ui/category/view_model/category_view_model.dart';
import 'package:a_to_z_store/feature/start/ui/view_model/start_view_model.dart';
import 'package:a_to_z_store/feature/wish_list/domain/wish_list_entity.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_state.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../token_view_model.dart';
class BrandWidget extends StatelessWidget {
   BrandWidget({super.key, required this.categoryName,
     required this.categoryId});
  final String categoryName;
  final String categoryId;
  final CategoryProductViewModel categoryProductViewModel =getIt<CategoryProductViewModel>();
      // CategoryProductViewModel(
      //   categoryProductUseCase: CategoryProductUseCase(
      //     categoryProductRepository: CategoryProductRepositoryImp(
      //       categoryProductDataSource: CategoryProductOnlineDataSourceImpl(
      //         apiManager: ApiManager(),
      //       ),
      //     ),
      //   ),
      // );
   List<CategoryProductDataEntity> products=[];
   List<WishListDataEntity> wishes=[];
  @override
  Widget build(BuildContext context) {
    TokenViewModel tokenViewModel=BlocProvider.of(context);
    WishListViewModel wishListViewModel=BlocProvider.of(context);
    return BlocConsumer<WishListViewModel,WishListState>(
      bloc: wishListViewModel..getWishList(token: tokenViewModel.token??''),
      listener: (context, state) {
       if(state is WishListSuccessState)
       {
         wishes=state.wishListEntity??[];
       }
       if(state is WishListAddingSuccessState)
       {
         wishListViewModel.getWishList(token: tokenViewModel.token??'');
       }
      },
      builder:(context, state) =>  BlocConsumer<CategoryProductViewModel,CategoryProductState>(
       bloc: categoryProductViewModel..getCategoryProducts(categoryId),
        listener: (context, state) {
           if(state is CategoryProductSuccessState)
           {
             products=state.data;
           }

        },
        builder:(context, state) =>  Container(
          //height: 225.h,
          //color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(categoryName,style: AppStyle.blueNormal14,),
              products.isNotEmpty?Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:products.length,
                    itemBuilder: (context, index) {
                      return BrandItemWidget(
                        categoryProductDataEntity:products[index],
                        isFavorite: wishListViewModel.isFavorite(products[index].productId??'',
                        wishes
                        ),
                        onFavoritePressed: () async{
                          wishListViewModel.isFavorite(products[index].productId??'',wishes)?
                          wishListViewModel.removeFromWishList(token:tokenViewModel.token??''
                              , productId:products[index].productId??'' ):
                          wishListViewModel.addToWishList(token:tokenViewModel.token??''
                              , productId:products[index].productId??'' );
                          // wishListViewModel.getWishList(token:tokenViewModel.token??'');
                           //     .then((v){
                           //  // categoryProductViewModel.getCategoryProducts(categoryId);
                           // });
                        },
                      );
                    },
                  )
              ):
        state is CategoryProductLoadingState?
              LoadingWidget():
            state is CategoryProductErrorState?
              AppErrorWidget(error: state.errorMessage,
              onPressed: () {
                categoryProductViewModel.getCategoryProducts(categoryId);
              },
              ):
               CustomContainer(
                borderColor: AppColor.mainColor,
                child: Text('no products in this category',
                style: AppStyle.blueBold18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
