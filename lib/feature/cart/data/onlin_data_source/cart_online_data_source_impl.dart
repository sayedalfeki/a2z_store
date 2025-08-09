import 'package:a_to_z_store/core/api/api_end_points.dart';
import 'package:a_to_z_store/core/api/api_manager.dart';
import 'package:a_to_z_store/feature/cart/data/cart_dto.dart';
import 'package:a_to_z_store/feature/cart/domain/cart_data_source.dart';
import 'package:a_to_z_store/feature/cart/domain/cart_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/data_response/data_response.dart';
@Injectable(as:CartDataSource )
class CartOnlineDataSourceImpl extends CartDataSource
{
  final ApiManager apiManager;
  CartOnlineDataSourceImpl({required this.apiManager});
  @override
  Future<DataResponse<CartDto>> getAllCarts()async
  {
    try
    {
      final response=await apiManager.get(ApiEndPoints.cartPath);
      return _getResponse(response);

    }catch(e,s)
    {
      return DataResponse(error: 'exception is $e \nin $s');
    }
  }
  @override
  Future<DataResponse<CartEntity>> addToCart({required String productId})async
  {
    final response=await apiManager.post(ApiEndPoints.cartPath,
    data: {'productId':productId}
    );
    return _getResponse(response);
  }
  @override
  Future<DataResponse<CartEntity>> removeFromCart({required String productId})async
  {
    final response=await apiManager.delete('${ApiEndPoints.cartPath}/$productId',

    );
    return _getResponse(response);
  }
  DataResponse<CartDto> _getResponse(Response response)
  {
    if(response.statusCode!>=500&&response.statusCode!<400)
    {
      return DataResponse(error: 'server error: ${response.statusMessage}');
    }
    if(response.statusCode!<=400&&response.statusCode!>300)
    {
      return DataResponse(error: 'client error: ${response.statusMessage}');
    }
    final CartDto cartDto=CartDto.fromJson(response.data);
    if(cartDto.statusMsg!=null)
    {
      return DataResponse(error: '${cartDto.message}');
    }
    return DataResponse(response: cartDto);
  }
}