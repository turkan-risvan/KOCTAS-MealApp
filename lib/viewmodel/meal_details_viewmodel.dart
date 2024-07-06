import 'package:flutter/material.dart';
import 'package:recipes_app/model/meal_deails_model.dart';
import 'package:recipes_app/repo/meal_details_repostory.dart';
 

class MealDetailsViewModel extends ChangeNotifier {
  final MealDetailsRepository _repository;
  MealDetailsModel? _mealDetails;

  MealDetailsViewModel(this._repository);

  MealDetailsModel? get mealDetails => _mealDetails;

  Future<void> fetchMealDetails(String id) async {
    try {
      _mealDetails = await _repository.fetchMealDetails(id);
      notifyListeners();
    } catch (e) {
      print('Failed to fetch meal details: $e');
    }
  }
}
