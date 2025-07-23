import 'package:a_to_z_store/feature/product_home/ui/category/domain/category.dart';

abstract class CategoryState{}
class CategoryInitState extends CategoryState{}
class CategoryLoadingState extends CategoryState{}
class CategorySuccessState extends CategoryState
{
  final List<DataEntity> categories;

  CategorySuccessState({required this.categories});

}
class CategoryErrorState extends CategoryState
{
  final String errorMessage;

  CategoryErrorState({required this.errorMessage});
}class CategoryChangeIndexState extends CategoryState
{
  CategoryChangeIndexState();
}
