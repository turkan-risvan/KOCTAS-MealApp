// categories_view_model.dart
import 'package:flutter/material.dart';

import 'package:recipes_app/data/repo/categories_repostory.dart';
import 'package:recipes_app/model/categories_model.dart';
 

class CategoriesViewModel extends ChangeNotifier {
  final CategoriesRepository _repository;
  CategoriesModel? _categories;
  bool _isLoading = false;

  CategoriesViewModel(this._repository);

  CategoriesModel? get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();

    try {
      _categories = await _repository.fetchCategories();
    } catch (e) {
      print('Failed to fetch categories: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
