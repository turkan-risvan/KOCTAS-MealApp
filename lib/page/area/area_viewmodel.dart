// import 'package:flutter/material.dart';
// import 'package:recipes_app/data/repo/repository.dart';
// import 'package:recipes_app/data/service/meal_service.dart';
// import 'package:recipes_app/models/area_model.dart';
// import 'package:dio/dio.dart';

// class AreaViewModel extends ChangeNotifier {
//   List<Area>? areas;
//   String? errorMessage;

//   final repository = AreaRepository(MealService(Dio()));

//   Future<void> fetchAreas() async {
//     try {
//       final result = await repository.fetchAreas();
//       areas = result;
//       errorMessage = null;
//     } catch (error) {
//       errorMessage = error.toString();
//     }
//     notifyListeners();
//   }
// }
