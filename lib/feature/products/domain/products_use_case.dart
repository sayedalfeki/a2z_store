
import 'package:injectable/injectable.dart';
import '../../../../../core/data_response/data_response.dart';
import 'products_entity.dart';
import 'products_repository.dart';
@injectable
class ProductsUseCase
{
  final ProductsRepository productsRepository;
  ProductsUseCase({required this.productsRepository});
  Future<DataResponse<ProductsEntity>> invoke(String categoryId)async
  {
    return await productsRepository.getProducts(categoryId);
  }
}