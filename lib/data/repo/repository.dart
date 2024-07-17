import 'package:recipes_app/data/service/meal_service.dart';
import 'package:recipes_app/model/area/area_model.dart';
import 'package:recipes_app/model/area_filter/area_filter_model.dart';
import 'package:recipes_app/model/list_category/list_category_model.dart';
import 'package:recipes_app/model/meal_details/meal_deails_model.dart';
import 'package:recipes_app/model/meal_filter/meal_filter_model.dart';
import 'package:recipes_app/model/meal_random/meal_random_model.dart';
import 'package:recipes_app/model/search/search_model.dart';
import 'package:retrofit/dio.dart';

class MealDetailsRepository {
  final MealService _mealService;

  MealDetailsRepository(this._mealService);

  Future<MealDetailsModel> fetchMealDetails(String id) async {
    try {
      final response = await _mealService.getMealDetails(id);
      return response.data!;
    } catch (e) {
      throw Exception('Failed to load meal details: $e');
    }
  }
}

class SearchRepository {
  final MealService _service;

  SearchRepository(this._service);

  Future<HttpResponse<SearchModel>> searchMeal(String query) async {
    try {
      final response = await _service.searchMeal(query);
      return response;
    } catch (e) {
      throw Exception('Failed to search meals: $e');
    }
  }
}

class MealFilterRepository {
  final MealService _service;

  MealFilterRepository(this._service);

  Future<HttpResponse<MealFilterModel>> filterMeal(String query) async {
    try {
      final response = await _service.filterMeal(query);
      return response;
    } catch (e) {
      throw Exception('Failed to filter meals: $e');
    }
  }

  Future<HttpResponse<ListCategoryModel>> listCategoryMeal() async {
    try {
      final response = await _service.listCategoryMeal();
      return response;
    } catch (e) {
      throw Exception('Failed to list meal categories: $e');
    }
  }
}

class AreaFilterRepository {
  final MealService _service;

  AreaFilterRepository(this._service);

  Future<HttpResponse<AreaFilterModel>> filterArea(String query) async {
    try {
      final response = await _service.filterArea(query);
      return response;
    } catch (e) {
      throw Exception('Failed to filter areas: $e');
    }
  }

  Future<HttpResponse<AreaModel>> listAreaMeal() async {
    try {
      final response = await _service.listAreaMeal();
      return response;
    } catch (e) {
      throw Exception('Failed to list areas: $e');
    }
  }
}

class RandomRepository {
  final MealService _service;

  RandomRepository(this._service);

  Future<HttpResponse<MealRandomModel>> getRandomMeal() async {
    try {
      final response = await _service.getRandomMeal();
      return response;
    } catch (e) {
      throw Exception('Failed to get random meal: $e');
    }
  }
}
