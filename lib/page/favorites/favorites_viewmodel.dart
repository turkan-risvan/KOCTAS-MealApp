import 'package:flutter/material.dart';
import 'package:recipes_app/model/meal_random/meal_random_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
class FavoritesViewModel extends ChangeNotifier {
  List<Meal> _favorites = [];

  List<Meal> get favorites => _favorites;

  FavoritesViewModel() {
    _loadFavorites();
  }

  void toggleFavorite(Meal meal) async {
    if (_favorites.contains(meal)) {
      _favorites.remove(meal);
    } else {
      _favorites.add(meal);
    }
    notifyListeners();
    await _saveFavorites();
  }

  bool isFavorite(Meal meal) {
    return _favorites.contains(meal);
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> mealIds = _favorites.map((meal) => meal.idMeal!).toList();
    prefs.setStringList('favorites', mealIds);
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? mealIds = prefs.getStringList('favorites');
    if (mealIds != null) {
      // Burada Meal objelerini id'leri ile yeniden oluşturmanız gerekebilir.
      // Örneğin, Meal sınıfına bir fromId metodu ekleyebilirsiniz.
      _favorites = mealIds.map((id) => Meal(idMeal: id)).toList();
      notifyListeners();
    }
  }

  void removeFavorite(String s) {}

  void addFavorite(String s) {}
}
