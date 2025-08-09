import '../../../../../core/data_response/data_response.dart';
import 'products_entity.dart';

abstract class ProductsRepository
{
  Future<DataResponse<ProductsEntity>> getProducts(String categoryId);
}