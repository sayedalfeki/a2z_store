import 'package:a_to_z_store/core/utils/re_usable_widget/custome_container.dart';
import 'package:a_to_z_store/feature/start/ui/view_model/start_view_model.dart';
import 'package:a_to_z_store/feature/token_view_model.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view/wish_list_item_widget.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_state.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class WishListPage extends StatelessWidget {
  const WishListPage({super.key});
  @override
  Widget build(BuildContext context) {
    WishListViewModel wishListViewModel=BlocProvider.of<WishListViewModel>(context);
    TokenViewModel tokenViewModel=BlocProvider.of<TokenViewModel>(context);
    return BlocConsumer<WishListViewModel,WishListState>(
      bloc: wishListViewModel..getWishList(),
      listener: (context, state) {

      },
      builder:(context, state) =>  Expanded(
        child: ListView.builder(
            itemCount:wishListViewModel.wishes.length ,
            itemBuilder:(context, index) {
              return WishListItemWidget(wishListDataEntity:
                  
                wishListViewModel.wishes[index],
                onIconClicked: () {
                 wishListViewModel.removeFromWishList(
                     productId:wishListViewModel.wishes[index].productId??'');
                 wishListViewModel.getWishList();
                }, isFavorite: true
                ,);
            }, ),
      ),
    );
  }
}
