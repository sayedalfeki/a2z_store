import 'package:a_to_z_store/core/api/api_manager.dart';
import 'package:a_to_z_store/core/data_response/data_response.dart';
import 'package:a_to_z_store/feature/wish_list/domain/wish_list_data_source.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_end_points.dart';
import '../wish_list_add_dto.dart';
import '../wish_list_dto.dart';
@Injectable(as: WishListDataSource)
class WishListOnlineDataSource extends WishListDataSource
{
  final ApiManager apiManager;
  WishListOnlineDataSource({required this.apiManager});
  @override
  Future<DataResponse<WishListAddDto>> addToWishList({
    required String productId}) async{
   try
   {
     final response=await apiManager.post(
       ApiEndPoints.wishListPath,data: {
         'productId':productId
     },
       // header: {
       //   'token':token
       // }
     );
     return _getResponse(response);
     // if(response.statusCode!>=500&&response.statusCode!<400)
     // {
     //   return DataResponse(error: 'server error: ${response.statusMessage}');
     // }
     // if(response.statusCode!<=400&&response.statusCode!>300)
     // {
     //   return DataResponse(error: 'client error: ${response.statusMessage}');
     // }
     // WishListAddDto wishListAddDto=WishListAddDto.fromJson(response.data);
     // if(wishListAddDto.statusMsg!=null)
     // {
     //   return DataResponse(error: 'client error: ${wishListAddDto.message}');
     //
     // }
     // return DataResponse(response: wishListAddDto);
   }catch(e,s)
   {
     return DataResponse(error: 'Exception: $e in $s');
   }
  }
  @override
  Future<DataResponse<WishListDto>> getWishList() async{
    try
    {
      final response=await apiManager.get(
          ApiEndPoints.wishListPath,
          // header: {
          //   'token':token
          // }
      );
      if(response.statusCode!>=500&&response.statusCode!<400)
      {
        return DataResponse(error: 'server error: ${response.statusMessage}');
      }
      if(response.statusCode!<=400&&response.statusCode!>300)
      {
        return DataResponse(error: 'client error: ${response.statusMessage}');
      }
      WishListDto wishListDto=WishListDto.fromJson(response.data);
      if(wishListDto.statusMsg!=null)
      {
        return DataResponse(error: 'client error: ${wishListDto.message}');

      }
      return DataResponse(response: wishListDto);
    }catch(e,s)
    {
      return DataResponse(error: 'Exception: $e in $s');
    }
  }
  @override
  Future<DataResponse<WishListAddDto>> deleteFromWishList({
    required String productId}) async{
    try
    {
      final response=await apiManager.delete(
          '${ApiEndPoints.wishListPath}/$productId',
          // header: {
          //   'token':token
          // }
      );
      return _getResponse(response);
    }catch(e,s)
    {
      return DataResponse(error: 'Exception: $e in $s');
    }
  }
  DataResponse<WishListAddDto> _getResponse(Response response)
  {
    if(response.statusCode!>=500&&response.statusCode!<400)
    {
      return DataResponse(error: 'server error: ${response.statusMessage}');
    }
    if(response.statusCode!<=400&&response.statusCode!>300)
    {
      return DataResponse(error: 'client error: ${response.statusMessage}');
    }
    WishListAddDto wishListAddDto=WishListAddDto.fromJson(response.data);
    if(wishListAddDto.statusMsg!=null)
    {
      return DataResponse(error: 'client error: ${wishListAddDto.message}');

    }
    return DataResponse(response: wishListAddDto);
  }
}