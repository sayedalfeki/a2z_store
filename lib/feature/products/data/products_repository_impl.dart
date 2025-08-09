import 'package:injectable/injectable.dart';
import '../../../core/data_response/data_response.dart';
import '../domain/products_data_source.dart';
import '../domain/products_entity.dart';
import '../domain/products_data_source.dart';
import '../domain/products_repository.dart';
@Injectable(as: ProductsRepository)
class ProductsRepositoryImp extends ProductsRepository
{
  final ProductsDataSource productsDataSource;

  ProductsRepositoryImp({required this.productsDataSource});
  @override
  Future<DataResponse<ProductsEntity>> getProducts(String categoryId) async{
    return await productsDataSource.getProducts(categoryId);
  }

}