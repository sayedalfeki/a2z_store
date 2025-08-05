class CategoryProductEntity {
  CategoryProductEntity({
    this.data,});
  List<CategoryProductDataEntity>? data;
}
class CategoryProductDataEntity {
  CategoryProductDataEntity({
    this.imageCover,
    this.productId,this.id
      });
  String? imageCover;
  String? productId;
  String? id;
}


