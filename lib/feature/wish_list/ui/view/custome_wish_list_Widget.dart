import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/domain/Single_product_entity.dart';
import '../../../token_view_model.dart';
import '../../domain/wish_list_entity.dart';
import '../view_model/wish_list_state.dart';
import '../view_model/wish_list_view_model.dart';

class CustomWishListWidget extends StatelessWidget {
   CustomWishListWidget({super.key,required this.builder});
  List<SingleProductDataEntity> wishes=[];
  Widget Function(BuildContext context,WishListState state) builder;
  @override
  Widget build(BuildContext context) {
    TokenViewModel tokenViewModel=BlocProvider.of(context);
    WishListViewModel wishListViewModel=BlocProvider.of(context);
    return BlocConsumer<WishListViewModel,WishListState>(
        bloc: wishListViewModel..getWishList(),
        listener: (context, state) {
          if(state is WishListSuccessState)
          {
            wishes=state.wishListEntity??[];
          }
          if(state is WishListAddingSuccessState)
          {
            wishListViewModel.getWishList();
          }
        },
        builder:builder);
  }
}
