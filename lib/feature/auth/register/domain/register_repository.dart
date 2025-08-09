
import 'package:a_to_z_store/feature/auth/register/domain/register_entity.dart';

import '../../../../core/data_response/data_response.dart';
import '../request_entity/register_request_entity.dart';

abstract class RegisterRepository
{
  Future<DataResponse<RegisterEntity>> register(RegisterRequestEntity registerRequest);
}