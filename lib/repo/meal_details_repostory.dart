import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipes_app/model/meal_deails_model.dart';
 

class MealDetailsRepository {
  final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=';

  Future<MealDetailsModel> fetchMealDetails(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl$id'));

    if (response.statusCode == 200) {
      return MealDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load meal details');
    }
  }
}
