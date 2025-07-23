import '../../../../../core/data_response/data_response.dart';
import 'category.dart';

abstract class CategoryRepository{
  Future<DataResponse<CategoryEntity>> getCategories ();
}