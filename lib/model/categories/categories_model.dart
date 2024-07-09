import 'package:json_annotation/json_annotation.dart';
part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  List<Categories>? categories;

  CategoriesModel({this.categories});

   factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
 
  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}

@JsonSerializable()
class Categories {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  Categories(
      {this.idCategory,
      this.strCategory,
      this.strCategoryThumb,
      this.strCategoryDescription});

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
 
  Map<String, dynamic> toJson() => _$CategoriesToJson(this);

}