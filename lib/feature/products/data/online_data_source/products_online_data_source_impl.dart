import 'package:a_to_z_store/core/api/api_end_points.dart';
import 'package:a_to_z_store/core/api/api_manager.dart';
import 'package:a_to_z_store/core/data_response/data_response.dart';
import 'package:a_to_z_store/core/dto/product_dto.dart';
import 'package:injectable/injectable.dart';
import '../../domain/products_data_source.dart';
@Injectable(as: ProductsDataSource)
class ProductsOnlineDataSourceImpl extends ProductsDataSource
{
  final ApiManager apiManager;
  ProductsOnlineDataSourceImpl({required this.apiManager});
  @override
  Future<DataResponse<ProductDto>> getProducts(String categoryId)async {
    try
    {
      final response=await apiManager.get(ApiEndPoints.productsEndPoint,
          queryParams:categoryId.isEmpty?null: {
           'category[in]':categoryId
      });
      if(response.statusCode!>=500&&response.statusCode!<400)
      {
        return DataResponse(error: 'server error: ${response.statusMessage}');
      }
      if(response.statusCode!<=400&&response.statusCode!>300)
      {
        return DataResponse(error: 'client error: ${response.statusMessage}');
      }
      ProductDto productDto=ProductDto.fromJson(response.data);
      return DataResponse(response: productDto);
    }
    catch(e,s)
    {
      return DataResponse(error: 'Exception is $e in $s');

    }
  }

}