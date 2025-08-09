import '../../../product/domain/Single_product_entity.dart';
import '../../domain/products_entity.dart';
abstract class ProductsState{}
class ProductsInitState extends ProductsState{}
 class ProductsLoadingState extends ProductsState{}
 class ProductsSuccessState extends ProductsState{
   final List<SingleProductDataEntity> data;
   ProductsSuccessState({required this.data});
 }
class ProductsErrorState extends ProductsState{
  final String errorMessage;
  ProductsErrorState({required this.errorMessage});
}