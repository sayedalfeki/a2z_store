import '../../../../core/data_response/data_response.dart';
import 'login_entity.dart';
import 'login_request_entity.dart';

abstract class LoginDataSource
{
  Future<DataResponse<LoginEntity>> login(LoginRequest request);
}