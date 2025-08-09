import 'package:a_to_z_store/feature/cart/domain/cart_entity.dart';
import 'package:a_to_z_store/feature/product/data/single_product_dto.dart';

/// status : "success"
/// numOfCartItems : 1
/// cartId : "68923350f6a5d97c6da57f4f"
/// data : {"_id":"68923350f6a5d97c6da57f4f","cartOwner":"63d57c9f6ef333aaa30184f3","products":[{"count":1,"_id":"68923350f6a5d97c6da57f50","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428eb43dc1175abc65ca0b3","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428eb43dc1175abc65ca0b3"},"price":149}],"createdAt":"2025-08-05T16:37:36.259Z","updatedAt":"2025-08-05T16:37:36.462Z","__v":0,"totalCartPrice":149}

class CartDto extends CartEntity {
  CartDto({this.status, this.numOfCartItems, super.cartId, super.data,
  this.statusMsg,this.message
  });

  CartDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? CartDataDto.fromJson(json['data']) : null;
  }
  String? status;
  String? statusMsg;
  String? message;
  num? numOfCartItems;
}

/// _id : "68923350f6a5d97c6da57f4f"
/// cartOwner : "63d57c9f6ef333aaa30184f3"
/// products : [{"count":1,"_id":"68923350f6a5d97c6da57f50","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428eb43dc1175abc65ca0b3","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428eb43dc1175abc65ca0b3"},"price":149}]
/// createdAt : "2025-08-05T16:37:36.259Z"
/// updatedAt : "2025-08-05T16:37:36.462Z"
/// __v : 0
/// totalCartPrice : 149

class CartDataDto extends CartDataEntity {
  CartDataDto({
    super.id,
    this.cartOwner,
    super.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    super.totalCartPrice,
  });

  CartDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  String? cartOwner;

  String? createdAt;
  String? updatedAt;
  num? v;
}

/// count : 1
/// _id : "68923350f6a5d97c6da57f50"
/// product : {"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428eb43dc1175abc65ca0b3","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428eb43dc1175abc65ca0b3"}
/// price : 149

class CartProductsDto extends CartProductsEntity {
  CartProductsDto({this.count, super.id, super.product, super.price});

  CartProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product =
        json['product'] != null
            ? SingleProductDataDto.fromJson(json['product'])
        //CartProductDto.fromJson(json['product'])
            : null;
    price = json['price'];
  }
  num? count;
}

/// subcategory : [{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}]
/// _id : "6428eb43dc1175abc65ca0b3"
/// title : "Woman Shawl"
/// quantity : 220
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg"
/// category : {"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"}
/// brand : {"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"}
/// ratingsAverage : 4.8
/// id : "6428eb43dc1175abc65ca0b3"

// class CartProductDto extends CartProductEntity {
//   CartProductDto({
//     this.subcategory,
//     super.id,
//     super.title,
//     super.quantity,
//     super.imageCover,
//     this.category,
//     this.brand,
//     this.ratingsAverage,
//     this.pid,
//   });
//
//   CartProductDto.fromJson(dynamic json) {
//     if (json['subcategory'] != null) {
//       subcategory = [];
//       json['subcategory'].forEach((v) {
//         subcategory?.add(Subcategory.fromJson(v));
//       });
//     }
//     id = json['_id'];
//     title = json['title'];
//     quantity = json['quantity'];
//     imageCover = json['imageCover'];
//     category =
//         json['category'] != null ? Category.fromJson(json['category']) : null;
//     brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
//     ratingsAverage = json['ratingsAverage'];
//     pid = json['id'];
//   }
//   List<Subcategory>? subcategory;
//
//   Category? category;
//   Brand? brand;
//   num? ratingsAverage;
//   String? pid;
// }
//
// /// _id : "64089bbe24b25627a253158b"
// /// name : "DeFacto"
// /// slug : "defacto"
// /// image : "https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"
//
// class Brand {
//   Brand({this.id, this.name, this.slug, this.image});
//
//   Brand.fromJson(dynamic json) {
//     id = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     image = json['image'];
//   }
//   String? id;
//   String? name;
//   String? slug;
//   String? image;
// }
//
// /// _id : "6439d58a0049ad0b52b9003f"
// /// name : "Women's Fashion"
// /// slug : "women's-fashion"
// /// image : "https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"
//
// class Category {
//   Category({this.id, this.name, this.slug, this.image});
//
//   Category.fromJson(dynamic json) {
//     id = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     image = json['image'];
//   }
//   String? id;
//   String? name;
//   String? slug;
//   String? image;
// }
//
// /// _id : "6407f1bcb575d3b90bf95797"
// /// name : "Women's Clothing"
// /// slug : "women's-clothing"
// /// category : "6439d58a0049ad0b52b9003f"
//
// class Subcategory {
//   Subcategory({this.id, this.name, this.slug, this.category});
//
//   Subcategory.fromJson(dynamic json) {
//     id = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     category = json['category'];
//   }
//   String? id;
//   String? name;
//   String? slug;
//   String? category;
// }
