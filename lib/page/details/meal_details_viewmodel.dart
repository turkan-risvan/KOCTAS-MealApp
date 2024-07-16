import 'package:flutter/material.dart';
import 'package:recipes_app/model/meal_details/meal_deails_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipes_app/data/repo/repository.dart';
 

class MealDetailsViewModel extends ChangeNotifier {
  final MealDetailsRepository _repository;

  MealDetailsViewModel(this._repository);

  MealDetailsModel? _mealDetails;
  String? _errorMessage;

  MealDetailsModel? get mealDetails => _mealDetails;
  String? get errorMessage => _errorMessage;

  Future<void> fetchMealDetails(String mealId) async {
    try {
      final response = await _repository.fetchMealDetails(mealId);
      _mealDetails = response;
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = "Error: $e";
      notifyListeners();
    }
  }

  Future<void> toggleFavorite(String mealId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    if (favorites.contains(mealId)) {
      favorites.remove(mealId);
    } else {
      favorites.add(mealId);
    }
    await prefs.setStringList('favorites', favorites);
    notifyListeners();
  }

  Future<bool> isFavorite(String mealId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    return favorites.contains(mealId);
  }
}
