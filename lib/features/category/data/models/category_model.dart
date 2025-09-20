class CategoryModel {
  final String name;

  CategoryModel(this.name);

  factory CategoryModel.fromJson(dynamic json) {
    return CategoryModel(json.toString());
  }
}
