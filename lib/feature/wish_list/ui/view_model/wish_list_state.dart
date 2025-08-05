import 'package:a_to_z_store/feature/wish_list/data/wish_list_add_dto.dart';
import 'package:a_to_z_store/feature/wish_list/domain/wish_list_add_entity.dart';
import 'package:a_to_z_store/feature/wish_list/domain/wish_list_entity.dart';

abstract class WishListState{}
class WishListInitState extends WishListState{}
class WishListLoadingState extends WishListState{}
class WishListSuccessState extends WishListState{
  final List<WishListDataEntity>? wishListEntity;
  WishListSuccessState({required this.wishListEntity});
}
class WishListAddingSuccessState extends WishListState{
  final WishListAddEntity? wishListAddEntity;
  WishListAddingSuccessState({required this.wishListAddEntity});
}
class WishListErrorState extends WishListState{
  final String errorMessage;
  WishListErrorState({required this.errorMessage});
}