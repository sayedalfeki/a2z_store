import 'package:a_to_z_store/core/data_response/data_response.dart';
import 'package:a_to_z_store/feature/sub_category/domain/sub_category_data_source.dart';
import 'package:a_to_z_store/feature/sub_category/domain/sub_category_entity.dart';
import 'package:a_to_z_store/feature/sub_category/domain/sub_category_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SubCategoryRepository)
class SubCategoryRepositoryImpl extends SubCategoryRepository
{
  final SubCategoryDataSource subCategoryDataSource;

  SubCategoryRepositoryImpl({required this.subCategoryDataSource});
  @override
  Future<DataResponse<SubCategoryEntity>> getSubCategories(String categoryId)async {
    return await subCategoryDataSource.getSubCategories(categoryId);
  }

}