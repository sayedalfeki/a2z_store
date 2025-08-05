
import 'package:a_to_z_store/feature/auth/register/domain/register_entity.dart';
import 'package:a_to_z_store/feature/auth/register/domain/register_repository.dart';

import '../../../../core/data_response/data_response.dart';
import '../request_entity/register_request_entity.dart';

class RegisterUseCase
{
  final RegisterRepository registerRepository;
  RegisterUseCase({required this.registerRepository});
  Future<DataResponse<RegisterEntity>> invoke(RegisterRequestEntity registerRequest)async{
     return registerRepository.register(registerRequest);
  }
}