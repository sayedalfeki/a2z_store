import 'package:a_to_z_store/feature/home/ui/brands/domain/category_product_use_case.dart';
import 'package:a_to_z_store/feature/home/ui/brands/view_model/category_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class CategoryProductViewModel extends Cubit<CategoryProductState>
{
  final CategoryProductUseCase categoryProductUseCase;
  CategoryProductViewModel({required this.categoryProductUseCase}):super(CategoryProductInitState());
  getCategoryProducts(String categoryId)async
  {
    emit(CategoryProductLoadingState());
    final response=await categoryProductUseCase.invoke(categoryId);
    if(response.response!=null)
    {
      emit(CategoryProductSuccessState(data: response.response?.data??[]));
    }
    else
    {
      emit(CategoryProductErrorState(errorMessage: response.error??''));
    }
  }
}