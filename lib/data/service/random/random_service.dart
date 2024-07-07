import 'package:dio/dio.dart';
import 'package:recipes_app/model/meal_deails_model.dart';

import 'package:retrofit/retrofit.dart';


part 'random_service.g.dart';

@RestApi(baseUrl: "https://www.themealdb.com/api/json/v1/1")
abstract class RandomService {
  factory RandomService(Dio dio, {String baseUrl}) = _RandomService;

  @GET("/random.php")
  Future<MealDetailsModel> getRandomMeal();
}
