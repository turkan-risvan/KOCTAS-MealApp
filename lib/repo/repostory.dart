import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipes_app/model/meal_random_model.dart';

class MealRepository {
  Future<MealRandomModel> fetchRandomMeal() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));

    if (response.statusCode == 200) {
      return MealRandomModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load random meal');
    }
  }
}
