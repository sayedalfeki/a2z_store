import 'package:a_to_z_store/core/dto/product_dto.dart';
import 'package:a_to_z_store/feature/product/domain/Single_product_entity.dart';

abstract class SingleProductState{}
 class SingleProductInitState extends SingleProductState{}
 class SingleProductLoadingState extends SingleProductState{}
 class SingleProductSuccessState extends SingleProductState{
  final SingleProductEntity? singleProduct;

  SingleProductSuccessState({required this.singleProduct});
 }
class SingleProductErrorState extends SingleProductState{
  final String errorMessage;

  SingleProductErrorState({required this.errorMessage});


}