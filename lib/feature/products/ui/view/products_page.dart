

import 'package:a_to_z_store/config/routes/routes.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/error_widget.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/loading_widget.dart';
import 'package:a_to_z_store/feature/home/ui/brands/domain/category_product.dart';
import 'package:a_to_z_store/feature/products/ui/view/products_item_widget.dart';
import 'package:a_to_z_store/feature/home/ui/brands/view_model/category_product_state.dart';
import 'package:a_to_z_store/feature/start/ui/view_model/start_view_model.dart';
import 'package:a_to_z_store/feature/token_view_model.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_state.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../home/ui/brands/view_model/category-product_view_model.dart';
import '../../../wish_list/domain/wish_list_entity.dart';
class ProductsPage extends StatelessWidget {
   ProductsPage({super.key});
  final CategoryProductViewModel categoryProductViewModel =getIt<CategoryProductViewModel>();
  List<CategoryProductDataEntity> products=[];
  List<WishListDataEntity> wishes=[];
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    StartViewModel startViewModel=BlocProvider.of<StartViewModel>(context);
    TokenViewModel tokenViewModel=BlocProvider.of<TokenViewModel>(context);
    WishListViewModel wishViewModel=BlocProvider.of<WishListViewModel>(context);
    return BlocConsumer<WishListViewModel,WishListState>(
      bloc: wishViewModel..getWishList(token: tokenViewModel.token??''),
      listener: (context, state) {
        if(state is WishListSuccessState)
        {
          isLoading=false;
          wishes=state.wishListEntity??[];
        }
        if(state is WishListAddingSuccessState)
        {
          isLoading=true;
          wishViewModel.getWishList(token: tokenViewModel.token??'');
        }
      },
      builder:(context, state) =>
          state is WishListErrorState?
        AppErrorWidget(error: state.errorMessage,
    onPressed: () {
      wishViewModel.getWishList(token: tokenViewModel.token??'');
    },
    ): BlocConsumer(
        bloc: categoryProductViewModel..getCategoryProducts(''),
        listener: (context, state) {
          if(state is CategoryProductSuccessState)
          {
            products=state.data;
          }
        },
        builder:(context, state) =>
        state is CategoryProductErrorState?
          AppErrorWidget(error: state.errorMessage,
      onPressed: () {

      },
      ): products.isNotEmpty?
      GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
            (crossAxisCount:2,
          childAspectRatio:.75
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
                wishViewModel.removeFromWishList(token:tokenViewModel.token??''
                    , productId:products[index].productId??'' ):
                wishViewModel.addToWishList(token:tokenViewModel.token??''
                    , productId:products[index].productId??'' );
              },
              ),
          );
        },):
        state is CategoryProductLoadingState?
              LoadingWidget():
        Text('no products founded')
      ),
    );
  }
}
