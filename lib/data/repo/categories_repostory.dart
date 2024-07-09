 

// import 'dart:convert';


// import 'package:http/http.dart' as http;
// import 'package:recipes_app/model/categories/categories_model.dart';
// class CategoriesRepository {
//   final String apiUrl = "https://www.themealdb.com/api/json/v1/1/categories.php";

//   Future<CategoriesModel> fetchCategories() async {
//     final response = await http.get(Uri.parse(apiUrl));

//     // print('Response status: ${response.statusCode}');
//     // print('Response body: ${response.body}');

//     if (response.statusCode == 200) {
//       try {
//         return CategoriesModel.fromJson(json.decode(response.body));
//       } catch (e) {
//         //print('Failed to parse JSON: $e');
//         throw Exception('Failed to parse JSON');
//       }
//     } else {
//       throw Exception('Failed to load categories');
//     }
//   }
// }
