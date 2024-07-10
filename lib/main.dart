import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
 
import 'package:recipes_app/data/repo/repository.dart';
import 'package:recipes_app/data/service/meal_service.dart';
import 'package:recipes_app/page/home/home_page.dart';
 

void main() {
  final dio = Dio();
  final mealService = MealService(dio);
  final mealFilterRepository = MealFilterRepository(mealService);
  final searchRepository = SearchRepository(mealService);

  runApp(
    MaterialApp(
      title: 'Meal Search App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        mealFilterRepository: mealFilterRepository,
        searchRepository: searchRepository,
      ),
    ),
  );
}
