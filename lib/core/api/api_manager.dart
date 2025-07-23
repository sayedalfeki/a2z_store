import 'package:a_to_z_store/core/api/api_end_points.dart';
import 'package:dio/dio.dart';

class ApiManager
{
  late Dio dio;
  ApiManager._()
  {
    dio=Dio(
      BaseOptions(
        validateStatus: (status) => true,
        baseUrl:ApiEndPoints.baseUrl
      )
    );
  }
  static ApiManager? _instance;
  static ApiManager get instance
  {
    return _instance??=ApiManager._();
  }
  Future<Response> get(String path,{Map<String,dynamic>? queryParams })async{
    return await  dio.get(path,queryParameters: queryParams);
  }
}