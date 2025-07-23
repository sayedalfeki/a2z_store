import 'package:a_to_z_store/core/api/api_end_points.dart';
import 'package:a_to_z_store/core/api/api_manager.dart';
import 'package:a_to_z_store/core/data_response/data_response.dart';
import 'package:a_to_z_store/feature/product_home/ui/category/data/category_dto.dart';
import 'package:a_to_z_store/feature/product_home/ui/category/domain/category.dart';
import 'package:a_to_z_store/feature/product_home/ui/category/domain/category_data_source.dart';

class OnlineCategoryDataSourceImpl  extends CategoryDataSource{
  final ApiManager apiManager;

  OnlineCategoryDataSourceImpl({required this.apiManager});
  @override
  Future<DataResponse<CategoryDto>> getCategories() async{
   try
   {
     final response=await apiManager.get(ApiEndPoints.categoriesEndPoint);
     if(response.statusCode!>=500&&response.statusCode!<400)
     {
       return DataResponse(error: 'server error: ${response.statusMessage}');
     }
     if(response.statusCode!<=400&&response.statusCode!>300)
     {
       return DataResponse(error: 'client error: ${response.statusMessage}');
     }
     CategoryDto categoryDto=CategoryDto.fromJson(response.data);
     return DataResponse(response: categoryDto);
   }
   catch(e,s)
   {
     return DataResponse(error: 'Exception is $e in $s');
   }
  }
}