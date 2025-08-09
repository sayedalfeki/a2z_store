import 'package:a_to_z_store/core/data_response/data_response.dart';

import 'package:injectable/injectable.dart';

import '../domain/category.dart';
import '../domain/category_data_source.dart';
import '../domain/category_repository.dart';
@Injectable(as:CategoryRepository)
class CategoryRepositoryImpl extends CategoryRepository
{
  final CategoryDataSource categoryDataSource;

  CategoryRepositoryImpl({required this.categoryDataSource});
  @override
  Future<DataResponse<CategoryEntity>> getCategories() async{
    return await categoryDataSource.getCategories();
  }

}