import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:recipes_app/model/meal_deails_model.dart';

class MealDetailsRepository {
  Future<MealDetailsModel> fetchMealDetails(String id) async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id'));

    if (response.statusCode == 200) {
      try {
        return MealDetailsModel.fromJson(json.decode(response.body));
      } catch (e) {
        print('Failed to parse JSON: $e');
        throw Exception('Failed to parse JSON');
      }
    } else {
      throw Exception('Failed to load meal details');
    }
  }
}
