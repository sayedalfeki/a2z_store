class SubCategoryEntity {
  SubCategoryEntity({
    this.data,});
  List<SubCategoryDataEntity>? data;
}

class SubCategoryDataEntity {
  SubCategoryDataEntity({
      this.id, 
      this.name, 
      this.category,
      });
  String? id;
  String? name;
  String? category;
}

