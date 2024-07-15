import 'package:dio/dio.dart';
import 'package:recipes_app/model/area/area_model.dart';
import 'package:recipes_app/model/area_filter/area_filter_model.dart';
import 'package:recipes_app/model/list_category/list_category_model.dart';
import 'package:recipes_app/model/meal_details/meal_deails_model.dart';
import 'package:recipes_app/model/meal_filter/meal_filter_model.dart';
import 'package:recipes_app/model/meal_random/meal_random_model.dart';
import 'package:recipes_app/model/search/search_model.dart';

import 'package:retrofit/retrofit.dart';
 

part 'meal_service.g.dart';

@RestApi(baseUrl: 'https://www.themealdb.com/api/json/v1/1')
abstract class MealService {
  factory MealService(Dio dio, {String baseUrl}) = _MealService;

 
   @GET("/search.php")
  Future<HttpResponse<SearchModel>> searchMeal(
    @Query("s") String query,
  );

  @GET('/lookup.php')
  Future<HttpResponse<MealDetailsModel>> getMealDetails(
    @Query('i') String id);
  
  @GET('/random.php')
  Future<HttpResponse<MealRandomModel>>getRandomMeal();
 
  @GET('/list.php?c=list')
  Future<HttpResponse<ListCategoryModel>> listCategoryMeal();
 
  @GET('/filter.php')
  Future<HttpResponse<MealFilterModel>> filterMeal(@Query('c') String query);

  @GET('/list.php?a=list')
  Future<HttpResponse<AreaModel>> listAreaMeal();

   @GET('/filter.php')
  Future<HttpResponse<AreaFilterModel>> filterArea(@Query('a') String query);
 
  
}
