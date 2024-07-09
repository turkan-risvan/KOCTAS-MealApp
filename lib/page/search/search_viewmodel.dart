import 'package:flutter/material.dart';
import 'package:recipes_app/data/repo/repository.dart';
import 'package:recipes_app/model/search/search_model.dart';

class SearchViewModel extends ChangeNotifier {
  final SearchRepository _repository;

  SearchViewModel(this._repository);

  SearchModel? _searchResults;

  SearchModel? get searchResults => _searchResults;

  Future<void> searchMeals(String query) async {
    try {
      _searchResults = await _repository.searchMeal(query);
      notifyListeners();
    } catch (e) {
      // Handle error
      print("Error: $e");
    }
  }
}