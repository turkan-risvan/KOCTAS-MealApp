
import 'package:json_annotation/json_annotation.dart';
part 'list_category_model.g.dart';

@JsonSerializable()
class ListCategoryModel {
  List<Meals>? meals;

  ListCategoryModel({this.meals});

  factory ListCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ListCategoryModelFromJson(json);
 
  Map<String, dynamic> toJson() => _$ListCategoryModelToJson(this);
}

@JsonSerializable()
class Meals {
  String? strCategory;

  Meals({this.strCategory});

   factory Meals.fromJson(Map<String, dynamic> json) =>
      _$MealsFromJson(json);
 
  Map<String, dynamic> toJson() => _$MealsToJson(this);

}