class ProductModel {
  int? id;
  String? nameAr;
  String? nameEn;
  String? adminComment;
  dynamic attributes;
  CategoryModel? category;
  @override
  String toString() {
    return 'ProductModel{id: $id, nameAr: $nameAr, nameEn: $nameEn, adminComment: $adminComment, attributes: $attributes, category: $category}';
  }

  ProductModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.adminComment,
    this.attributes,
    this.category,
  });
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    adminComment = json['admin_comment'];
    attributes = json['attributes'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
  }
}

class CategoryModel {
  String? nameAr;
  int? id;
  @override
  String toString() {
    return 'CategoryModel{nameAr: $nameAr, id: $id}';
  }

  CategoryModel({
    this.nameAr,
    this.id,
  });
  CategoryModel.fromJson(Map<String, dynamic> json) {
    nameAr = json['name_ar'];
    id =json['id'];
  }
}
