import 'package:flutter/material.dart';
import 'package:recipes_app/data/repo/repository.dart';
import 'package:recipes_app/model/meal_details/meal_deails_model.dart';
 

class MealDetailsViewModel extends ChangeNotifier {
  final MealDetailsRepository _repository;
  MealDetailsModel? _mealDetails;
  String? _errorMessage;

  MealDetailsModel? get mealDetails => _mealDetails;
  String? get errorMessage => _errorMessage;

  MealDetailsViewModel(this._repository);

  Future<void> fetchMealDetails(String id) async {
    try {
      _mealDetails = await _repository.fetchMealDetails(id);
    } catch (e) {
      _errorMessage = 'Failed to load meal details: $e';
    } finally {
      if (!disposed) {
        notifyListeners();
      }
    }
  }

  bool disposed = false;
  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }
}
