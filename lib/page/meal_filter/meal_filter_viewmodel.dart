import 'package:flutter/material.dart';
 
import 'package:recipes_app/data/repo/repository.dart';
import 'package:recipes_app/model/list_category/list_category_model.dart';
import 'package:recipes_app/model/meal_filter/meal_filter_model.dart';

class MealFilterViewModel extends ChangeNotifier {
  final MealFilterRepository _repository;

  MealFilterViewModel(this._repository);

  ListCategoryModel? _mealCategories;
  MealFilterModel? _filterResults;
  String? _errorMessage;

  ListCategoryModel? get mealCategories => _mealCategories;
  MealFilterModel? get filterResults => _filterResults;
  String? get errorMessage => _errorMessage;

  Future<void> listMeals() async {
    try {
      final response = await _repository.listCategoryMeal();
      _mealCategories = response.data;
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = "Error: $e";
      notifyListeners();
    }
  }

  Future<void> filterMeals(String category) async {
    try {
      final response = await _repository.filterMeal(category);
      _filterResults = response.data;
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = "Error: $e";
      notifyListeners();
    }
  }
}
