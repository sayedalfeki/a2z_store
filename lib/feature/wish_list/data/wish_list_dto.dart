import 'package:a_to_z_store/feature/wish_list/domain/wish_list_entity.dart';

class WishListDto extends WishListEntity{
  WishListDto({
    super.status,
    this.count,
    super.data,
    super.statusMsg,
    super.message
  });

  WishListDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message= json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(WishListDataDto.fromJson(v));
      });
    }
  }
  int? count;
}

class WishListDataDto extends WishListDataEntity{
  WishListDataDto({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    super.title,
    super.slug,
    this.description,
    this.quantity,
    super.price,
    super.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.v,
    super.productId,});

  WishListDataDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(WishListSubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    productId= json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? WishListCategoryDto.fromJson(json['category']) : null;
    brand = json['brand'] != null ? WishListBrandDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
  int? sold;
  List<String>? images;
  List<WishListSubcategoryDto>? subcategory;
  int? ratingsQuantity;


  String? description;
  int? quantity;

  WishListCategoryDto? category;
  WishListBrandDto? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? id;



}

class WishListBrandDto {
  WishListBrandDto({
    this.id,
    this.name,
    this.slug,
    this.image,});

  WishListBrandDto.fromJson(dynamic json) {
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

class WishListCategoryDto {
  WishListCategoryDto({
    this.id,
    this.name,
    this.slug,
    this.image,});

  WishListCategoryDto.fromJson(dynamic json) {
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

class WishListSubcategoryDto {
  WishListSubcategoryDto({
    this.id,
    this.name,
    this.slug,
    this.category,});

  WishListSubcategoryDto.fromJson(dynamic json) {
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