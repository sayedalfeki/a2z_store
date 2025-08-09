import 'package:a_to_z_store/core/di/di.dart';
import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/custome_container.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/error_widget.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/loading_widget.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';
import 'package:a_to_z_store/feature/cart/domain/cart_entity.dart';
import 'package:a_to_z_store/feature/cart/ui/view/cart_item_widget.dart';
import 'package:a_to_z_store/feature/cart/ui/view_model/cart_state.dart';
import 'package:a_to_z_store/feature/cart/ui/view_model/cart_view_model.dart';
import 'package:a_to_z_store/feature/start/ui/view_model/start_view_model.dart';
import 'package:a_to_z_store/feature/token_view_model.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view/wish_list_item_widget.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_state.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CartPage extends StatelessWidget {
  CartPage({super.key});
  final CartViewModel cartViewModel=getIt<CartViewModel>();
  List<CartProductsEntity> cartProducts=[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartViewModel,CartState>(
      bloc:cartViewModel..getAllCarts(),
      listener: (context, state) {
        if(state is CartSuccessState)
        {
          cartProducts=state.cartProducts??[];
        }
      },
      builder:(context, state) =>  Column(
        children: [
          state is CartErrorState?
          AppErrorWidget(error: state.errorMessage,
          onPressed: () {
            cartViewModel.getAllCarts();
          },
          ):
         cartProducts.isNotEmpty? Expanded(
            child: ListView.builder(
                itemCount:cartProducts.length,
                itemBuilder:(context, index) {
                  return CartItemWidget(cartProductEntity:
                    cartProducts[index].product,
                    onDelete: () {
                      cartViewModel.removeFromCart(productId:
                      cartProducts[index].product?.id??'');
                    },
                    );
                }, ),
          ):state is CartLoadingState?
          LoadingWidget():Container(child: Text('no products founded'),),
          Row(
            children: [
              Column(
                children: [
                  Text('Total Price'),
                  Text('3500')
                ],
              ),
              SizedBox(width: 15,),
              Expanded(
                child: CustomContainer(
                  alignment: Alignment.center,
                  color: AppColor.mainColor,
                  borderColor: AppColor.transparentColor,
                  child: Text('CheckOut   ->',style: AppStyle.whiteNormal15,),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
