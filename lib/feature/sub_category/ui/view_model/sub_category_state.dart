import 'package:a_to_z_store/feature/sub_category/domain/sub_category_entity.dart';

abstract class SubCategoryState{}
class SubCategoryInitState extends SubCategoryState{}
class SubCategoryLoadingState extends SubCategoryState{}
class SubCategorySuccessState extends SubCategoryState{
  final List<SubCategoryDataEntity> subCategories;

  SubCategorySuccessState({required this.subCategories});
}
class SubCategoryErrorState extends SubCategoryState{
  final String errorMessage;

  SubCategoryErrorState({required this.errorMessage});
}