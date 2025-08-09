import 'package:a_to_z_store/feature/wish_list/domain/wish_list_add_entity.dart';
import 'package:a_to_z_store/feature/wish_list/domain/wish_list_entity.dart';
import 'package:a_to_z_store/feature/wish_list/domain/wish_list_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../core/data_response/data_response.dart';
@injectable
class WishListUseCase
{
  final WishListRepository wishListRepository;
  WishListUseCase({required this.wishListRepository});
  Future<DataResponse<WishListAddEntity>> addToWishList({
    required String productId})async
  {
    return await wishListRepository.addToWishList( productId: productId);
  }
  Future<DataResponse<WishListEntity>> getWishList()async
  {
    return await wishListRepository.getWishList();
  }
  Future<DataResponse<WishListAddEntity>> deleteFromWishList({
    required String productId
  })async {
    return await wishListRepository.deleteFromWishList(productId: productId);
  }
}