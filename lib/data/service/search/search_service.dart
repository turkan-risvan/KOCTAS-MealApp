import 'package:dio/dio.dart';
import 'package:recipes_app/model/search_model.dart';

import 'package:retrofit/retrofit.dart';


part 'search_service.g.dart';

@RestApi(baseUrl: "https://www.themealdb.com/api/json/v1/1")
abstract class SearchService {
  factory SearchService(Dio dio, {String baseUrl}) = _SearchService;

  @GET("/search.php/?f=a")
  Future<SearchModel> searchMeal(@Query('s') String query);
}

