import 'package:a_to_z_store/core/api/api_end_points.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@singleton
class ApiManager
{

  Dio dio=Dio(
      BaseOptions(
          validateStatus: (status) => true,
          baseUrl:ApiEndPoints.baseUrl,
      )
  );
  // ApiManager._()
  // {
  //   dio=
  // }
  // static ApiManager? _instance;
  // static ApiManager get instance
  // {
  //   return _instance??=ApiManager._();
  // }
  Future<Response> get(String path,{Map<String,dynamic>? queryParams,
    Map<String,dynamic>? header })async{
    return await  dio.get(path,queryParameters: queryParams,options: Options(
      headers: header
    ));
  }
  Future<Response> post(String path,{Object? data,Map<String,dynamic>? header})async
  {
    return await dio.post(path,data: data,options: Options(
      headers: header
    ));
  }
  Future<Response> put(String path,{Object? data})async
  {
    return await dio.put(path,data: data);
  }
  Future<Response> delete(String path,{Object? data,Map<String,dynamic>? header})async
  {
    return await dio.delete(path,data: data,
    options: Options(
      headers: header
    )
    );
  }
}