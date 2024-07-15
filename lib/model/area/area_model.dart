 

import 'package:json_annotation/json_annotation.dart';
part 'area_model.g.dart';

@JsonSerializable()
class AreaModel {
  List<Meals>? meals;

  AreaModel({this.meals});

    factory AreaModel.fromJson(Map<String, dynamic> json) =>
      _$AreaModelFromJson(json);
 
  Map<String, dynamic> toJson() => _$AreaModelToJson(this);
}

@JsonSerializable()
class Meals {
  String? strArea;

  Meals({this.strArea});

    factory Meals.fromJson(Map<String, dynamic> json) =>
      _$MealsFromJson(json);
 
  Map<String, dynamic> toJson() => _$MealsToJson(this);
 
}