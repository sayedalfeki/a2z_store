import 'package:a_to_z_store/core/data_response/data_response.dart';
import 'package:a_to_z_store/feature/product_home/ui/category/domain/category.dart';
import 'package:a_to_z_store/feature/product_home/ui/category/domain/category_data_source.dart';
import 'package:a_to_z_store/feature/product_home/ui/category/domain/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository
{
  final CategoryDataSource categoryDataSource;

  CategoryRepositoryImpl({required this.categoryDataSource});
  @override
  Future<DataResponse<CategoryEntity>> getCategories() async{
    return await categoryDataSource.getCategories();
  }

}