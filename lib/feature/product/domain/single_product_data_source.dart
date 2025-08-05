import 'package:a_to_z_store/feature/product/domain/Single_product_entity.dart';

import '../../../core/data_response/data_response.dart';

abstract class SingleProductDataSource
{
  Future<DataResponse<SingleProductEntity>> getProduct(String productId);
}