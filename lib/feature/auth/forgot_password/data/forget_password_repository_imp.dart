import 'package:injectable/injectable.dart';

import '../../../../core/data_response/data_response.dart';
import '../domain/forget_password_data_source.dart';
import '../domain/forget_password_repository.dart';
import '../domain/forget_password_entity.dart';
@Injectable(as:ForgetPassWordRepository )
class ForgetPassWordRepositoryImpl extends ForgetPassWordRepository {
  ForgetPassWordDataSource forgetPassWordDataSource;

  ForgetPassWordRepositoryImpl(this.forgetPassWordDataSource);

  @override
  Future<DataResponse<ForgetPassWordEntity>> forgetPassword(String email) async {
    return await forgetPassWordDataSource.forgetPassword(email);
  }

  @override
  Future<DataResponse<ForgetPassWordEntity>> resetCode(String code) async {
    return await forgetPassWordDataSource.resetCode(code);
  }

  @override
  Future<DataResponse<ForgetPassWordEntity>> changePassword(
    String email,
    String newPassword,
  ) async {
    return await forgetPassWordDataSource.changePassword(email, newPassword);
  }
}
