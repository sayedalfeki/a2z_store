import '../../../../../core/data_response/data_response.dart';
import 'category_product.dart';

abstract class CategoryProductRepository
{
  Future<DataResponse<CategoryProductEntity>> getCategoryProducts(String categoryId);
}