
import 'package:a_to_z_store/core/data_response/data_response.dart';

import 'forget_password_entity.dart';
import 'forget_password_repository.dart';

class ForgetPassWordUseCase {
  ForgetPassWordRepository forgetPassWordRepository;

  ForgetPassWordUseCase(this.forgetPassWordRepository);

  Future<DataResponse<ForgetPassWordEntity>> verifyEmail(String email) async {
    return await forgetPassWordRepository.forgetPassword(email);
  }

  Future<DataResponse<ForgetPassWordEntity>> resetCode(String code) async {
    return await forgetPassWordRepository.resetCode(code);
  }

  Future<DataResponse<ForgetPassWordEntity>> changePassword(
    String email,
    String newPassword,
  ) async {
    return await forgetPassWordRepository.changePassword(email, newPassword);
  }
}
