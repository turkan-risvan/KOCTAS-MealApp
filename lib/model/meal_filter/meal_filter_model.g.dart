// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealFilterModel _$MealFilterModelFromJson(Map<String, dynamic> json) =>
    MealFilterModel(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => Meals.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealFilterModelToJson(MealFilterModel instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };

Meals _$MealsFromJson(Map<String, dynamic> json) => Meals(
      strMeal: json['strMeal'] as String?,
      strMealThumb: json['strMealThumb'] as String?,
      idMeal: json['idMeal'] as String?,
    );

Map<String, dynamic> _$MealsToJson(Meals instance) => <String, dynamic>{
      'strMeal': instance.strMeal,
      'strMealThumb': instance.strMealThumb,
      'idMeal': instance.idMeal,
    };
