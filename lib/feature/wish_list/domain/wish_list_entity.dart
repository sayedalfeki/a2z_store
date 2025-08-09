import 'package:a_to_z_store/feature/product/domain/Single_product_entity.dart';

class WishListEntity {
  WishListEntity({
      this.status, 
      this.data,
      this.statusMsg,
    this.message
  });
  String? status;
  String? statusMsg;
  String? message;
 // List<WishListDataEntity>? data;
  List<SingleProductDataEntity>? data;
}

// class WishListDataEntity {
//   WishListDataEntity({
//     this.title,
//     this.price,
//     this.imageCover,
//     this.productId,
//   this.slug
//   });
//   String? productId;
//   String? title;
//   int? price;
//   String? imageCover;
//   String? slug;
// }

