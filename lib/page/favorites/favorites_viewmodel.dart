// import 'package:flutter/material.dart';
// import 'package:recipes_app/model/meal_random/meal_random_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
 

// class FavoritesViewModel extends ChangeNotifier {
//   List<Meal> _favorites = [];

//   List<Meal> get favorites => _favorites;

//   FavoritesViewModel() {
//     _loadFavorites();
//   }

//   void addFavorite(Meal meal) {
//     _favorites.add(meal);
//     _saveFavorites();
//     notifyListeners();
//   }

//   void removeFavorite(Meal meal) {
//     _favorites.removeWhere((fav) => fav.idMeal == meal.idMeal);
//     _saveFavorites();
//     notifyListeners();
//   }

//   bool isFavorite(String idMeal) {
//     return _favorites.any((meal) => meal.idMeal == idMeal);
//   }

//   Future<void> _loadFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     final String? favoritesJson = prefs.getString('favorites');
//     if (favoritesJson != null) {
//       final List decoded = jsonDecode(favoritesJson);
//       _favorites = decoded.map((meal) => Meal.fromJson(meal)).toList();
//       notifyListeners();
//     }
//   }

//   Future<void> _saveFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     final String encoded = jsonEncode(_favorites.map((meal) => meal.toJson()).toList());
//     prefs.setString('favorites', encoded);
//   }
// }
