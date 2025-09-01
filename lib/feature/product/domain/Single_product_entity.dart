class SingleProductEntity {
  SingleProductEntity({
      this.data,});
  // SingleProductEntity.fromJson(dynamic json) {
  //   data = json['data'] != null ? SingleProductDataEntity.fromJson(json['data']) : null;
  // }
  SingleProductDataEntity? data;
}
class SingleProductDataEntity {
  SingleProductDataEntity({
      this.sold, 
      this.images, 
     this.productId,
      this.title, 
    this.description,
    this.price,
    this.ratingsAverage,
    this.ratingsQuantity,
    this.imageCover,
    this.slug,
    this.id,});

  // SingleProductDataEntity.fromJson(dynamic json) {
  //   sold = json['sold'];
  //   images = json['images'] != null ? json['images'].cast<String>() : [];
  //   if (json['subcategory'] != null) {
  //     subcategory = [];
  //     json['subcategory'].forEach((v) {
  //       subcategory?.add(SingleProductSubcategoryEntity.fromJson(v));
  //     });
  //   }
  //   ratingsQuantity = json['ratingsQuantity'];
  //   id = json['_id'];
  //   title = json['title'];
  //   slug = json['slug'];
  //   description = json['description'];
  //   quantity = json['quantity'];
  //   price = json['price'];
  //   imageCover = json['imageCover'];
  //   category = json['category'] != null ? SingleProductCategoryEntity.fromJson(json['category']) : null;
  //   brand = json['brand'] != null ? SingleProductBrandEntity.fromJson(json['brand']) : null;
  //   ratingsAverage = json['ratingsAverage'];
  //   createdAt = json['createdAt'];
  //   updatedAt = json['updatedAt'];
  //   v = json['__v'];
  //   if (json['reviews'] != null) {
  //     reviews = [];
  //     json['reviews'].forEach((v) {
  //       reviews?.add(v);
  //     });
  //   }
  //   id = json['id'];
  // }
  num? sold;
  List<String>? images;
  //List<SingleProductSubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? productId;
  String? title;
  String? slug;
  String? description;
  //int? quantity;
  num? price;
 String? imageCover;
  //SingleProductCategoryEntity? category;
 // SingleProductBrandEntity? brand;
  num? ratingsAverage;
  //String? createdAt;
  //String? updatedAt;
  //int? v;
 // List<dynamic>? reviews;
  String? id;



}
// class SingleProductBrandEntity {
//   SingleProductBrandEntity({
//       this.id,
//       this.name,
//       this.slug,
//       this.image,});
//
//   SingleProductBrandEntity.fromJson(dynamic json) {
//     id = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     image = json['image'];
//   }
//   String? id;
//   String? name;
//   String? slug;
//   String? image;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = id;
//     map['name'] = name;
//     map['slug'] = slug;
//     map['image'] = image;
//     return map;
//   }
//
// }
// class SingleProductCategoryEntity {
//   SingleProductCategoryEntity({
//       this.id,
//       this.name,
//       this.slug,
//       this.image,});
//
//   SingleProductCategoryEntity.fromJson(dynamic json) {
//     id = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     image = json['image'];
//   }
//   String? id;
//   String? name;
//   String? slug;
//   String? image;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = id;
//     map['name'] = name;
//     map['slug'] = slug;
//     map['image'] = image;
//     return map;
//   }
//
// }
// class SingleProductSubcategoryEntity {
//   SingleProductSubcategoryEntity({
//       this.id,
//       this.name,
//       this.slug,
//       this.category,});
//
//   SingleProductSubcategoryEntity.fromJson(dynamic json) {
//     id = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     category = json['category'];
//   }
//   String? id;
//   String? name;
//   String? slug;
//   String? category;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = id;
//     map['name'] = name;
//     map['slug'] = slug;
//     map['category'] = category;
//     return map;
//   }
//
// }