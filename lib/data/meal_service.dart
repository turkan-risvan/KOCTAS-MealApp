// // lib/data/service/meal_service.dart
// import 'package:dio/dio.dart';
// import 'package:recipes_app/data/model/categories_model.dart';
// import 'package:recipes_app/data/model/meal_deails_model.dart';
// import 'package:recipes_app/data/model/meal_random_model.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:recipes_app/data/model/search_model.dart';


// part 'meal_service.g.dart';

// @RestApi(baseUrl: 'https://www.themealdb.com/api/json/v1/1/')
// abstract class MealService {
//   factory MealService(Dio dio, {String baseUrl}) = _MealService;

//   @GET('search.php?f=a')
//   Future<SearchModel> searchMeal(@Query('s') String query);

//   @GET('lookup.php?i=52772')
//   Future<MealDetailsModel> getMealDetails(@Query('i') String id);

//   @GET('random.php')
//   Future<MealRandomModel> getRandomMeal();
 
//   @GET('categories.php')
//   Future<CategoriesModel> getCategories();
// }



