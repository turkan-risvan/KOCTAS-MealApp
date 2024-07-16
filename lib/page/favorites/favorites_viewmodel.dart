import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesViewModel extends ChangeNotifier {
  List<String> _favorites = [];

  List<String> get favorites => _favorites;

  FavoritesViewModel() {
    _loadFavorites();
  }

  void _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _favorites = prefs.getStringList('favorites') ?? [];
    notifyListeners();
  }

  Future<void> addFavorite(String mealId) async {
    _favorites.add(mealId);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', _favorites);
    notifyListeners();
  }

  Future<void> removeFavorite(String mealId) async {
    _favorites.remove(mealId);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', _favorites);
    notifyListeners();
  }
}
