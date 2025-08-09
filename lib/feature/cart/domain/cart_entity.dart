import 'package:a_to_z_store/feature/product/domain/Single_product_entity.dart';

class CartEntity {
  CartEntity({this.cartId, this.data});
  String? cartId;
  CartDataEntity? data;

}

class CartDataEntity {
  CartDataEntity({this.id, this.products, this.totalCartPrice});
  String? id;
  List<CartProductsEntity>? products;
  num? totalCartPrice;
}
class CartProductsEntity {
  CartProductsEntity({this.id, this.product, this.price});
  String? id;
  //CartProductEntity? product;
  SingleProductDataEntity? product;
  num? price;
}
// class CartProductEntity {
//   CartProductEntity({this.id, this.title, this.quantity, this.imageCover});
//   String? id;
//   String? title;
//   num? quantity;
//   String? imageCover;
// }
