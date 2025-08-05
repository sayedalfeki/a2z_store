import 'package:a_to_z_store/core/data_response/data_response.dart';
import 'package:a_to_z_store/feature/sub_category/domain/sub_category_entity.dart';

abstract class SubCategoryRepository
{
  Future<DataResponse<SubCategoryEntity>> getSubCategories(String categoryId);
}