import 'package:flutter/material.dart';

import 'package:recipes_app/data/repo/search_repostory.dart';
import 'package:recipes_app/model/search_model.dart';


class SearchViewModel extends ChangeNotifier {
  final SearchRepository _repository;
  SearchModel? _searchResults;

  SearchViewModel(this._repository);

  SearchModel? get searchResults => _searchResults;

  Future<void> searchMeal(String query) async {
    try {
      _searchResults = await _repository.searchMeal(query);
      notifyListeners();
    } catch (e) {
      print('Failed to search meal: $e');
    }
  }
}

