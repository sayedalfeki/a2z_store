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
  List<WishListDataEntity>? data;
}

class WishListDataEntity {
  WishListDataEntity({
    this.title,
    this.price,
    this.imageCover,
    this.productId,
  this.slug
  });
  String? productId;
  String? title;
  int? price;
  String? imageCover;
  String? slug;
}

