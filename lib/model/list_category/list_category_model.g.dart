// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCategoryModel _$ListCategoryModelFromJson(Map<String, dynamic> json) =>
    ListCategoryModel(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => Meals.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListCategoryModelToJson(ListCategoryModel instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };

Meals _$MealsFromJson(Map<String, dynamic> json) => Meals(
      strCategory: json['strCategory'] as String?,
    );

Map<String, dynamic> _$MealsToJson(Meals instance) => <String, dynamic>{
      'strCategory': instance.strCategory,
    };
