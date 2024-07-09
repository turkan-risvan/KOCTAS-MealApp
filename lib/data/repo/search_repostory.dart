// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:recipes_app/model/search/search_model.dart';


// class SearchRepository {
//   final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/search.php?s=';

//   Future<SearchModel> searchMeal(String query) async {
//     final response = await http.get(Uri.parse('$_baseUrl$query'));

//     if (response.statusCode == 200) {
//       return SearchModel.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to search meal');
//     }
//   }
// }
