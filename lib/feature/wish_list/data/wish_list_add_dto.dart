import 'package:a_to_z_store/feature/wish_list/domain/wish_list_add_entity.dart';
class WishListAddDto extends WishListAddEntity {
  WishListAddDto({
    super.status,
    super.message,
    super.statusMsg,
    this.data,});
  WishListAddDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg=json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  List<String>? data;
}