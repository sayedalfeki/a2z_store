import 'package:a_to_z_store/core/di/di.dart';
import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/custome_container.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/error_widget.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/loading_widget.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';


import 'package:a_to_z_store/feature/products/ui/view/home_product_item_widget.dart';
import 'package:a_to_z_store/feature/start/ui/view_model/start_view_model.dart';


import 'package:a_to_z_store/feature/wish_list/domain/wish_list_entity.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_state.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/domain/Single_product_entity.dart';
import '../../../token_view_model.dart';
import '../../domain/products_entity.dart';
import '../view_model/products_view_model.dart';
import '../view_model/products_state.dart';

class ProductsWidget extends StatelessWidget {
  ProductsWidget({
    super.key,
    required this.categoryName,
    required this.categoryId,
  });
  final String categoryName;
  final String categoryId;
  final ProductsViewModel categoryProductViewModel =
      getIt<ProductsViewModel>();
  List<SingleProductDataEntity> products = [];
  List<SingleProductDataEntity> wishes = [];
  @override
  Widget build(BuildContext context) {
    TokenViewModel tokenViewModel = BlocProvider.of(context);
    WishListViewModel wishListViewModel = BlocProvider.of(context);
    StartViewModel startViewModel = BlocProvider.of(context);
    return
    //CustomWishListWidget(
    BlocConsumer<WishListViewModel, WishListState>(
      bloc: wishListViewModel..getWishList(),
      listener: (context, state) {
        if (state is WishListSuccessState) {
          wishes = state.wishListEntity ?? [];
        }
        if (state is WishListAddingSuccessState) {
          wishListViewModel.getWishList();
        }
      },
      // builder:(context, state) =>  BlocConsumer<CategoryProductViewModel,CategoryProductState>(
      //  bloc: categoryProductViewModel..getCategoryProducts(categoryId),
      //   listener: (context, state) {
      //      if(state is CategoryProductSuccessState)
      //      {
      //        products=state.data;
      //      }
      //
      //   },
      builder:
          (context, state) => BlocConsumer(
            bloc: categoryProductViewModel..getProducts(categoryId),
            listener: (context, state) {
              if (state is ProductsSuccessState) {
                products = state.data;
              }
            },
            builder:
                (context, state) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(categoryName, style: AppStyle.blueNormal14),
                    products.isNotEmpty
                        ? Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  startViewModel.pushToSingleProduct(products[index].id??'');

                                },
                                child: HomeProductsItemWidget(
                                  categoryProductDataEntity: products[index],
                                  isFavorite: wishListViewModel.isFavorite(
                                    products[index].productId ?? '',
                                    wishes,
                                  ),
                                  onFavoritePressed: () async {
                                    wishListViewModel.isFavorite(
                                          products[index].productId ?? '',
                                          wishes,
                                        )
                                        ? wishListViewModel.removeFromWishList(

                                          productId:
                                              products[index].productId ?? '',
                                        )
                                        : wishListViewModel.addToWishList(

                                          productId:
                                              products[index].productId ?? '',
                                        );
                                    // wishListViewModel.getWishList(token:tokenViewModel.token??'');
                                    //     .then((v){
                                    //  // categoryProductViewModel.getCategoryProducts(categoryId);
                                    // });
                                  },
                                ),
                              );
                            },
                          ),
                        )
                        : state is ProductsLoadingState
                        ? LoadingWidget()
                        : state is ProductsErrorState
                        ? AppErrorWidget(
                          error: state.errorMessage,
                          onPressed: () {
                            categoryProductViewModel.getProducts(
                              categoryId,
                            );
                          },
                        )
                        : CustomContainer(
                          borderColor: AppColor.mainColor,
                          child: Text(
                            'no products in this category',
                            style: AppStyle.blueBold18,
                          ),
                        ),
                  ],
                ),
          ),
    );
    // );
  }
}
