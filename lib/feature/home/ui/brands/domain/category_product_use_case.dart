import 'package:injectable/injectable.dart';

import '../../../../../core/data_response/data_response.dart';
import 'category_product.dart';
import 'category_product_repository.dart';
@injectable
class CategoryProductUseCase
{
  final CategoryProductRepository categoryProductRepository;
  CategoryProductUseCase({required this.categoryProductRepository});
  Future<DataResponse<CategoryProductEntity>> invoke(String categoryId)async
  {
    return await categoryProductRepository.getCategoryProducts(categoryId);
  }
}