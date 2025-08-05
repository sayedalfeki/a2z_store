import 'package:a_to_z_store/core/api/api_end_points.dart';
import 'package:a_to_z_store/core/api/api_manager.dart';
import 'package:a_to_z_store/core/data_response/data_response.dart';
import 'package:a_to_z_store/feature/sub_category/data/sub_category_dto.dart';
import 'package:a_to_z_store/feature/sub_category/domain/sub_category_data_source.dart';
import 'package:a_to_z_store/feature/sub_category/domain/sub_category_entity.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:SubCategoryDataSource )
class SubCategoryOnlineDataSource extends SubCategoryDataSource
{
  final ApiManager apiManager;
  SubCategoryOnlineDataSource({required this.apiManager});
  @override
  Future<DataResponse<SubCategoryDto>> getSubCategories(String categoryId)async {
    try
    {
      final response=await apiManager.get('${ApiEndPoints.categoriesEndPoint}'
          '/$categoryId/subcategories');
      if(response.statusCode!>=500&&response.statusCode!<400)
      {
        return DataResponse(error: 'server error: ${response.statusMessage}');
      }
      if(response.statusCode!<=400&&response.statusCode!>300)
      {
        return DataResponse(error: 'client error: ${response.statusMessage}');
      }
      SubCategoryDto subCategoryDto=SubCategoryDto.fromJson(response.data);
      return DataResponse(response: subCategoryDto);
    }catch(e,s)
    {
      return DataResponse(error: 'Exception is $e in $s');
    }
  }

}