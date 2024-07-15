import 'package:json_annotation/json_annotation.dart';
part 'area_filter_model.g.dart';

@JsonSerializable()
class AreaFilterModel {
  List<Meals>? meals;

  AreaFilterModel({this.meals});

    factory AreaFilterModel.fromJson(Map<String, dynamic> json) =>
      _$AreaFilterModelFromJson(json);
 
  Map<String, dynamic> toJson() => _$AreaFilterModelToJson(this);
}

@JsonSerializable()
class Meals {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  Meals({this.strMeal, this.strMealThumb, this.idMeal});

 
    factory Meals.fromJson(Map<String, dynamic> json) =>
      _$MealsFromJson(json);
 
  Map<String, dynamic> toJson() => _$MealsToJson(this);
}