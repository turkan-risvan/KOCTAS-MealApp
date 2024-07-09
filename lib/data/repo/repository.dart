 
import 'package:recipes_app/data/service/meal_service.dart';
import 'package:recipes_app/model/categories/categories_model.dart';
import 'package:recipes_app/model/meal_details/meal_deails_model.dart';
import 'package:recipes_app/model/meal_random/meal_random_model.dart';
import 'package:recipes_app/model/search/search_model.dart';

class CategoriesRepository {
  final MealService _mealService;

  CategoriesRepository(this._mealService);

  Future<CategoriesModel> fetchCategories() async {
    try {
      return await _mealService.getCategories();
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }
}

class MealDetailsRepository {
  final MealService _mealService;

  MealDetailsRepository(this._mealService);

  Future<MealDetailsModel> fetchMealDetails(String id) async {
    try {
      return await _mealService.getMealDetails(id);
    } catch (e) {
      throw Exception('Failed to load meal details: $e');
    }
  }
}

class SearchRepository {
  final MealService _service;

  SearchRepository(this._service);

  Future<SearchModel> searchMeal(String query) => _service.searchMeal(query);
}
 



 

 



