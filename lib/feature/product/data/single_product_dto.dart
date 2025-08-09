import 'package:a_to_z_store/feature/product/domain/Single_product_entity.dart';

class SingleProductDto extends SingleProductEntity {
  SingleProductDto({
    super.data,});
  SingleProductDto.fromJson(dynamic json) {
    data = json['data'] != null ? SingleProductDataDto.fromJson(json['data']) : null;
  }
  //SingleProductDataDto? data;
}
class SingleProductDataDto extends SingleProductDataEntity {
  SingleProductDataDto({
    super.sold,
    super.images,
    this.subcategory,
    super.ratingsQuantity,
    super.productId,
    super.title,
    super.slug,
    super.description,
    this.quantity,
    super.price,
    super.imageCover,
    this.category,
    this.brand,
    super.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.reviews,
    super.id,});

  SingleProductDataDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SingleProductSubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    productId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? SingleProductCategoryDto.fromJson(json['category']) : null;
    brand = json['brand'] != null ? SingleProductBrandDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(v);
      });
    }
    id = json['id'];
  }
  List<SingleProductSubcategoryDto>? subcategory;
  int? quantity;
  SingleProductCategoryDto? category;
  SingleProductBrandDto? brand;
  String? createdAt;
  String? updatedAt;
  int? v;
  List<dynamic>? reviews;
}
class SingleProductBrandDto {
  SingleProductBrandDto({
    this.id,
    this.name,
    this.slug,
    this.image,});

  SingleProductBrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

}
class SingleProductCategoryDto {
  SingleProductCategoryDto({
    this.id,
    this.name,
    this.slug,
    this.image,});

  SingleProductCategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

}
class SingleProductSubcategoryDto {
  SingleProductSubcategoryDto({
    this.id,
    this.name,
    this.slug,
    this.category,});

  SingleProductSubcategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
  String? id;
  String? name;
  String? slug;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }

}