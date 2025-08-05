import 'package:a_to_z_store/feature/wish_list/domain/wish_list_add_entity.dart';
import 'package:a_to_z_store/feature/wish_list/domain/wish_list_entity.dart';

import '../../../core/data_response/data_response.dart';

abstract class WishListDataSource
{
  Future<DataResponse<WishListAddEntity>> addToWishList({required String token,
    required String productId});
  Future<DataResponse<WishListEntity>> getWishList({required String token});
  Future<DataResponse<WishListAddEntity>> deleteFromWishList({required String token,
  required String productId
  });
}