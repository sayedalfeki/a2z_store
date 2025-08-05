import 'package:a_to_z_store/core/data_response/data_response.dart';
import 'package:a_to_z_store/core/dto/product_dto.dart';
import 'package:a_to_z_store/feature/product/domain/Single_product_entity.dart';
import 'package:a_to_z_store/feature/product/domain/single_product_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class SingleProductUseCase
{
  final SingleProductRepository singleProductRepository;

  SingleProductUseCase({required this.singleProductRepository});
  Future<DataResponse<SingleProductEntity>> getProduct(String productId)async
  {
     return await singleProductRepository.getProduct(productId);
  }
}