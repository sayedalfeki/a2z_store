import 'package:a_to_z_store/core/data_response/data_response.dart';

import 'package:injectable/injectable.dart';

import 'category.dart';
import 'category_repository.dart';
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