import 'package:a_to_z_store/core/data_response/data_response.dart';
import 'package:a_to_z_store/feature/home/ui/category/domain/category.dart';
import 'package:a_to_z_store/feature/home/ui/category/domain/category_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class CategoryUseCase
{
  final CategoryRepository categoryRepository;
  CategoryUseCase({required this.categoryRepository});
  Future<DataResponse<CategoryEntity>> invoke()async
  {
       return await categoryRepository.getCategories();
  }
}