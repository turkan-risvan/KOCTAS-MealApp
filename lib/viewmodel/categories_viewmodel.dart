import 'package:flutter/material.dart';
import 'package:recipes_app/model/categories_model.dart';
import 'package:recipes_app/repo/categories_repostory.dart';
 

class CategoriesViewModel extends ChangeNotifier {
  final CategoriesRepository _repository;
  CategoriesModel? _categories;

  CategoriesViewModel(this._repository);

  CategoriesModel? get categories => _categories;

  Future<void> fetchCategories() async {
    try {
      _categories = await _repository.fetchCategories();
      notifyListeners();
    } catch (e) {
      print('Failed to fetch categories: $e');
    }
  }
}
