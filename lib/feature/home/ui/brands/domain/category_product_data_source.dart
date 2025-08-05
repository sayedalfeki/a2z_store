import '../../../../../core/data_response/data_response.dart';
import 'category_product.dart';

abstract class CategoryProductDataSource{
  Future<DataResponse<CategoryProductEntity>> getCategoryProducts(String categoryId);

}