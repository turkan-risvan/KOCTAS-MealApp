import 'package:flutter/material.dart';

import 'package:recipes_app/data/repo/details_repostory.dart';
import 'package:recipes_app/model/meal_deails_model.dart';


class MealDetailsViewModel extends ChangeNotifier {
  final MealDetailsRepository _repository;
  MealDetailsModel? _mealDetails;
  bool _isLoading = false;

  MealDetailsViewModel(this._repository);

  MealDetailsModel? get mealDetails => _mealDetails;
  bool get isLoading => _isLoading;

  Future<void> fetchMealDetails(String id) async {
    _isLoading = true;
    notifyListeners();

    try {
      _mealDetails = await _repository.fetchMealDetails(id);
    } catch (e) {
      print('Failed to fetch meal details: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
