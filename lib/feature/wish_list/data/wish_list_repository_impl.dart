import 'package:a_to_z_store/feature/wish_list/domain/wish_list_data_source.dart';
import 'package:a_to_z_store/feature/wish_list/domain/wish_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../core/data_response/data_response.dart';
import '../domain/wish_list_add_entity.dart';
import '../domain/wish_list_entity.dart';
@Injectable(as: WishListRepository)
class WishListRepositoryImpl extends WishListRepository
{
  final WishListDataSource wishListDataSource;

  WishListRepositoryImpl({required this.wishListDataSource});
  @override
  Future<DataResponse<WishListAddEntity>> addToWishList({required String token,
    required String productId})async
  {
    return await wishListDataSource.addToWishList(token: token, productId: productId);
  }
  @override
  Future<DataResponse<WishListEntity>> getWishList({required String token})async
  {
    return await wishListDataSource.getWishList(token: token);
  }
  @override
  Future<DataResponse<WishListAddEntity>> deleteFromWishList({required String token,
    required String productId})async
  {
    return await wishListDataSource.deleteFromWishList(token: token, productId: productId);
  }
}