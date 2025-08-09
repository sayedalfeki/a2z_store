import 'package:injectable/injectable.dart';

import '../../../../core/data_response/data_response.dart';
import 'login_entity.dart';
import 'login_repository.dart';
import 'login_request_entity.dart';
@injectable
class LoginUseCase
{
  late LoginRepository loginRepository;
  LoginUseCase(this.loginRepository);
  Future<DataResponse<LoginEntity>> invoke(LoginRequest request)async
  {
   return await loginRepository.login(request);
  }
}