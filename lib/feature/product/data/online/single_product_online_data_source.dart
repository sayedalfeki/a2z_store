import 'package:a_to_z_store/core/api/api_end_points.dart';
import 'package:a_to_z_store/core/api/api_manager.dart';
import 'package:a_to_z_store/feature/product/domain/Single_product_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data_response/data_response.dart';
import '../../../../core/dto/product_dto.dart';
import '../../domain/single_product_data_source.dart';
@Injectable(as:SingleProductDataSource )
class SingleProductOnLineDataSource extends SingleProductDataSource
{
  final ApiManager apiManager;
  SingleProductOnLineDataSource({required this.apiManager});
  Future<DataResponse<SingleProductEntity>> getProduct(String productId)async
  {
    try
    {
      final response=await apiManager.get('${ApiEndPoints.productsEndPoint}/$productId');
      if(response.statusCode!>=500&&response.statusCode!<400)
      {
        return DataResponse(error: 'server error: ${response.statusMessage}');
      }
      if(response.statusCode!<=400&&response.statusCode!>300)
      {
        return DataResponse(error: 'client error: ${response.statusMessage}');
      }
      print(response.data);
      SingleProductEntity productDataDto=SingleProductEntity.fromJson(response.data);
      return DataResponse(response: productDataDto);
    }catch(e,s)
    {
      return DataResponse(error: 'exception is $e in $s');
    }
  }
}