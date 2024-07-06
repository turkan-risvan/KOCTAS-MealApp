import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipes_app/model/categories_model.dart';

class CategoriesRepository {
  final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/categories.php';

  Future<CategoriesModel> fetchCategories() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return CategoriesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
