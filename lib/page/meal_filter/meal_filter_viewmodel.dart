// import 'package:flutter/material.dart';
// import 'package:recipes_app/data/repo/repository.dart';
 
// import 'package:recipes_app/model/meal_filter/meal_filter_model.dart';
 

// class MealFilterViewModel extends ChangeNotifier {
//   final MealFilterRepository _repository;

//   MealFilterViewModel(this._repository);

//   MealFilterModel? _filterResults;
//   String? _errorMessage;

//   MealFilterModel? get filterResults => _filterResults;
//   String? get errorMessage => _errorMessage;

//   Future<void> filterMeals(String query) async {
//     try {
//       final response = await _repository.filterMeal(query);
//       if (response.response.statusCode == 200) {
//         _filterResults = response.data;
//       } else {
//         _errorMessage = 'Error: ${response.response.statusCode}';
//       }
//       notifyListeners();
//     } catch (e) {
//       _errorMessage = 'Error: $e';
//       notifyListeners();
//     }
//   }

//   // Future<void> listMeals() async {
//   //   try {
//   //     final response = await _repository.listMeal();
//   //     if (response.response.statusCode == 200) {
//   //       _filterResults = response.data;
//   //     } else {
//   //       _errorMessage = 'Error: ${response.response.statusCode}';
//   //     }
//   //     notifyListeners();
//   //   } catch (e) {
//   //     _errorMessage = 'Error: $e';
//   //     notifyListeners();
//   //   }
//   // }
// }
