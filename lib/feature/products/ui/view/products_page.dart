

import 'package:a_to_z_store/config/routes/routes.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/error_widget.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/loading_widget.dart';

import 'package:a_to_z_store/feature/products/ui/view/products_item_widget.dart';

import 'package:a_to_z_store/feature/start/ui/view_model/start_view_model.dart';
import 'package:a_to_z_store/feature/token_view_model.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_state.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../cart/ui/view_model/cart_view_model.dart';

import '../../../product/domain/Single_product_entity.dart';
import '../../../wish_list/domain/wish_list_entity.dart';
import '../../domain/products_entity.dart';
import '../view_model/products_view_model.dart';
import '../view_model/products_state.dart';
class ProductsPage extends StatelessWidget {
   ProductsPage({super.key});
  final ProductsViewModel categoryProductViewModel =getIt<ProductsViewModel>();
  List<SingleProductDataEntity> products=[];
  List<SingleProductDataEntity> wishes=[];
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    StartViewModel startViewModel=BlocProvider.of<StartViewModel>(context);
    TokenViewModel tokenViewModel=BlocProvider.of<TokenViewModel>(context);
    WishListViewModel wishViewModel=BlocProvider.of<WishListViewModel>(context);
    CartViewModel cartViewModel=BlocProvider.of<CartViewModel>(context);
    return BlocConsumer<WishListViewModel,WishListState>(
      bloc: wishViewModel..getWishList(),
      listener: (context, state) {
        if(state is WishListSuccessState)
        {
          isLoading=false;
          wishes=state.wishListEntity??[];
        }
        if(state is WishListAddingSuccessState)
        {
          isLoading=true;
          wishViewModel.getWishList();
        }
      },
      builder:(context, state) =>
          state is WishListErrorState?
        AppErrorWidget(error: state.errorMessage,
    onPressed: () {
      wishViewModel.getWishList();
    },
    ): BlocConsumer(
        bloc: categoryProductViewModel..getProducts(''),
        listener: (context, state) {
          if(state is ProductsSuccessState)
          {
            products=state.data;
          }
        },
        builder:(context, state) =>
        state is ProductsErrorState?
          AppErrorWidget(error: state.errorMessage,
      onPressed: () {

      },
      ): products.isNotEmpty?
      GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
            (crossAxisCount:2,
          childAspectRatio:.5
          ),
          itemCount:products.length,
          itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
             // Navigator.pushNamed(context,AppRoutes.productRoute,arguments: state.data[index].id);
            startViewModel.pushToSingleProduct(products[index].id??'');
            },
            child: ProductsItemWidget(productDataDto:
              products[index],
              isLoading:isLoading ,
              isFavorite: wishViewModel.isFavorite(products[index].productId??'',wishes),
              onFavoriteClicked: () {
                wishViewModel.isFavorite(products[index].productId??'',wishes)?
                wishViewModel.removeFromWishList(
                    productId:products[index].productId??'' ):
                wishViewModel.addToWishList(
                     productId:products[index].productId??'' );
              },
              onAddToCartClicked: () {
                cartViewModel.addToCart(productId: products[index].productId??'');
              },
              ),
          );
        },):
        state is ProductsLoadingState?
              LoadingWidget():
        Text('no products founded')
      ),
    );
  }
}
