import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_end_points.dart';
import '../../../../../core/api/api_manager.dart';
import '../../../../../core/data_response/data_response.dart';
import '../../domain/login_data_source.dart';
import '../../domain/login_request_entity.dart';
import '../login_dto.dart';
@Injectable(as:LoginDataSource )
class LoginRemoteDataSourceDioImp extends LoginDataSource
{
  late ApiManager apiManager;

  LoginRemoteDataSourceDioImp(this.apiManager);

  @override
  Future<DataResponse<LoginDto>> login(LoginRequest request) async
  {
    try {
      var response = await apiManager.post(
          ApiEndPoints.signInPath, data:request.toJson());

      if(response.statusCode!>=500)
      {
        return DataResponse(error:' server error : ${response.statusMessage}');
      }
      else
      {
        print(response.data);
        LoginDto loginDto=LoginDto.fromJson(response.data);
        if(response.statusCode!>=200&&response.statusCode!<300)
        {
          return DataResponse(response:loginDto);
        }
        else
        {
          if(loginDto.statusMsg!=null)
          {
            return DataResponse(error: 'client error: ${loginDto.message}');
          }
          return DataResponse(error: 'client error: ${loginDto.errors?.msg}');
        }
      }

    }
    catch(e)
    {
      return DataResponse(error: e.toString());
    }
  }

}