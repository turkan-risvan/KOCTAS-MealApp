import 'package:flutter/material.dart';
import 'package:recipes_app/data/repo/repository.dart';
 
import 'package:recipes_app/model/area/area_model.dart';
import 'package:recipes_app/model/area_filter/area_filter_model.dart';
 
 
 
 

class AreaFilterViewModel extends ChangeNotifier {
  final AreaFilterRepository _repository;

  AreaFilterViewModel(this._repository);

  AreaModel? _areaCategories;
  AreaFilterModel? _filterResults;
  String? _errorMessage;

  AreaModel? get areaCategories => _areaCategories;
  AreaFilterModel? get filterResults => _filterResults;
  String? get errorMessage => _errorMessage;

  Future<void> listAreas() async {
    try {
      final response = await _repository.listAreaMeal();
      _areaCategories = response.data;
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = "Error: $e";
      notifyListeners();
    }
  }

  Future<void> filterAreas(String category) async {
    try {
      final response = await _repository.filterArea(category);
      _filterResults = response.data;
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = "Error: $e";
      notifyListeners();
    }
  }
}
