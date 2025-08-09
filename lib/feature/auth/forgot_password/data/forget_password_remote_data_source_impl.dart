import 'package:injectable/injectable.dart';

import '../../../../core/api/api_end_points.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/data_response/data_response.dart';
import '../domain/forget_password_data_source.dart';
import '../domain/forget_password_entity.dart';
@Injectable(as: ForgetPassWordDataSource)
class ForgetPassWordRemoteDataSourceImp extends ForgetPassWordDataSource {
  ApiManager apiManager;

  ForgetPassWordRemoteDataSourceImp(this.apiManager);

  @override
  Future<DataResponse<ForgetPassWordEntity>> forgetPassword(String email) async {
    try {
      final response = await apiManager.post(
        ApiEndPoints.forgetPasswordPath,
        data: {'email': email},
      );
      if (response.statusCode! >= 500) {
        return DataResponse(error: 'server error:${response.statusMessage}');
      } else {
        ForgetPassWordEntity forgetPassWordEntity =
            ForgetPassWordEntity.fromJson(response.data);
        if (forgetPassWordEntity.statusMessage == 'fail') {
          return DataResponse(error: forgetPassWordEntity.message);
        }
        return DataResponse(response: forgetPassWordEntity);
      }
    } catch (e) {
      return DataResponse(error: 'exception :${e.toString()}');
    }
  }

  @override
  Future<DataResponse<ForgetPassWordEntity>> resetCode(String code) async {
    try {
      final response = await apiManager.post(
        ApiEndPoints.resetCodePath,
        data: {'resetCode': code},
      );
      if (response.statusCode! >= 500) {
        return DataResponse(error: 'server error:${response.statusMessage}');
      } else {
        ForgetPassWordEntity forgetPassWordEntity =
            ForgetPassWordEntity.fromJson(response.data);
        if (forgetPassWordEntity.statusMessage == 'fail') {
          return DataResponse(error: forgetPassWordEntity.message);
        }
        return DataResponse(response: forgetPassWordEntity);
      }
    } catch (e) {
      return DataResponse(error: 'exception :${e.toString()}');
    }
  }

  @override
  Future<DataResponse<ForgetPassWordEntity>> changePassword(
    String email,
    String newPassword,
  ) async{
    try {
      final response = await apiManager.put(
        ApiEndPoints.changePasswordPath,
        data: {'email':email,'newPassword':newPassword},
      );
      if (response.statusCode! >= 500) {
        return DataResponse(error: 'server error:${response.statusMessage}');
      } else {
        ForgetPassWordEntity forgetPassWordEntity =
        ForgetPassWordEntity.fromJson(response.data);
        if (forgetPassWordEntity.statusMessage == 'fail') {
          return DataResponse(error: forgetPassWordEntity.message);
        }
        return DataResponse(response: forgetPassWordEntity);
      }
    } catch (e) {
      return DataResponse(error: 'exception :${e.toString()}');
    }
  }
}
