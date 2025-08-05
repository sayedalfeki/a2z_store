import 'package:a_to_z_store/feature/sub_category/domain/sub_category_entity.dart';

class SubCategoryDto extends SubCategoryEntity {
  SubCategoryDto({
      this.results, 
      this.metadata, 
      super.data,});

  SubCategoryDto.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(SubCategoryDataDto.fromJson(v));
      });
    }
  }
  int? results;
  Metadata? metadata;
}

class SubCategoryDataDto extends SubCategoryDataEntity {
  SubCategoryDataDto({
      super.id,
      super.name,
      this.slug, 
      super.category,
      this.createdAt, 
      this.updatedAt,});

  SubCategoryDataDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? slug;
  String? createdAt;
  String? updatedAt;
}

class Metadata {
  Metadata({
      this.currentPage, 
      this.numberOfPages, 
      this.limit,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
  int? currentPage;
  int? numberOfPages;
  int? limit;



}