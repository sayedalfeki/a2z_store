import 'package:a_to_z_store/feature/cart/domain/cart_entity.dart';

abstract class CartState{}
class CartInitState extends CartState{}
class CartLoadingState extends CartState{}
class CartSuccessState extends CartState{
  final List<CartProductsEntity>? cartProducts;

  CartSuccessState({required this.cartProducts});
}
class CartErrorState extends CartState{
  final String errorMessage;

  CartErrorState({required this.errorMessage});
}