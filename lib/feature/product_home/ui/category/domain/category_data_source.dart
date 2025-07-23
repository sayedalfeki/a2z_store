import '../../../../../core/data_response/data_response.dart';
import 'category.dart';

abstract class CategoryDataSource
{
  Future<DataResponse<CategoryEntity>> getCategories ();

}