import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/data/service/meal_service.dart';
import 'package:recipes_app/data/repo/repository.dart';
import 'package:dio/dio.dart';
import 'package:recipes_app/page/area/area_viewmodel.dart';
import 'package:recipes_app/page/details/meal_details_viewmodel.dart';
import 'package:recipes_app/page/home/home_page.dart';
import 'package:recipes_app/page/meal_filter/meal_filter_viewmodel.dart';
import 'package:recipes_app/page/meal_random/meal_random_viewmodel.dart';
import 'package:recipes_app/page/search/search_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchViewModel(SearchRepository(MealService(Dio())))),
        ChangeNotifierProvider(create: (_) => MealFilterViewModel(MealFilterRepository(MealService(Dio())))),
        ChangeNotifierProvider(create: (_) => RandomMealViewModel(RandomRepository(MealService(Dio())))),
        ChangeNotifierProvider(create: (_) => MealDetailsViewModel(MealDetailsRepository(MealService(Dio())))),
        ChangeNotifierProvider(create: (_) => AreaFilterViewModel(AreaFilterRepository(MealService(Dio())))),
      ],
      child: MaterialApp(
        title: 'Recipes App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(
          mealFilterRepository: MealFilterRepository(MealService(Dio())),
          searchRepository: SearchRepository(MealService(Dio())),
          randomRepository: RandomRepository(MealService(Dio())),
          areaFilterRepository: AreaFilterRepository(MealService(Dio())),
        ),
      ),
    );
  }
}
