import '../domain/category_product.dart';

abstract class CategoryProductState{}
class CategoryProductInitState extends CategoryProductState{}
 class CategoryProductLoadingState extends CategoryProductState{}
 class CategoryProductSuccessState extends CategoryProductState{
   final List<CategoryProductDataEntity> data;

  CategoryProductSuccessState({required this.data});
 }
class CategoryProductErrorState extends CategoryProductState{
  final String errorMessage;

  CategoryProductErrorState({required this.errorMessage});
}