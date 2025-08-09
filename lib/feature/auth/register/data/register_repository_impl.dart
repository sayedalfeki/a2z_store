
import 'package:injectable/injectable.dart';

import '../../../../core/data_response/data_response.dart';
import '../domain/register_data_source.dart';
import '../domain/register_entity.dart';
import '../domain/register_repository.dart';
import '../request_entity/register_request_entity.dart';
@Injectable(as:RegisterRepository )
class RegisterRepositoryImpl extends RegisterRepository
{
   late RegisterDataSource registerDataSource;

  RegisterRepositoryImpl({required this.registerDataSource});

  @override
  Future<DataResponse<RegisterEntity>> register(RegisterRequestEntity registerRequest)async {
    return await registerDataSource.register(registerRequest);
  }
  
}