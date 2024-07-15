import 'package:flutter/material.dart';
import 'package:recipes_app/data/repo/repository.dart';
import 'package:recipes_app/model/meal_random/meal_random_model.dart';
 

class RandomMealViewModel extends ChangeNotifier {
  final RandomRepository _repository;

  MealRandomModel? randomMeal;
  bool isLoading = false;
  String? errorMessage;

  RandomMealViewModel(this._repository);

  Future<void> fetchRandomMeal() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await _repository.getRandomMeal();
      randomMeal = response.data;
    } catch (e) {
      errorMessage = 'Failed to fetch random meal: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
