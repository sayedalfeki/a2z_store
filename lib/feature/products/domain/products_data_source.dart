import '../../../../../core/data_response/data_response.dart';
import 'products_entity.dart';

abstract class ProductsDataSource{
  Future<DataResponse<ProductsEntity>> getProducts(String categoryId);

}