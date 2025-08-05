import 'package:a_to_z_store/feature/product/domain/single_product_use_case.dart';
import 'package:a_to_z_store/feature/product/ui/view_model/single_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class SingleProductViewModel extends Cubit<SingleProductState>
{
  final SingleProductUseCase singleProductUseCase;
  SingleProductViewModel({required this.singleProductUseCase}):super(SingleProductInitState());
  getProduct(String productId)async
  {
    emit(SingleProductLoadingState());
final response=await singleProductUseCase.getProduct(productId);
if(response.response!=null)
{
  emit(SingleProductSuccessState(productDataDto: response.response));
}
else
{
  emit(SingleProductErrorState(errorMessage: response.error??''));
}
  }
}