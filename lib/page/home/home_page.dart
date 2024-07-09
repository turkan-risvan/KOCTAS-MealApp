// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:recipes_app/page/categories/categories_page.dart';
// import 'package:recipes_app/page/meal_random/meal_random_page.dart';
// import 'package:recipes_app/page/search/search_viewmodel.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: (value) {
//                 Provider.of<SearchViewModel>(context, listen: false).searchMeal(value);
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search meals...',
//                 contentPadding: EdgeInsets.all(10),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Column(
//               children: [
//                 MealPage(), // Random Meal Widget
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => CategoriesPage()),
//                     );
//                   },
//                   child: Text('Choose Categories'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
