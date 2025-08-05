import 'package:a_to_z_store/feature/sub_category/domain/sub_category_entity.dart';

import '../../../core/data_response/data_response.dart';

abstract class SubCategoryDataSource{
  Future<DataResponse<SubCategoryEntity>> getSubCategories(String categoryId);
}