import 'package:json_annotation/json_annotation.dart';
part 'meal_filter_model.g.dart';

@JsonSerializable()
class MealFilterModel {
  List<Meals>? meals;

  MealFilterModel({this.meals});

 factory MealFilterModel.fromJson(Map<String, dynamic> json) =>
      _$MealFilterModelFromJson(json);
 
  Map<String, dynamic> toJson() => _$MealFilterModelToJson(this);
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