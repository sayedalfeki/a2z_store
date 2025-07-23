import 'package:a_to_z_store/core/data_response/data_response.dart';

import 'package:a_to_z_store/feature/product_home/ui/brands/domain/category_product.dart';
import 'package:a_to_z_store/feature/product_home/ui/brands/domain/category_product_data_source.dart';

import '../domain/category_product_repository.dart';

class CategoryProductRepositoryImp extends CategoryProductRepository
{
  final CategoryProductDataSource categoryProductDataSource;

  CategoryProductRepositoryImp({required this.categoryProductDataSource});
  @override
  Future<DataResponse<CategoryProductEntity>> getCategoryProducts(String categoryId) async{
    return await categoryProductDataSource.getCategoryProducts(categoryId);
  }

}