import 'package:a_to_z_store/core/data_response/data_response.dart';
import 'package:a_to_z_store/feature/cart/domain/cart_entity.dart';

abstract class CartDataSource
{
  Future<DataResponse<CartEntity>> getAllCarts();
  Future<DataResponse<CartEntity>> addToCart({required String productId});
  Future<DataResponse<CartEntity>> removeFromCart({required String productId});
}