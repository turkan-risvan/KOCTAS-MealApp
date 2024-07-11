import 'package:flutter/material.dart';
import 'package:recipes_app/data/repo/repository.dart';
import 'package:recipes_app/model/search/search_model.dart';

class SearchViewModel extends ChangeNotifier {
  final SearchRepository _repository;

  SearchViewModel(this._repository);

  SearchModel? _searchResults;
  String? _errorMessage;

  SearchModel? get searchResults => _searchResults;
  String? get errorMessage => _errorMessage;

  Future<void> searchMeals(String query) async {
    if (query.isEmpty) {
      _searchResults = null;
      notifyListeners();
      return;
    }

    try {
      final response = await _repository.searchMeal(query);
      if (response.response.statusCode == 200) {
        _searchResults = response.data;
      } else {
        _errorMessage = 'Error: ${response.response.statusCode}';
      }
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Error: $e';
      notifyListeners();
    }
  }
}
