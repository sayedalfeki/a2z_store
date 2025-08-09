import 'package:a_to_z_store/core/data_response/data_response.dart';
import 'package:a_to_z_store/feature/wish_list/domain/wish_list_entity.dart';
import 'package:a_to_z_store/feature/wish_list/domain/wish_list_use_case.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../product/domain/Single_product_entity.dart';
@injectable
class WishListViewModel extends Cubit<WishListState>
{
  final WishListUseCase wishListUseCase;

  WishListViewModel({required this.wishListUseCase}):super(WishListInitState());
  List<SingleProductDataEntity> wishes=[];
  addToWishList({required String productId})async
  {
    final response=await wishListUseCase.addToWishList(productId: productId);
   _emitResponse(response);
    // if(response.response!=null)
    // {
    //   emit(WishListAddingSuccessState(wishListAddEntity: response.response));
    // }
    // else
    // {
    //   emit(WishListErrorState(errorMessage: response.error??''));
    // }
  }
  Future<void> getWishList()async
  {
    final response=await wishListUseCase.getWishList();
    //_emitResponse(response);
    if(response.response!=null)
    {
      wishes=response.response?.data??[];
      emit(WishListSuccessState(wishListEntity: response.response?.data??[]));
    }
    else
    {
      emit(WishListErrorState(errorMessage: response.error??''));
    }
  }
  removeFromWishList({required String productId})async
  {
    final response=await wishListUseCase.deleteFromWishList(productId: productId);
    _emitResponse(response);
    // if(response.response!=null)
    // {
    //   emit(WishListAddingSuccessState(wishListAddEntity: response.response));
    // }
    // else
    // {
    //   emit(WishListErrorState(errorMessage: response.error??''));
    // }
  }
  _emitResponse(DataResponse response)
  {
    if(response.response!=null)
    {
      emit(WishListAddingSuccessState(wishListAddEntity: response.response));
    }
    else
    {
      emit(WishListErrorState(errorMessage: response.error??''));
    }
  }
  isFavorite(String productId,List<SingleProductDataEntity> wishesList)
  {
    bool result=false;
    wishesList.forEach((element) {
      if(element.productId==productId)
      {
        result=true;
      }
    },);
    return result;
  }
}