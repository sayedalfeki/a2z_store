
import '../../../../core/data_response/data_response.dart';
import 'forget_password_entity.dart';

abstract class ForgetPassWordDataSource
{
  Future<DataResponse<ForgetPassWordEntity>> forgetPassword(String email);
  Future<DataResponse<ForgetPassWordEntity>> resetCode(String code);
  Future<DataResponse<ForgetPassWordEntity>> changePassword(
      String email,
      String newPassword,
      ) ;
}