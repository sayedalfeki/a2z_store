import 'package:a_to_z_store/feature/product_home/ui/category/domain/category_use_case.dart';
import 'package:a_to_z_store/feature/product_home/ui/category/view_model/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryViewModel extends Cubit<CategoryState>
{
  final CategoryUseCase categoryUseCase;
  CategoryViewModel({required this.categoryUseCase}):super(CategoryInitState());
  int selectedIndex=0;
  changeSelectedIndex(int index)
  {
    selectedIndex=index;
    emit(CategoryChangeIndexState());
  }
  getCategories()async
  {
    emit(CategoryLoadingState());
    final response=await categoryUseCase.invoke();
    if(response.response!=null)
    {
      emit(CategorySuccessState(categories: response.response?.data??[]));
    }
    else
    {
      emit(CategoryErrorState(errorMessage: response.error!));
    }
  }
}