import 'package:a_to_z_store/core/data_response/data_response.dart';
import 'package:a_to_z_store/feature/cart/domain/cart_data_source.dart';
import 'package:a_to_z_store/feature/cart/domain/cart_entity.dart';
import 'package:injectable/injectable.dart';

import '../domain/cart_repository.dart';
@Injectable(as:CartRepository )
 class CartRepositoryImpl extends CartRepository
{
  final CartDataSource cartDataSource;

  CartRepositoryImpl({required this.cartDataSource});
  @override
  Future<DataResponse<CartEntity>> getAllCarts()async
  {
    return await cartDataSource.getAllCarts();
  }
  @override
  Future<DataResponse<CartEntity>> addToCart({required String productId})async
  {
    return await cartDataSource.addToCart(productId: productId);
  }
  @override
  Future<DataResponse<CartEntity>> removeFromCart({required String productId})async
  {
    return await cartDataSource.removeFromCart(productId: productId);
  }
}