
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_end_points.dart';

import '../../../../../core/api/api_manager.dart';
import '../../../../../core/data_response/data_response.dart';
import '../../domain/register_data_source.dart';
import '../../request_entity/register_request_entity.dart';
import '../register_dto.dart';
@Injectable(as:RegisterDataSource )
class RegisterRemoteDioDataSource extends RegisterDataSource
{
  late ApiManager apiManager;
  RegisterRemoteDioDataSource(this.apiManager);
  @override
  Future<DataResponse<RegisterDto>> register(RegisterRequestEntity registerRequest) async
  {
    try {
      var response = await apiManager.post(
          ApiEndPoints.signUpPath, data: registerRequest.toJson());

      if(response.statusCode!>=500)
      {
        return DataResponse(error:' server error : ${response.statusMessage}');
      }
      else
      {
        print(response.data);
        RegisterDto registerDto=RegisterDto.fromJson(response.data);
        if(response.statusCode!>=200&&response.statusCode!<300)
        {
          return DataResponse(response: registerDto);
        }
        else
        {
          if(registerDto.statusMsg!=null)
          {
            return DataResponse(error: 'client error: ${registerDto.message}');
          }
          return DataResponse(error: 'client error: ${registerDto.errorDto?.msg}');
        }
      }

    }
    catch(e)
    {
      return DataResponse(error: e.toString());
    }
  }

}