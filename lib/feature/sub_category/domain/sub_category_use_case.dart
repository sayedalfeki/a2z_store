import 'package:a_to_z_store/feature/sub_category/domain/sub_category_entity.dart';
import 'package:a_to_z_store/feature/sub_category/domain/sub_category_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../core/data_response/data_response.dart';
@injectable
class SubCategoryUseCase
{
  final SubCategoryRepository subCategoryRepository;

  SubCategoryUseCase({required this.subCategoryRepository});
  Future<DataResponse<SubCategoryEntity>> getSubCategories(String categoryId)async
  {
    return await subCategoryRepository.getSubCategories(categoryId);
  }

}