import 'package:a_to_z_store/feature/sub_category/domain/sub_category_use_case.dart';
import 'package:a_to_z_store/feature/sub_category/ui/view_model/sub_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class SubCategoryViewModel extends Cubit<SubCategoryState>
{
  final SubCategoryUseCase subCategoryUseCase;
  SubCategoryViewModel({required this.subCategoryUseCase}):super(SubCategoryInitState());
  getSubCategories(String categoryId)async
  {
    emit(SubCategoryLoadingState());
    final response=await subCategoryUseCase.getSubCategories(categoryId);
    if(response.response!=null)
    {
      emit(SubCategorySuccessState(subCategories: response.response?.data??[]));
    }
    else
    {
      emit(SubCategoryErrorState(errorMessage: response.error??''));
    }
  }
}