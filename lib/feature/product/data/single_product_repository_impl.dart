import 'package:a_to_z_store/feature/product/domain/Single_product_entity.dart';
import 'package:a_to_z_store/feature/product/domain/single_product_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../core/data_response/data_response.dart';
import '../../../core/dto/product_dto.dart';
import '../domain/single_product_repository.dart';
@Injectable(as:SingleProductRepository )
 class SingleProductRepositoryImpl extends SingleProductRepository
{
  final SingleProductDataSource singleProductDataSource;

  SingleProductRepositoryImpl({required this.singleProductDataSource});
  @override
  Future<DataResponse<SingleProductEntity>> getProduct(String productId)async
  {
    return await singleProductDataSource.getProduct(productId);
  }
}