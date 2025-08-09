import 'package:a_to_z_store/core/data_response/data_response.dart';
import 'package:a_to_z_store/feature/cart/domain/cart_use_case.dart';
import 'package:a_to_z_store/feature/cart/ui/view_model/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class CartViewModel extends Cubit<CartState>
{
  final CartUseCase cartUseCase;
  CartViewModel({required this.cartUseCase}):super(CartInitState());
  getAllCarts()async
  {
    emit(CartLoadingState());
    final response=await cartUseCase.getAllCarts();
    _emitResponse(response);
  }
  addToCart({required String productId})async
  {
    emit(CartLoadingState());
    final response=await cartUseCase.addToCart(productId: productId);
    _emitResponse(response);
  }
  removeFromCart({required String productId})async
  {
    emit(CartLoadingState());
    final response=await cartUseCase.removeFromCart(productId: productId);
    _emitResponse(response);
  }
  _emitResponse(DataResponse response)
  {
    if(response.response!=null)
    {
      emit(CartSuccessState(cartProducts: response.response?.data?.products));
    }
    else
    {
      emit(CartErrorState(errorMessage: response.error??''));
    }
  }
}