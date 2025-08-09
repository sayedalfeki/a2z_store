
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/products_use_case.dart';
import 'products_state.dart';
@injectable
class ProductsViewModel extends Cubit<ProductsState>
{
  final ProductsUseCase categoryProductUseCase;
  ProductsViewModel({required this.categoryProductUseCase}):super(ProductsInitState());
  getProducts(String categoryId)async
  {
    emit(ProductsLoadingState());
    final response=await categoryProductUseCase.invoke(categoryId);
    if(response.response!=null)
    {
      emit(ProductsSuccessState(data: response.response?.data??[]));
    }
    else
    {
      emit(ProductsErrorState(errorMessage: response.error??''));
    }
  }
}