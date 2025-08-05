import 'package:a_to_z_store/core/data_response/data_response.dart';

import 'package:a_to_z_store/feature/home/ui/brands/domain/category_product.dart';
import 'package:a_to_z_store/feature/home/ui/brands/domain/category_product_data_source.dart';
import 'package:injectable/injectable.dart';

import '../domain/category_product_repository.dart';
@Injectable(as: CategoryProductRepository)
class CategoryProductRepositoryImp extends CategoryProductRepository
{
  final CategoryProductDataSource categoryProductDataSource;

  CategoryProductRepositoryImp({required this.categoryProductDataSource});
  @override
  Future<DataResponse<CategoryProductEntity>> getCategoryProducts(String categoryId) async{
    return await categoryProductDataSource.getCategoryProducts(categoryId);
  }

}