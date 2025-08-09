import 'package:injectable/injectable.dart';

import '../../../../core/data_response/data_response.dart';
import '../domain/login_data_source.dart';
import '../domain/login_entity.dart';
import '../domain/login_repository.dart';
import '../domain/login_request_entity.dart';
@Injectable(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository
{
  late LoginDataSource loginDataSource;
  LoginRepositoryImpl(this.loginDataSource);
  @override
  Future<DataResponse<LoginEntity>> login(LoginRequest request)async {
    return await loginDataSource.login(request);
  }

}