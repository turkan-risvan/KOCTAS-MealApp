// import 'package:flutter/material.dart';
 
// import 'package:recipes_app/data/repo/repository.dart';
// import 'package:recipes_app/model/meal_random/meal_random_model.dart';
 

// class MealRandomViewModel extends ChangeNotifier {
//   final MealRepository _mealRepository;
//   MealRandomModel? meal;
//   bool isLoading = false;
//   String? errorMessage;

//   MealRandomViewModel(this._mealRepository);

//   Future<void> fetchRandomMeal() async {
//     isLoading = true;
//     notifyListeners();

//     try {
//       meal = await _mealRepository.fetchRandomMeal();
//       errorMessage = null;
//     } catch (error) {
//       errorMessage = error.toString();
//       meal = null;
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }
