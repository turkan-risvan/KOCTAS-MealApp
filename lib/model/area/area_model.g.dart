// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaModel _$AreaModelFromJson(Map<String, dynamic> json) => AreaModel(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => Meals.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AreaModelToJson(AreaModel instance) => <String, dynamic>{
      'meals': instance.meals,
    };

Meals _$MealsFromJson(Map<String, dynamic> json) => Meals(
      strArea: json['strArea'] as String?,
    );

Map<String, dynamic> _$MealsToJson(Meals instance) => <String, dynamic>{
      'strArea': instance.strArea,
    };
