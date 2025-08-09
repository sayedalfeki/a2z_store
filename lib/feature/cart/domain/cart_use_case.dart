import 'package:a_to_z_store/core/data_response/data_response.dart';
import 'package:a_to_z_store/feature/cart/domain/cart_entity.dart';
import 'package:a_to_z_store/feature/cart/domain/cart_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
 class CartUseCase
{
  final CartRepository cartRepository;

  CartUseCase({required this.cartRepository});
  Future<DataResponse<CartEntity>> getAllCarts()async{
    return await cartRepository.getAllCarts();
  }
  Future<DataResponse<CartEntity>> addToCart({required String productId})async{
    return await cartRepository.addToCart(productId: productId);
  }
  Future<DataResponse<CartEntity>> removeFromCart({required String productId})async{
    return await cartRepository.removeFromCart(productId: productId);
  }
}